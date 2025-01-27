calculate_cut_variables_date <- function(person_data, config_list){
  
  cut_variables <- config_list[[1]][["variables"]] |>
                          purrr::keep(function(x) x$type == "date") 
  
  for (i in seq_along(cut_variables)){
    name <- names(cut_variables)[i]
    cut_name <- paste0(name, "Cut")
    
    cut_dates <- cut_variables[[i]][["cut_dates"]]  |> unlist() |> lubridate::date()
    cut_labels <- cut_variables[[i]][["cut_labels"]] |> unlist() 
    
    person_data[,cut_name] <- cut(person_data |> dplyr::pull(name) , cut_dates, cut_labels)
  }
  
  person_data
}