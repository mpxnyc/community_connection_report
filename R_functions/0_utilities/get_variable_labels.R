get_variable_labels             <- function(variable_name, people_or_places = "people"){
  load_factor_labels()[[people_or_places]][[variable_name]][["levels"]] %>% unlist()
  
}
