// Set path to raw data from environment variable.
local data_raw_path = "`: env DATA_RAW_PATH'"

if "`data_raw_path'" == "" {
    display as yellow "Warning: Environment variable DATA_RAW_PATH not set."
}
else {
    global data_raw_path "`data_raw_path'"
    display as result "Using DATA_RAW_PATH: $data_raw_path"
}
