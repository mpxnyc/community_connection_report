calculate_spatial_variables_places <- function(place_data){
  data <- place_data |>
    dplyr::mutate(
                  home_neighborhood    = mpxnyc::convert_spatial_unit_ny(censusTractHome, convert_to = "neighborhood"),
                  home_community       = mpxnyc::convert_spatial_unit_ny(censusTractHome, convert_to = "community"),
                  home_borough         = mpxnyc::convert_spatial_unit_ny(censusTractHome, convert_to = "borough"),
                  place_neighborhood   = mpxnyc::convert_spatial_unit_ny(censusTractPlace, convert_to = "neighborhood"),
                  place_community      = mpxnyc::convert_spatial_unit_ny(censusTractPlace, convert_to = "community"),
                  place_borough        = mpxnyc::convert_spatial_unit_ny(censusTractPlace, convert_to = "borough")
                ) |>
    dplyr::mutate(
                    inHomeCensusTract    = censusTractHome == censusTractPlace,
                    inHomeNeighborhood   = home_neighborhood == place_neighborhood,
                    inHomeCommunity      = home_community == place_community,
                    inHomeBorough        = home_borough == place_borough,
                    distanceFromHome     = ifelse(inHomeCommunity, "Same Community District", ifelse(inHomeBorough, "Same Borough", "Different Borough")) |> 
                      factor(c("Same Community District", "Same Borough",  "Different Borough")),
                    distanceFromHomeExp  = ifelse(inHomeCensusTract, "Same Census Tract", ifelse(inHomeNeighborhood, "Same Neighborhood", ifelse(inHomeCommunity, "Same Community District", ifelse(inHomeBorough, "Same Borough", "Different Borough")))) |> 
                      factor(c("Same Census Tract", "Same Neighborhood", "Same Community District", "Same Borough", "Different Borough"))
                    
                  ) |>
    dplyr::filter(!is.na(home_neighborhood) & !is.na(place_neighborhood)) |>
    dplyr::select(-c(inHomeCensusTract, inHomeCommunity, inHomeNeighborhood, inHomeBorough)) |>
    dplyr::tibble() |>
    dplyr::filter(!is.na(placeSex))
  
  data$home_borough           <- data$home_borough         |> labelled::set_variable_labels("Home borough")
  data$home_community         <- data$home_community       |> labelled::set_variable_labels("Home community")
  data$home_neighborhood      <- data$home_neighborhood    |> labelled::set_variable_labels("Home neighborhood")
  
  data$place_borough           <- data$place_borough         |> labelled::set_variable_labels("Place borough")
  data$place_community         <- data$place_community       |> labelled::set_variable_labels("Place community")
  data$place_neighborhood      <- data$place_neighborhood    |> labelled::set_variable_labels("Place neighborhood")
  
  data$distanceFromHome        <- data$distanceFromHome      |> labelled::set_variable_labels("Distance from home")
  
  data
}








