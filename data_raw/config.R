data_raw_env <- Sys.getenv("DATA_RAW_PATH")

if (data_raw_env == "") {
  stop("Env var DATA_RAW_PATH is not set.")
}

DATA_RAW_PATH <- normalizePath(data_raw_env, mustWork = FALSE)
