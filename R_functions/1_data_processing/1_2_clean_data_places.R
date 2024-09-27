clean_data_places <- function(raw_data_places, factor_levels, factor_labels){
  
  placeSex                    <- get_variable_levels("placeSex", factor_levels)
  placeSex_levels             <- placeSex[["variable_levels"]]
  placeSex_labels             <- placeSex[["variable_labels"]]

  intervention_setting        <- get_variable_levels("intervention_setting", factor_levels)
  intervention_setting_levels <- intervention_setting[["variable_levels"]]
  intervention_setting_labels <- intervention_setting[["variable_labels"]]

  
  clean_data <- raw_data_places %>%
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
                        distanceFromHome     = ifelse(inHomeCommunity, "Same Community District", ifelse(inHomeBorough, "Same Borough", "Different Borough")) %>% 
                                                factor(c("Same Community District", "Same Borough",  "Different Borough")),
                        distanceFromHomeExp  = ifelse(inHomeCensusTract, "Same Census Tract", ifelse(inHomeNeighborhood, "Same Neighborhood", ifelse(inHomeCommunity, "Same Community District", ifelse(inHomeBorough, "Same Borough", "Different Borough")))) %>% 
                                                factor(c("Same Census Tract", "Same Neighborhood", "Same Community District", "Same Borough", "Different Borough"))
                        
                      ) %>%
                      dplyr::filter(!is.na(home_neighborhood) & !is.na(place_neighborhood)) %>%
                      dplyr::select(-c(inHomeCensusTract, inHomeCommunity, inHomeNeighborhood, inHomeBorough)) %>%
                      dplyr::tibble() %>%
                      dplyr::filter(!is.na(placeSex))

labelled::var_label(clean_data)  <- factor_labels[["places"]] %>%
                                            purrr::map(function(x) x$label)

clean_data


}

