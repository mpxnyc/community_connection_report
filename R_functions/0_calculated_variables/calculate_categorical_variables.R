calculate_categorical_variables <- function(data, config_list){
  
  variables <- config_list[[1]][["variables"]] |>
    purrr::keep(function(x) x$type == "factor") 
  
  eligible_variables_indicator <- names(variables) %in% names(data)
  eligible_variables           <- variables[eligible_variables_indicator]
  
  for (i in seq_along(eligible_variables)){
    name          <- names(eligible_variables)[i]
    
    
    var_label      <- eligible_variables[[i]][["label"]]
    levels         <- eligible_variables[[i]][["response_options"]]  |> names()
    labels         <- eligible_variables[[i]][["response_options"]]  |> unlist()

    data[,name]     <- factor(data |> dplyr::pull(name) , levels, labels)
    data[,name]     <-  data[,name] |> labelled::set_variable_labels(var_label)
    
  }
  
  data
}
