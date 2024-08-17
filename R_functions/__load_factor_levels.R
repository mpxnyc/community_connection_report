load_factor_levels <- function(){
  
  list_levels <- list()
  
  list_levels[["race"]]                              <- list()
  list_levels[["race"]][["raw"]]                     <- c("White", "Latinx", "Black", "Asian", "Other", "Multiple races reported")
  list_levels[["race"]][["cleaned"]]                 <- c("white", "latinx", "black", "asian", "other", "multiple")
  
  list_levels[["age"]]                               <- list()
  list_levels[["age"]][["raw"]]                      <- c("18-24", "25-34", "35-44", "45-54", "55-64", "65+")
  list_levels[["age"]][["cleaned"]]                  <- c("18-24", "25-34", "35-44", "45-54", "55+", "55+")
  
  list_levels[["hivStatus"]]                               <- list()
  list_levels[["hivStatus"]][["raw"]]                      <- c("living-with-hiv", "not-living-with-hiv", "unsure")
  list_levels[["hivStatus"]][["cleaned"]]                  <- c("living-with-hiv", "not-living-with-hiv", "not-living-with-hiv")
  
  list_levels[["monkeypoxVaccine"]]                               <- list()
  list_levels[["monkeypoxVaccine"]][["raw"]]                      <- c("yes", "no", "unsure")
  list_levels[["monkeypoxVaccine"]][["cleaned"]]                  <- c("yes", "no", "no")
  
  list_levels[["hivSuppressed"]]                               <- list()
  list_levels[["hivSuppressed"]][["raw"]]                      <- c("yes", "no", "unsure")
  list_levels[["hivSuppressed"]][["cleaned"]]                  <- c("yes", "no", "no")
  
  
  
  
  list_levels[["countFriends"]]                      <- list()
  list_levels[["countFriends"]][["intervals"]]       <- c(-1, 0, 5, 10, 15, 1000000000)
  list_levels[["countFriends"]][["cleaned"]]         <- c("0", "1-5", "6-10", "11-15", "16+")
  
  list_levels[["countPhysical"]]                     <- list()
  list_levels[["countPhysical"]][["intervals"]]      <- c(-1, 0, 1, 2, 3, 4,  1000000000)
  list_levels[["countPhysical"]][["cleaned"]]        <- c("0", "1", "2", "3", "4", "5+")
  
  list_levels[["countSex"]]                          <- list()
  list_levels[["countSex"]][["intervals"]]           <- c(-1, 0, 1, 2, 3, 4,  1000000000)
  list_levels[["countSex"]][["cleaned"]]             <- c("0", "1", "2", "3", "4", "5+")
  
  list_levels[["travelTime"]]                          <- list()
  list_levels[["travelTime"]][["intervals"]]           <- c(-1, 15, 30, 45, 1000000000000000)
  list_levels[["travelTime"]][["cleaned"]]             <- c("0-15 min", "16-30 min", "31-45 min", "45+ min" )
  
  list_levels[["count_places"]]                          <- list()
  list_levels[["count_places"]][["intervals"]]           <- c(-1, 0, 1, 2, 3, 4, 5, 1000000000000)
  list_levels[["count_places"]][["cleaned"]]             <- c("0", "1", "2", "3", "4", "5", "6+")
  
  

  list_levels
  
}


