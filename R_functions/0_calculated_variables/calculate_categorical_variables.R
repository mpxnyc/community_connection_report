calculate_categorical_variables <- function(data, config_list){
  
  data <- data.frame(data)
  
  variables <- config_list[[1]][["variables"]] |>
                          purrr::keep(function(x) x$type == "factor") 
  
  
  eligible_variables_indicator <- names(variables) %in% names(data)
  eligible_variables           <- variables[eligible_variables_indicator]
  
  for (i in seq_along(eligible_variables)){
    name          <- names(eligible_variables)[i]
    
    
    var_label      <- eligible_variables[[i]][["label"]]
    levels         <- eligible_variables[[i]][["response_options"]]  |> names()
    labels         <- eligible_variables[[i]][["response_options"]]  |> unlist()

    data[,name]     <- factor(data[, name] , levels, labels) |> labelled::set_variable_labels(var_label)
    #data[,name]     <-  data[,name] 
    
  }
  
  data
}
