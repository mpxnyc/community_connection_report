clean_participant_data <- function(raw_data_participants) {

  race_levels             <- c("White", "Latinx", "Black", "Asian", "Other", "Multiple races reported")
  race_labels             <- c("white", "latinx", "black", "asian", "other", "multiple")
  count_friends_intervals <- c(-1, 0, 5, 10, 15, 1000000000)
  count_friends_labels    <- c("0", "1-5", "6-10", "11-15", "16+")
  countPhysical_intervals <- c(-1, 0, 1, 2, 3, 4,  1000000000)
  countPhysical_labels    <- c("0", "1", "2", "3", "4", "5+")
  countSex_intervals      <- c(-1, 0, 1, 2, 3, 4,  1000000000)
  countSex_labels         <- c("0", "1", "2", "3", "4", "5+")
  travelTime_intervals    <- c(-1, 15, 30, 45, 1000000000000000)
  travelTime_labels       <- c("0-15 min", "16-30 min", "31-45 min", "45+ min" )
  count_places_intervals  <- c(-1, 0, 1, 2, 3, 4, 5, 1000000000000)
  count_places_labels     <- c("0", "1", "2", "3", "4", "5", "6+")
  age_levels              <- c("18-24", "25-34", "35-44", "45-54", "55-64", "65+")
  age_labels              <- c("18-24", "25-34", "35-44", "45-54", "55+", "55+")
  hivStatus_levels        <- c("living-with-hiv", "not-living-with-hiv", "unsure")
  hivStatus_labels        <- c("living-with-hiv", "not-living-with-hiv", "not-living-with-hiv")
  monkeypoxVaccine_levels <- c("yes", "no", "unsure")
  monkeypoxVaccine_labels <- c("yes", "no", "no")
  hivSuppressed_levels    <- c("yes", "no", "unsure")
  hivSuppressed_labels    <- c("yes", "no", "no")


    
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

