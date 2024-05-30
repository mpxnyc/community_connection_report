clean_place_data <- function(raw_data_places){

  placeSex_labels             <- c("yes", "no", "i-don't-remember")
  placeSex_levels             <- c("yes", "no", "no")
  intervention_setting_levels <- c("home", "no", "yes")
  intervention_setting_labels <- c("home", "social", "sexual")
  
contact_places <- raw_data_places %>%
                      dplyr::mutate(
                        placeSex             = factor(placeSex, placeSex_labels, placeSex_levels),
                        intervention_setting = ifelse(is.na(placeSex), "home", as.character(placeSex)),
                        intervention_setting = factor(intervention_setting, intervention_setting_levels, intervention_setting_labels),
                        intervention_setting = as.character(intervention_setting),
                        home_neighborhood    = mpxnyc::convert_spatial_unit_ny(censusTractHome, convert_to = "neighborhood"),
                        home_community       = mpxnyc::convert_spatial_unit_ny(censusTractHome, convert_to = "community"),
                        home_borough         = mpxnyc::convert_spatial_unit_ny(censusTractHome, convert_to = "borough"),
                        place_neighborhood   = mpxnyc::convert_spatial_unit_ny(censusTractPlace, convert_to = "neighborhood"),
                        place_community      = mpxnyc::convert_spatial_unit_ny(censusTractPlace, convert_to = "community"),
                        place_borough        = mpxnyc::convert_spatial_unit_ny(censusTractPlace, convert_to = "borough")
                        ) %>%
                      dplyr::mutate(
                        inHomeCensusTract    = censusTractHome == censusTractPlace,
                        inHomeNeighborhood   = home_neighborhood == place_neighborhood,
                        inHomeCommunity      = home_community == place_community,
                        inHomeBorough        = home_borough == place_borough,
                        distanceFromHome     = ifelse(inHomeNeighborhood, "Same Neighborhood", ifelse(inHomeBorough, "Same Borough", "Different Borough")) %>% factor()
                      ) %>%
                      dplyr::filter(!is.na(home_neighborhood) & !is.na(place_neighborhood)) %>%
                      dplyr::select(-c(inHomeCensusTract, inHomeCommunity, inHomeNeighborhood, inHomeBorough)) %>%
                      dplyr::tibble() %>%
                      dplyr::filter(!is.na(placeSex))

contact_places
}

