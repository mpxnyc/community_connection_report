load_config_list <- function(path = "__config.json"){
  tidyjson::read_json(path)[["..JSON"]]
  
}

