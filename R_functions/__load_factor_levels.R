load_factor_levels <- function(){
  
  list_levels <- list()
  
  list_levels[["age"]]                                            <- list()
  list_levels[["age"]][["current_levels"]]                        <- c("18-24", "25-34", "35-44", "45-54", "55-64", "65+")
  list_levels[["age"]][["new_levels"]]                            <- c("18-24", "25-34", "35-44", "45-54", "55+", "55+")
  
  list_levels[["borough"]]                                            <- list()
  list_levels[["borough"]][["current_levels"]]                        <- c("Bronx", "Brooklyn", "Manhattan", "Queens", "Staten Island")
  list_levels[["borough"]][["new_levels"]]                            <- c("bronx", "brooklyn", "manhattan", "queens", "staten_island")
  
  
  list_levels[["channel"]]                                        <- list()
  list_levels[["channel"]][["current_levels"]]                    <- c("grindr", "partner_toolkit", "instagram", "twitter", "unknown")
  list_levels[["channel"]][["new_levels"]]                        <- c("grindr", "partner_toolkit", "instagram", "twitter", "unknown")
  
  list_levels[["count_places"]]                                   <- list()
  list_levels[["count_places"]][["current_levels"]]               <- c(-1, 0, 1, 2, 3, 4, 5, 1000000000000)
  list_levels[["count_places"]][["new_levels"]]                   <- c("0", "1", "2", "3", "4", "5", "6+")
  
  list_levels[["countFriends"]]                                   <- list()
  list_levels[["countFriends"]][["current_levels"]]               <- c(-1, 0, 5, 10, 15, 1000000000)
  list_levels[["countFriends"]][["new_levels"]]                   <- c("0", "1-5", "6-10", "11-15", "16+")
  
  list_levels[["countPhysical"]]                                  <- list()
  list_levels[["countPhysical"]][["current_levels"]]              <- c(-1, 0, 1, 2, 3, 4,  1000000000)
  list_levels[["countPhysical"]][["new_levels"]]                  <- c("0", "1", "2", "3", "4", "5+")
  
  list_levels[["countSex"]]                                       <- list()
  list_levels[["countSex"]][["current_levels"]]                   <- c(-1, 0, 1, 2, 3, 4,  1000000000)
  list_levels[["countSex"]][["new_levels"]]                       <- c("0", "1", "2", "3", "4", "5+")
  
  list_levels[["race"]]                                           <- list()
  list_levels[["race"]][["current_levels"]]                       <- c("White", "Latinx", "Black", "Asian", "Other", "Multiple races reported")
  list_levels[["race"]][["new_levels"]]                           <- c("white", "latinx", "black", "asian", "other", "multiple")
  
  list_levels[["hivStatus"]]                                      <- list()
  list_levels[["hivStatus"]][["current_levels"]]                  <- c("living-with-hiv", "not-living-with-hiv", "unsure")
  list_levels[["hivStatus"]][["new_levels"]]                      <- c("living-with-hiv", "not-living-with-hiv", "not-living-with-hiv")
  
  list_levels[["hivSuppressed"]]                                  <- list()
  list_levels[["hivSuppressed"]][["current_levels"]]              <- c("yes", "no", "unsure")
  list_levels[["hivSuppressed"]][["new_levels"]]                  <- c("yes", "no", "no")
  
  list_levels[["intervention_setting"]]                           <- list()
  list_levels[["intervention_setting"]][["current_levels"]]       <-  c("home", "no", "yes")
  list_levels[["intervention_setting"]][["new_levels"]]           <- c("home", "social", "sexual")
  
  list_levels[["monkeypoxVaccine"]]                               <- list()
  list_levels[["monkeypoxVaccine"]][["current_levels"]]           <- c("yes", "no", "unsure")
  list_levels[["monkeypoxVaccine"]][["new_levels"]]               <- c("yes", "no", "no")
  
  list_levels[["placeSex"]]                                       <- list()
  list_levels[["placeSex"]][["current_levels"]]                   <- c("yes", "no", "i-don't-remember")
  list_levels[["placeSex"]][["new_levels"]]                       <- c("yes", "no", "no")
  
  list_levels[["travelTime"]]                                     <- list()
  list_levels[["travelTime"]][["current_levels"]]                 <- c(-1, 15, 30, 45, 1000000000000000)
  list_levels[["travelTime"]][["new_levels"]]                     <- c("0-15 min", "16-30 min", "31-45 min", "45+ min" )
  
  list_levels
  
}


