get_variable_levels             <- function(variable_name, factor_levels){
  
  variable_levels           <- factor_levels[[variable_name]][["current_levels"]]
  variable_labels           <- factor_levels[[variable_name]][["new_levels"]]
  
  
  return(list(variable_levels = variable_levels, variable_labels = variable_labels))
  
}