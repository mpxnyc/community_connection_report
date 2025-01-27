calculate_cut_variables_numeric <- function(person_data, config_list){
  
  cut_variables <- config_list[[1]][["variables"]] |>
                          purrr::keep(function(x) x$type == "numeric") 
  
  for (i in seq_along(cut_variables)){
    name <- names(cut_variables)[i]
    cut_name <- paste0(name, "Cut")
    
    cut_points <- cut_variables[[i]][["cut_points"]] 
    cut_labels <- cut_variables[[i]][["cut_labels"]] |> unlist() 
    
    person_data[,cut_name] <- cut(person_data |> dplyr::pull(name) |> as.numeric(), cut_points, cut_labels)
  }
  
  person_data
}