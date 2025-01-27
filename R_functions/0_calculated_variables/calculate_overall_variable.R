calculate_overall_variable <- function(person_data){
  data <- person_data |>
    dplyr::mutate(
      overall      =  "overall"
    ) 
    
  data$overall <- data$overall |> labelled::set_variable_labels("Overall")
  data
}