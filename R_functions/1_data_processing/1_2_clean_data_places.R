clean_data_places <- function(raw_data_places, factor_levels, factor_labels){
  
  

  clean_data <- raw_data_places %>%
                      dplyr::mutate(
                        placeSex = factor(placeSex,   factor_levels[["placeSex"]][["current_levels"]], factor_levels[["placeSex"]][["new_levels"]])
                        ) %>%
                      dplyr::mutate(
                        intervention_setting = ifelse(is.na(placeSex), "home", as.character(placeSex)),
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

  variable_labels  <- factor_labels[["places"]] %>%
    purrr::map(
      function(x) {
        x$label
      }
    ) 
  
  value_labels    <- factor_labels[["places"]] %>% 
    purrr::map(
      function(x) {
        result <- x$levels %>% 
          unlist() 
        names(result) <- names(x$levels)
        
        result
      }) 
  
  value_labels %>%
    purrr::map2(
      names(value_labels),
      function(variable, var_name) {
        clean_data[, var_name] <<- clean_data %>%
          pull(var_name) %>%
          factor(names(variable), as.character(variable))
        
      }
    )
  
labelled::var_label(clean_data)  <- variable_labels

clean_data


}

