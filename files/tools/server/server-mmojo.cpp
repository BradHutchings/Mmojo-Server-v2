/*
  server-mmojo.cpp is a derivative for tools/server/server.cpp.

  This file has been modified to implement Mmojo Server specific
  Modifications are surrounded by:
    // Mmojo Server START
    // Mmojo Server END
    
  Original server.cpp file:
      https://raw.githubusercontent.com/ggml-org/llama.cpp/refs/heads/master/tools/server/server.cpp

  -Brad 2025-11-09
  --
  Brad Hutchings
  brad@bradhutchings.com
*/

#include "server-context.h"
#include "server-http.h"
#include "server-models.h"

#include "arg.h"
#include "common.h"
#include "llama.h"
#include "log.h"

#include <atomic>
#include <signal.h>
#include <thread> // for std::thread::hardware_concurrency

#if defined(_WIN32)
#include <windows.h>
#endif

// Mmojo Server START
// This could be automated by searching for "using json =" and inserting this block before.
#include <linux/limits.h>
#include <sys/stat.h>
#include <dirent.h>
#include <unistd.h>
#include "mmojo-args.h"

#define PROCESS_NAME "mmojo-server"
#define ARGS_FILENAME "mmojo-server-args"
#define SUPPORT_DIRECTORY_NAME "mmojo-server-support"

// pre C++20 helpers.
bool starts_with (const std::string &fullString, const std::string &beginning);
bool ends_with (const std::string &fullString, const std::string &ending);
void find_first_gguf(const std::string& directoryPath, std::string& ggufPath);
void get_ape_path(const std::string& argv_1, std::string& apePath);

bool starts_with (const std::string &fullString, const std::string &beginning) {
    if (fullString.length() >= beginning.length()) {
        return (0 == fullString.compare (0, beginning.length(), beginning));
    }
    else {
        return false;
    } 
}

bool ends_with (const std::string &fullString, const std::string &ending) {
    if (fullString.length() >= ending.length()) {
        return (0 == fullString.compare (fullString.length() - ending.length(), ending.length(), ending));
    }
    else {
        return false;
    } 
}

void find_first_gguf(const std::string& directoryPath, std::string& ggufPath) {
    ggufPath = "";
  
    DIR *dir;
    struct dirent *entry;

    // Open the directory
    dir = opendir(directoryPath.c_str());
    if (dir != NULL) {
        printf("Looking for .gguf in %s:\n", directoryPath.c_str());
        while ((entry = readdir(dir)) != NULL) {
            // if (directoryPath == "/zip") {
            //     printf("Considering: %s\n", entry->d_name);
            // }
          
            const std::string& filename = entry->d_name;
            const std::string& extension = ".gguf";            
            const std::string& slash = "/";
            if (ends_with(filename, extension)) {
                printf("- %s\n", entry->d_name);
                ggufPath = directoryPath;
                if (!ends_with(ggufPath, slash)) {
                    ggufPath += slash;
                }
                ggufPath += entry->d_name;
                break;
            }
        }
        closedir(dir);
    }
    else {
        perror("Error opening directory");
    }
}

void get_executable_path(const char* argv_0, std::string& executablePath) {
    executablePath = argv_0;
    const std::string slash = "/";

    printf("- get_executable_path()\n");
    printf("  - argv_0: %s\n", argv_0);
    if (!starts_with(executablePath, slash)) {
        printf("  - executablePath does not start with /.\n");
  
        char workingDirectory[PATH_MAX];
        workingDirectory[0] = '\0';

        if (getcwd(workingDirectory, sizeof(workingDirectory) - 1)) {
            strcat(workingDirectory, "/");
            printf("  - workingDirectory: %s\n", workingDirectory);

            executablePath = workingDirectory;
            executablePath += argv_0;
        }
    }
    printf("  - executablePath: %s\n", executablePath.c_str());
}

// Mmojo Server END

static std::function<void(int)> shutdown_handler;
static std::atomic_flag is_terminating = ATOMIC_FLAG_INIT;

static inline void signal_handler(int signal) {
    if (is_terminating.test_and_set()) {
        // in case it hangs, we can force terminate the server by hitting Ctrl+C twice
        // this is for better developer experience, we can remove when the server is stable enough
        fprintf(stderr, "Received second interrupt, terminating immediately.\n");
        exit(1);
    }

    shutdown_handler(signal);
}

