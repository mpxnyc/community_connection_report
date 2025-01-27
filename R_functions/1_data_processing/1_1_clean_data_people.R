clean_data_people_old <- function(raw_data_participants, factor_levels, factor_labels) {
  
  
  clean_data <- raw_data_participants |>
    
    
    dplyr::mutate(
      borough          = mpxnyc::convert_spatial_unit_ny(censusTractHome, convert_to = "borough"),
      community        = mpxnyc::convert_spatial_unit_ny(censusTractHome, convert_to = "community")
    ) |>
    dplyr::filter(!is.na(borough)) |>
    
    
    dplyr::mutate(
      age              = factor(age,                 factor_levels[["age"]][["current_levels"]],                 factor_levels[["age"]][["new_levels"]]),
      borough          = factor(borough,             factor_levels[["borough"]][["current_levels"]],             factor_levels[["borough"]][["new_levels"]]),
      channel          = factor(channel,             factor_levels[["channel"]][["current_levels"]],             factor_levels[["channel"]][["new_levels"]]),
      hivStatus        = factor(hivStatus,           factor_levels[["hivStatus"]][["current_levels"]],           factor_levels[["hivStatus"]][["new_levels"]]),
      hivSuppressed    = factor(hivSuppressed,       factor_levels[["hivSuppressed"]][["current_levels"]],       factor_levels[["hivSuppressed"]][["new_levels"]]),
      monkeypoxVaccine = factor(monkeypoxVaccine,    factor_levels[["monkeypoxVaccine"]][["current_levels"]],    factor_levels[["monkeypoxVaccine"]][["new_levels"]]),
      race             = factor(race,                factor_levels[["race"]][["current_levels"]],                factor_levels[["race"]][["new_levels"]]),
      genderId         = factor(genderId,            factor_levels[["genderId"]][["current_levels"]],            factor_levels[["genderId"]][["new_levels"]])
    ) |>
    dplyr::mutate(
      countFriendsCut     = cut(countFriends,        factor_levels[["countFriendsCut"]][["current_levels"]],      factor_levels[["countFriendsCut"]][["new_levels"]]),
      countPhysicalCut    = cut(countPhysical,       factor_levels[["countPhysicalCut"]][["current_levels"]],     factor_levels[["countPhysicalCut"]][["new_levels"]]),
      countSexCut         = cut(countSex,            factor_levels[["countSexCut"]][["current_levels"]],          factor_levels[["countSexCut"]][["new_levels"]]),
      travelTimeCut       = cut(travelTime,          factor_levels[["travelTimeCut"]][["current_levels"]],        factor_levels[["travelTimeCut"]][["new_levels"]]),
      createdAtCut        = cut(createdAt,           factor_levels[["createdAtCut"]][["current_levels"]],         factor_levels[["createdAtCut"]][["new_levels"]]),
      NumSymptomsCut      = cut(num_symptoms,        factor_levels[["NumSymptomsCut"]][["current_levels"]],       factor_levels[["NumSymptomsCut"]][["new_levels"]])
    ) |>
    dplyr::mutate(
      demo_group       = as.character(genderId),
      demo_group       = ifelse(
        race %in% c("black", "white", "latinx") & genderId == "cisgender-man", 
        paste(stringr::str_to_lower(race) , demo_group, sep = "-"), 
        demo_group
      ),
      demo_group       = ifelse(
        !(race %in% c("black", "white", "latinx")) & genderId == "cisgender-man", 
        paste("other", demo_group, sep = "-"), 
        demo_group
      ),
      demo_group       = factor(demo_group),
      overall          = "overall",
      hivPrepStat      = ifelse(is.na(hivPrep), "living-with-hiv", as.character(hivPrep))
    ) |>
    
    dplyr::tibble()
  
  
  variable_labels  <- factor_labels[["people"]] |>
    purrr::map(
      function(x) {
        x$label
      }
    ) 
  
  value_labels    <- factor_labels[["people"]] |> 
    purrr::map(
      function(x) {
        result <- x$levels |> 
          unlist() 
        names(result) <- names(x$levels)
        
        result
      }) 
  
  
  value_labels |>
    purrr::map2(
      names(value_labels),
      function(variable, var_name) {
        clean_data[, var_name] <<- clean_data |>
          dplyr::pull(var_name) |>
          factor(names(variable), as.character(variable))
        
      }
    )
  
  
  
  labelled::var_label(clean_data)  <- variable_labels
  
  clean_data
}

