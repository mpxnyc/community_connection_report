clean_data_people <- function(raw_data_participants, factor_levels, factor_labels) {
  
  
  raw_data_participants %>%
    dplyr::mutate(
      borough          = mpxnyc::convert_spatial_unit_ny(censusTractHome, convert_to = "borough"),
      community        = mpxnyc::convert_spatial_unit_ny(censusTractHome, convert_to = "community")
    ) %>%
    dplyr::mutate(
      age              = factor(age,              factor_levels[["age"]][["current_levels"]],               factor_levels[["age"]][["new_levels"]]),
      borough          = factor(borough,          factor_levels[["borough"]][["current_levels"]],           factor_levels[["borough"]][["new_levels"]]),
      channel          = factor(channel,          factor_levels[["channel"]][["current_levels"]],           factor_levels[["channel"]][["new_levels"]]),
      countFriends     = cut(countFriends,        factor_levels[["countFriends"]][["current_levels"]],      factor_levels[["countFriends"]][["new_levels"]]),
      countPhysical    = cut(countPhysical,       factor_levels[["countPhysical"]][["current_levels"]],     factor_levels[["countPhysical"]][["new_levels"]]),
      countSex         = cut(countSex,            factor_levels[["countSex"]][["current_levels"]],          factor_levels[["countSex"]][["new_levels"]]),
      hivStatus        = factor(hivStatus,        factor_levels[["hivStatus"]][["current_levels"]],         factor_levels[["hivStatus"]][["new_levels"]]),
      hivSuppressed    = factor(hivSuppressed,    factor_levels[["hivSuppressed"]][["current_levels"]],     factor_levels[["hivSuppressed"]][["new_levels"]]),
      monkeypoxVaccine = factor(monkeypoxVaccine, factor_levels[["monkeypoxVaccine"]][["current_levels"]],  factor_levels[["monkeypoxVaccine"]][["new_levels"]]),
      race             = factor(race,             factor_levels[["race"]][["current_levels"]],              factor_levels[["race"]][["new_levels"]]),
      travelTime       = cut(travelTime,          factor_levels[["travelTime"]][["current_levels"]],        factor_levels[["travelTime"]][["new_levels"]])
    ) %>%
    dplyr::mutate(
      demo_group       = as.character(genderId),
      demo_group       = ifelse(race %in% c("black", "white", "latinx") & genderId == "cisgender-man", paste(stringr::str_to_lower(race) , demo_group, sep = "-"), demo_group),
      demo_group       = ifelse(!(race %in% c("black", "white", "latinx")) & genderId == "cisgender-man", paste("other", demo_group, sep = "-"), demo_group),
      demo_group       = factor(demo_group),
      overall          = "overall",
      hivPrep          = ifelse(is.na(hivPrep), "living-with-hiv", as.character(hivPrep)),
      race             = ifelse(is.na(race), "other", as.character(race)) %>% factor(),
    ) %>%
    dplyr::filter(!is.na(borough)) %>%
    dplyr::tibble()
  
  
}

