clean_data_people <- function(raw_data_participants, factor_levels) {
  
  race                    <- get_variable_levels("race", factor_levels)
  race_levels             <- race[["variable_levels"]]
  race_labels             <- race[["variable_labels"]]
  
  count_friends           <- get_variable_levels("countFriends", factor_levels)
  count_friends_intervals <- count_friends[["variable_levels"]]
  count_friends_labels    <- count_friends[["variable_labels"]]
  
  countPhysical           <- get_variable_levels("countPhysical", factor_levels)
  countPhysical_intervals <- countPhysical[["variable_levels"]]
  countPhysical_labels    <- countPhysical[["variable_labels"]]
  
  countSex                <- get_variable_levels("countSex", factor_levels)
  countSex_intervals      <- countSex[["variable_levels"]]
  countSex_labels         <- countSex[["variable_labels"]]
  
  travelTime              <- get_variable_levels("travelTime", factor_levels)
  travelTime_intervals    <- travelTime[["variable_levels"]]
  travelTime_labels       <- travelTime[["variable_labels"]]
  
  count_places            <- get_variable_levels("count_places", factor_levels)
  count_places_intervals  <- count_places[["variable_levels"]]
  count_places_labels     <- count_places[["variable_labels"]]
  
  age                     <- get_variable_levels("age", factor_levels)
  age_levels              <- age[["variable_levels"]]
  age_labels              <- age[["variable_labels"]]
  
  hivStatus               <- get_variable_levels("hivStatus", factor_levels)
  hivStatus_levels        <- hivStatus[["variable_levels"]]
  hivStatus_labels        <- hivStatus[["variable_labels"]]
  
  monkeypoxVaccine        <- get_variable_levels("monkeypoxVaccine", factor_levels)
  monkeypoxVaccine_levels <- monkeypoxVaccine[["variable_levels"]]
  monkeypoxVaccine_labels <- monkeypoxVaccine[["variable_labels"]]

  hivSuppressed           <- get_variable_levels("hivSuppressed", factor_levels)
  hivSuppressed_levels    <- hivSuppressed[["variable_levels"]]
  hivSuppressed_labels    <- hivSuppressed[["variable_labels"]]
  
  
  raw_data_participants %>%
    dplyr::mutate(
      borough        = mpxnyc::convert_spatial_unit_ny(censusTractHome, convert_to = "borough"),
      community      = mpxnyc::convert_spatial_unit_ny(censusTractHome, convert_to = "community"),
      race           = factor(race, race_levels, race_labels),
      genderId       = factor(as.character(genderId)),
      countFriends   = cut(countFriends, count_friends_intervals, count_friends_labels),
      countPhysical  = cut(countPhysical, countPhysical_intervals, countPhysical_labels),
      countSex       = cut(countSex, countSex_intervals, countSex_labels)
    ) %>%
    dplyr::filter(!is.na(borough)) %>%
    dplyr::mutate(
      travelTime       = cut(travelTime, travelTime_intervals, travelTime_labels),
      age              = factor(age, age_levels, age_labels),
      hivStatus        = factor(hivStatus, hivStatus_levels, hivStatus_labels),
      monkeypoxVaccine = factor(monkeypoxVaccine, monkeypoxVaccine_levels, monkeypoxVaccine_labels),
      hivPrep          = ifelse(is.na(hivPrep), "living-with-hiv", as.character(hivPrep)),
      hivSuppressed    = factor(hivSuppressed, hivSuppressed_levels, hivSuppressed_labels),
      race             = ifelse(is.na(race), "other", as.character(race)) %>% factor(),
      demo_group       = as.character(genderId),
      demo_group       = ifelse(race %in% c("black", "white", "latinx") & genderId == "cisgender-man", paste(stringr::str_to_lower(race) , demo_group, sep = "-"), demo_group),
      demo_group       = ifelse(!(race %in% c("black", "white", "latinx")) & genderId == "cisgender-man", paste("other", demo_group, sep = "-"), demo_group),
      demo_group       = factor(demo_group),
      overall          = "overall"
    ) %>%
    dplyr::tibble()
  
  
}