// wrapper function that handles exceptions and logs errors
// this is to make sure handler_t never throws exceptions; instead, it returns an error response
static server_http_context::handler_t ex_wrapper(server_http_context::handler_t func) {
    return [func = std::move(func)](const server_http_req & req) -> server_http_res_ptr {
        std::string message;
        error_type error;
        try {
            return func(req);
        } catch (const std::invalid_argument & e) {
            error = ERROR_TYPE_INVALID_REQUEST;
            message = e.what();
        } catch (const std::exception & e) {
            error = ERROR_TYPE_SERVER;
            message = e.what();
        } catch (...) {
            error = ERROR_TYPE_SERVER;
            message = "unknown error";
        }

        auto res = std::make_unique<server_http_res>();
        res->status = 500;
        try {
            json error_data = format_error_response(message, error);
            res->status = json_value(error_data, "code", 500);
            res->data = safe_json_to_str({{ "error", error_data }});
            SRV_WRN("got exception: %s\n", res->data.c_str());
        } catch (const std::exception & e) {
            SRV_ERR("got another exception: %s | while handling exception: %s\n", e.what(), message.c_str());
            res->data = "Internal Server Error";
        }
        return res;
    };
}

int main(int argc, char ** argv, char ** envp) {
    // Mmojo Server START
    // This could be automated by looking for "int main(" and inserting this block immediately after. -Brad 2025-11-05

    // Keep the build from showing up as ape in the process list.
    pthread_setname_np(pthread_self(), PROCESS_NAME);

    // This implements an args file feature inspired by llamafile's.
    // It does not require Cosmo anymore, as the mmojo_args function is part of mmojo-server now.
    // Path parameters passed on command line or in args files are relative to the working directory.

    char pathChar[PATH_MAX];
    pathChar[0] = '\0';

    printf("argv[0]: %s\n", argv[0]);
    printf("argv[1]: %s\n", argv[1]);
    printf("argv[2]: %s\n", argv[2]);

    std::string executablePath = "";
    get_executable_path(argv[0], executablePath);
    printf("executablePath: %s", executablePath.c_str());
    
    // Args files if present. The names are different to remove confusion during packaging.
    const std::string argsFilename = ARGS_FILENAME;
    const std::string supportDirectoryName = SUPPORT_DIRECTORY_NAME;
    const std::string supportArgsFilename = ARGS_FILENAME;
    const std::string zipArgsPath = "/zip/" ARGS_FILENAME;
    const std::string zipPath = "/zip";
    const std::string zipPathSlash = "/zip/";

    std::string path = pathChar;
    std::string argsPath = path + argsFilename;
    std::string supportPath = path + supportDirectoryName + "/";
    std::string supportArgsPath = supportPath + supportArgsFilename;
    std::string firstGguf = "";

    if (firstGguf == "") {
        find_first_gguf(path, firstGguf);
    }
    if (firstGguf == "") {
        find_first_gguf(supportPath, firstGguf);
    }
    #ifdef COSMOCC
    if (firstGguf == "") {
        find_first_gguf(zipPath, firstGguf);
    }
    #endif

    #if 1
    printf("Paths of things we care about:\n");
    printf("-  executablePath: %s\n", executablePath.c_str());
    printf("-            path: %s\n", path.c_str());
    printf("-        argsPath: %s\n", argsPath.c_str());
    printf("-     supportPath: %s\n", supportPath.c_str());
    printf("- supportArgsPath: %s\n", supportArgsPath.c_str());
    printf("-     zipArgsPath: %s\n", zipArgsPath.c_str());
    printf("        firstGguf: %s\n", firstGguf.c_str());
  
    struct stat buffer1;
    if (stat(path.c_str(), &buffer1) == 0) {
        printf("-            path exists: %s\n", path.c_str());
    }
    if (stat(argsPath.c_str(), &buffer1) == 0) {
        printf("-        argsPath exists: %s\n", argsPath.c_str());
    }
    if (stat(supportArgsPath.c_str(), &buffer1) == 0) {
        printf("- supportArgsPath exists: %s\n", supportArgsPath.c_str());
    }
    if (stat(zipArgsPath.c_str(), &buffer1) == 0) {
        printf("-     zipArgsPath exists: %s\n", zipArgsPath.c_str());
    }
    printf("\n");
    #endif
    
    // mmojo-server-support/default-args will be an option for platform optimized builds.
    // const std::string& supportArgsFilename = "mmojo-server-support/default-args";
    struct stat buffer;

    // At this point, argc, argv represent:
    //     command (User supplied args)

    if (stat (argsPath.c_str(), &buffer) == 0) {
        argc = mmojo_args(argsPath.c_str(), &argv);
    }

    // At this point, argc, argv represent:
    //     command (argsPath args) (User supplied args)

    if (stat (supportArgsPath.c_str(), &buffer) == 0) {
        argc = mmojo_args(supportArgsPath.c_str(), &argv);
    }

    // At this point, argc, argv represent:
    //     command (supportArgsPath args) (argsPath args) (User supplied args)

    #ifdef COSMOCC
    if (stat (zipArgsPath.c_str(), &buffer) == 0) {
        argc = mmojo_args(zipArgsPath.c_str(), &argv);
    }

    // At this point, argc, argv represent:
    //     command (zipArgsPath args) (supportArgsPath args) (argsPath args) (User supplied args)
    #endif
    
    // Yep, this is counterintuitive, but how the cosmo_args command works.
    // Mmojo Server END

    // own arguments required by this example
    common_params params;

    if (!common_params_parse(argc, argv, params, LLAMA_EXAMPLE_SERVER)) {
        return 1;
    }

    // If we have no model path at this point, use the firstGguf.
    // I think I have all the possibilities for specifying a model covered here.
    if ((params.model.path == "") && (params.model.url == "") && (params.model.docker_repo == "") &&  
        (params.model.hf_repo == "") && (params.model.hf_file == "")) {
        params.model.path = firstGguf;
    }

    if (starts_with(params.model.path, zipPathSlash)) {
        // if the gguf is in the zip file, we have to turn off use_map.
        printf("\nThe model file is in /zip, so turning off use_mmap.\n\n");
        params.use_mmap = false;
    }
  
    // TODO: should we have a separate n_parallel parameter for the server?
    //       https://github.com/ggml-org/llama.cpp/pull/16736#discussion_r2483763177
    // TODO: this is a common configuration that is suitable for most local use cases
    //       however, overriding the parameters is a bit confusing - figure out something more intuitive
    if (params.n_parallel == 1 && params.kv_unified == false && !params.has_speculative()) {
        LOG_WRN("%s: setting n_parallel = 4 and kv_unified = true (add -kvu to disable this)\n", __func__);

        params.n_parallel = 4;
        params.kv_unified = true;
    }

    // for consistency between server router mode and single-model mode, we set the same model name as alias
    if (params.model_alias.empty() && !params.model.name.empty()) {
        params.model_alias = params.model.name;
    }

    // Mmojo Server START
    // This could be automated by looking for "common_init();" and inserting this block immediately after. -Brad 2025-11-05
    // fix params -- model, path, ssl-key-file, ssl-cert-file
    // if they are relative paths, fix to absolute relative to working directory
    if (supportPath != "") {
        const std::string& supportRootPath = "/support/";
        if (starts_with(params.model.path, supportRootPath)) {
            printf("--model path starts with %s.\n",  supportRootPath.c_str());
            std::string s = params.model.path.replace(0, supportRootPath.length(), supportPath);
            printf("  - new model path: %s\n", s.c_str());
        }
        if (starts_with(params.public_path, supportRootPath)) {
            printf("--path path starts with %s.\n",  supportRootPath.c_str());
            std::string s = params.public_path.replace(0, supportRootPath.length(), supportPath);
            printf("  - new path path: %s\n", s.c_str());
        }
        if (starts_with(params.ssl_file_key, supportRootPath)) {
            printf("--ssl-key-file path starts with %s.\n",  supportRootPath.c_str());
            std::string s = params.ssl_file_key.replace(0, supportRootPath.length(), supportPath);
            printf("  - new ssl-key-file path: %s\n", s.c_str());
        }
        if (starts_with(params.ssl_file_cert, supportRootPath)) {
            printf("--ssl-cert-file path starts with %s.\n",  supportRootPath.c_str());
            std::string s = params.ssl_file_cert.replace(0, supportRootPath.length(), supportPath);
            printf("  - new ssl-cert-file path: %s\n", s.c_str());
        }
    }
    // Mmojo Server END
  
    common_init();

    // struct that contains llama context and inference
    server_context ctx_server;

    llama_backend_init();
    llama_numa_init(params.numa);

    LOG_INF("system info: n_threads = %d, n_threads_batch = %d, total_threads = %d\n", params.cpuparams.n_threads, params.cpuparams_batch.n_threads, std::thread::hardware_concurrency());
    LOG_INF("\n");
    LOG_INF("%s\n", common_params_get_system_info(params).c_str());
    LOG_INF("\n");

    server_http_context ctx_http;
    if (!ctx_http.init(params)) {
        LOG_ERR("%s: failed to initialize HTTP server\n", __func__);
        return 1;
    }

    //
    // Router
    //

    // register API routes
    server_routes routes(params, ctx_server, [&ctx_http]() { return ctx_http.is_ready.load(); });

    bool is_router_server = params.model.path.empty();
    std::optional<server_models_routes> models_routes{};
    if (is_router_server) {
        // setup server instances manager
        models_routes.emplace(params, argc, argv, envp);

        // proxy handlers
        // note: routes.get_health stays the same
        routes.get_metrics                 = models_routes->proxy_get;
        routes.post_props                  = models_routes->proxy_post;
        routes.get_api_show                = models_routes->proxy_get;
        routes.post_completions            = models_routes->proxy_post;
        routes.post_completions_oai        = models_routes->proxy_post;
        routes.post_chat_completions       = models_routes->proxy_post;
        routes.post_anthropic_messages     = models_routes->proxy_post;
        routes.post_anthropic_count_tokens = models_routes->proxy_post;
        routes.post_infill                 = models_routes->proxy_post;
        routes.post_embeddings             = models_routes->proxy_post;
        routes.post_embeddings_oai         = models_routes->proxy_post;
        routes.post_rerank                 = models_routes->proxy_post;
        routes.post_tokenize               = models_routes->proxy_post;
        routes.post_detokenize             = models_routes->proxy_post;
        routes.post_apply_template         = models_routes->proxy_post;
        routes.get_lora_adapters           = models_routes->proxy_get;
        routes.post_lora_adapters          = models_routes->proxy_post;
        routes.get_slots                   = models_routes->proxy_get;
        routes.post_slots                  = models_routes->proxy_post;

        // custom routes for router
        routes.get_props  = models_routes->get_router_props;
        routes.get_models = models_routes->get_router_models;
        ctx_http.post("/models/load",   ex_wrapper(models_routes->post_router_models_load));
        ctx_http.post("/models/unload", ex_wrapper(models_routes->post_router_models_unload));
        ctx_http.post("/models/status", ex_wrapper(models_routes->post_router_models_status));
    }

    ctx_http.get ("/health",              ex_wrapper(routes.get_health)); // public endpoint (no API key check)
    ctx_http.get ("/v1/health",           ex_wrapper(routes.get_health)); // public endpoint (no API key check)
    ctx_http.get ("/metrics",             ex_wrapper(routes.get_metrics));
    ctx_http.get ("/props",               ex_wrapper(routes.get_props));
    ctx_http.post("/props",               ex_wrapper(routes.post_props));
    ctx_http.post("/api/show",            ex_wrapper(routes.get_api_show));
    ctx_http.get ("/models",              ex_wrapper(routes.get_models)); // public endpoint (no API key check)
    ctx_http.get ("/v1/models",           ex_wrapper(routes.get_models)); // public endpoint (no API key check)
    ctx_http.get ("/api/tags",            ex_wrapper(routes.get_models)); // ollama specific endpoint. public endpoint (no API key check)
    ctx_http.post("/completion",          ex_wrapper(routes.post_completions)); // legacy
    ctx_http.post("/completions",         ex_wrapper(routes.post_completions));
    ctx_http.post("/v1/completions",      ex_wrapper(routes.post_completions_oai));
    ctx_http.post("/chat/completions",    ex_wrapper(routes.post_chat_completions));
    ctx_http.post("/v1/chat/completions", ex_wrapper(routes.post_chat_completions));
    ctx_http.post("/api/chat",            ex_wrapper(routes.post_chat_completions)); // ollama specific endpoint
    ctx_http.post("/v1/messages",         ex_wrapper(routes.post_anthropic_messages)); // anthropic messages API
    ctx_http.post("/v1/messages/count_tokens", ex_wrapper(routes.post_anthropic_count_tokens)); // anthropic token counting
    ctx_http.post("/infill",              ex_wrapper(routes.post_infill));
    ctx_http.post("/embedding",           ex_wrapper(routes.post_embeddings)); // legacy
    ctx_http.post("/embeddings",          ex_wrapper(routes.post_embeddings));
    ctx_http.post("/v1/embeddings",       ex_wrapper(routes.post_embeddings_oai));
    ctx_http.post("/rerank",              ex_wrapper(routes.post_rerank));
    ctx_http.post("/reranking",           ex_wrapper(routes.post_rerank));
    ctx_http.post("/v1/rerank",           ex_wrapper(routes.post_rerank));
    ctx_http.post("/v1/reranking",        ex_wrapper(routes.post_rerank));
    ctx_http.post("/tokenize",            ex_wrapper(routes.post_tokenize));
    ctx_http.post("/detokenize",          ex_wrapper(routes.post_detokenize));
    ctx_http.post("/apply-template",      ex_wrapper(routes.post_apply_template));
    // LoRA adapters hotswap
    ctx_http.get ("/lora-adapters",       ex_wrapper(routes.get_lora_adapters));
    ctx_http.post("/lora-adapters",       ex_wrapper(routes.post_lora_adapters));
    // Save & load slots
    ctx_http.get ("/slots",               ex_wrapper(routes.get_slots));
    ctx_http.post("/slots/:id_slot",      ex_wrapper(routes.post_slots));

    //
    // Start the server
    //

    std::function<void()> clean_up;

    if (is_router_server) {
        LOG_INF("%s: starting router server, no model will be loaded in this process\n", __func__);

        clean_up = [&models_routes]() {
            SRV_INF("%s: cleaning up before exit...\n", __func__);
            if (models_routes.has_value()) {
                models_routes->models.unload_all();
            }
            llama_backend_free();
        };

        if (!ctx_http.start()) {
            clean_up();
            LOG_ERR("%s: exiting due to HTTP server error\n", __func__);
            return 1;
        }
        ctx_http.is_ready.store(true);

        shutdown_handler = [&](int) {
            ctx_http.stop();
        };

    } else {
        // setup clean up function, to be called before exit
        clean_up = [&ctx_http, &ctx_server]() {
            SRV_INF("%s: cleaning up before exit...\n", __func__);
            ctx_http.stop();
            ctx_server.terminate();
            llama_backend_free();
        };

        // start the HTTP server before loading the model to be able to serve /health requests
        if (!ctx_http.start()) {
            clean_up();
            LOG_ERR("%s: exiting due to HTTP server error\n", __func__);
            return 1;
        }

        // load the model
        LOG_INF("%s: loading model\n", __func__);

        if (!ctx_server.load_model(params)) {
            clean_up();
            if (ctx_http.thread.joinable()) {
                ctx_http.thread.join();
            }
            LOG_ERR("%s: exiting due to model loading error\n", __func__);
            return 1;
        }

        ctx_server.init();
        ctx_http.is_ready.store(true);

        LOG_INF("%s: model loaded\n", __func__);

        shutdown_handler = [&](int) {
            // this will unblock start_loop()
            ctx_server.terminate();
        };
    }

    // TODO: refactor in common/console
#if defined (__unix__) || (defined (__APPLE__) && defined (__MACH__))
    struct sigaction sigint_action;
    sigint_action.sa_handler = signal_handler;
    sigemptyset (&sigint_action.sa_mask);
    sigint_action.sa_flags = 0;
    sigaction(SIGINT, &sigint_action, NULL);
    sigaction(SIGTERM, &sigint_action, NULL);
#elif defined (_WIN32)
    auto console_ctrl_handler = +[](DWORD ctrl_type) -> BOOL {
        return (ctrl_type == CTRL_C_EVENT) ? (signal_handler(SIGINT), true) : false;
    };
    SetConsoleCtrlHandler(reinterpret_cast<PHANDLER_ROUTINE>(console_ctrl_handler), true);
#endif

    if (is_router_server) {
        LOG_INF("%s: router server is listening on %s\n", __func__, ctx_http.listening_address.c_str());
        LOG_INF("%s: NOTE: router mode is experimental\n", __func__);
        LOG_INF("%s:       it is not recommended to use this mode in untrusted environments\n", __func__);
        if (ctx_http.thread.joinable()) {
            ctx_http.thread.join(); // keep the main thread alive
        }

        // when the HTTP server stops, clean up and exit
        clean_up();
    } else {
        LOG_INF("%s: server is listening on %s\n", __func__, ctx_http.listening_address.c_str());
        LOG_INF("%s: starting the main loop...\n", __func__);

        // optionally, notify router server that this instance is ready
        const char * router_port = std::getenv("LLAMA_SERVER_ROUTER_PORT");
        std::thread monitor_thread;
        if (router_port != nullptr) {
            monitor_thread = server_models::setup_child_server(params, std::atoi(router_port), params.model_alias, shutdown_handler);
        }

        // this call blocks the main thread until queue_tasks.terminate() is called
        ctx_server.start_loop();

        clean_up();
        if (ctx_http.thread.joinable()) {
            ctx_http.thread.join();
        }
        if (monitor_thread.joinable()) {
            monitor_thread.join();
        }
        llama_memory_breakdown_print(ctx_server.get_llama_context());
    }

    return 0;
}
