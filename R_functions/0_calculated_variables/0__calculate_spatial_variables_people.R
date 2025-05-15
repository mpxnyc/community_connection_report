calculate_spatial_variables_people <- function(person_data){
  data <- person_data |>
              dplyr::mutate(
                borough          = mpxnyc::convert_spatial_unit_ny(censusTractHome, convert_to = "borough"),
                community        = mpxnyc::convert_spatial_unit_ny(censusTractHome, convert_to = "community"),
                neighborhood     = mpxnyc::convert_spatial_unit_ny(censusTractHome, convert_to = "neighborhood")
              )
  
  data$censusTractHome   <- data$censusTractHome |> labelled::set_variable_labels("Home census tract")
  data$borough           <- data$borough         |> labelled::set_variable_labels("Home borough")
  data$community         <- data$community       |> labelled::set_variable_labels("Home community")
  data$neighborhood      <- data$neighborhood   |> labelled::set_variable_labels("Home neighborhood")
  
  data
}