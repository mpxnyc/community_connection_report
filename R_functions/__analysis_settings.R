load_initial_settings <- function(){
  
  settings <- list()
  
  settings[["n_reps_graph"]]     <- 500
  settings[["n_neighborhoods"]]  <- 50
  settings[["list_intervention_priority"]] <- list("contact", "movement")
  settings[["list_intervention_settings"]] <- list(c("home"), c("home", "social"), c("home", "social", "sexual"))
  
  settings[["analytic_scale"]]  <- "community"
  
   
  
  
  list_labels_groupSex_table1 <- list()
  
  list_labels_groupSex_table1[["age"]] <- list()
  list_labels_groupSex_table1[["age"]][["label"]] <- "Age"
  list_labels_groupSex_table1[["age"]][["levels"]][["18-24"]] <- "18-24"
  list_labels_groupSex_table1[["age"]][["levels"]][["25-34"]] <- "25-34"
  list_labels_groupSex_table1[["age"]][["levels"]][["35-44"]] <- "35-44"
  list_labels_groupSex_table1[["age"]][["levels"]][["45-54"]] <- "45-54"
  list_labels_groupSex_table1[["age"]][["levels"]][["55+"]]   <- "55+"
  
  list_labels_groupSex_table1[["borough"]] <- list()
  list_labels_groupSex_table1[["borough"]][["label"]]           <- "Borough"
  list_labels_groupSex_table1[["borough"]][["levels"]][["Bronx"]]           <- "Bronx"
  list_labels_groupSex_table1[["borough"]][["levels"]][["Brooklyn"]]        <- "Brooklyn"
  list_labels_groupSex_table1[["borough"]][["levels"]][["Manhattan"]]       <- "Manhattan"
  list_labels_groupSex_table1[["borough"]][["levels"]][["Queens"]]          <- "Queens"
  list_labels_groupSex_table1[["borough"]][["levels"]][["Staten Island"]]   <- "Staten Island"
  
  list_labels_groupSex_table1[["countFriends"]] <- list()
  list_labels_groupSex_table1[["countFriends"]][["label"]] <- "Queer/Trans Friends"
  list_labels_groupSex_table1[["countFriends"]][["levels"]][["0"]]     <- "0"
  list_labels_groupSex_table1[["countFriends"]][["levels"]][["1-5"]]   <- "1-5"
  list_labels_groupSex_table1[["countFriends"]][["levels"]][["6-10"]]  <- "6-10"
  list_labels_groupSex_table1[["countFriends"]][["levels"]][["11-15"]] <- "11-15"
  list_labels_groupSex_table1[["countFriends"]][["levels"]][["16+"]]   <- "16+"
  
  list_labels_groupSex_table1[["countSex"]] <- list()
  list_labels_groupSex_table1[["countSex"]][["label"]] <- "Sex Partners"
  list_labels_groupSex_table1[["countSex"]][["levels"]][["0"]]     <- "0"
  list_labels_groupSex_table1[["countSex"]][["levels"]][["1"]]     <- "1"
  list_labels_groupSex_table1[["countSex"]][["levels"]][["2"]]     <- "2"
  list_labels_groupSex_table1[["countSex"]][["levels"]][["3"]]     <- "3"
  list_labels_groupSex_table1[["countSex"]][["levels"]][["4"]]     <- "4"
  list_labels_groupSex_table1[["countSex"]][["levels"]][["5+"]]    <- "5"
  
  list_labels_groupSex_table1[["demo_group"]] <- list()
  list_labels_groupSex_table1[["demo_group"]][["label"]] <- "Race-Gender"
  list_labels_groupSex_table1[["demo_group"]][["levels"]][["black-cisgender-man"]]    <- "Black Cisgender Men"
  list_labels_groupSex_table1[["demo_group"]][["levels"]][["cisgender-woman"]]        <- "Cisgender Women"
  list_labels_groupSex_table1[["demo_group"]][["levels"]][["latinx-cisgender-man"]]   <- "Latinx Cisgender Men"
  list_labels_groupSex_table1[["demo_group"]][["levels"]][["non-binary"]]             <- "Non-Binary People"
  list_labels_groupSex_table1[["demo_group"]][["levels"]][["other"]]                  <- "Another Demographic"
  list_labels_groupSex_table1[["demo_group"]][["levels"]][["other-cisgender-man"]]    <- "Other Cisgender Men"
  list_labels_groupSex_table1[["demo_group"]][["levels"]][["transgender-man"]]        <- "Transgender Men"
  list_labels_groupSex_table1[["demo_group"]][["levels"]][["transgender-woman"]]      <- "Transgender Women"
  list_labels_groupSex_table1[["demo_group"]][["levels"]][["white-cisgender-man"]]    <- "White Cisgender Men"
  
  list_labels_groupSex_table1[["genderId"]] <- list()
  list_labels_groupSex_table1[["genderId"]][["label"]] <- "Gender Identity"
  list_labels_groupSex_table1[["genderId"]][["levels"]][["cisgender-man"]]    <- "Cisgender Men"
  list_labels_groupSex_table1[["genderId"]][["levels"]][["cisgender-woman"]]        <- "Cisgender Women"
  list_labels_groupSex_table1[["genderId"]][["levels"]][["non-binary"]]             <- "Non-Binary People"
  list_labels_groupSex_table1[["genderId"]][["levels"]][["other"]]                  <- "Another Demographic"
  list_labels_groupSex_table1[["genderId"]][["levels"]][["transgender-man"]]        <- "Transgender Men"
  list_labels_groupSex_table1[["genderId"]][["levels"]][["transgender-woman"]]      <- "Transgender Women"
  
  list_labels_groupSex_table1[["hivPrep"]] <- list()
  list_labels_groupSex_table1[["hivPrep"]][["label"]] <- "HIV Status/\nPrEP Use"
  list_labels_groupSex_table1[["hivPrep"]][["levels"]][["no"]]                     <- "Not on PrEP"
  list_labels_groupSex_table1[["hivPrep"]][["levels"]][["yes"]]                    <- "On PrEP"
  list_labels_groupSex_table1[["hivPrep"]][["levels"]][["living-with-hiv"]]        <- "Living with HIV"
  
  list_labels_groupSex_table1[["hivStatus"]] <- list()
  list_labels_groupSex_table1[["hivStatus"]][["label"]] <- "HIV Status"
  list_labels_groupSex_table1[["hivStatus"]][["levels"]][["living-with-hiv"]]       <- "Living with HIV"
  list_labels_groupSex_table1[["hivStatus"]][["levels"]][["not-living-with-hiv"]]   <- "Not living with HIV"
  list_labels_groupSex_table1[["hivStatus"]][["levels"]][["unsure"]]                <- "Unsure"
  
  list_labels_groupSex_table1[["monkeypoxVaccine"]] <- list()
  list_labels_groupSex_table1[["monkeypoxVaccine"]][["label"]] <- "MPOX Vaccination"
  list_labels_groupSex_table1[["monkeypoxVaccine"]][["levels"]][["yes"]]                   <- "Vaccinated"
  list_labels_groupSex_table1[["monkeypoxVaccine"]][["levels"]][["no"]]                    <- "Unvaccinated"
  
  list_labels_groupSex_table1[["race"]] <- list()
  list_labels_groupSex_table1[["race"]][["label"]] <- "Race"
  list_labels_groupSex_table1[["race"]][["levels"]][["asian"]]                    <- "Asian"
  list_labels_groupSex_table1[["race"]][["levels"]][["black"]]                    <- "Black"
  list_labels_groupSex_table1[["race"]][["levels"]][["latinx"]]                   <- "Latinx"
  list_labels_groupSex_table1[["race"]][["levels"]][["multiple"]]                 <- "Multiple Races"
  list_labels_groupSex_table1[["race"]][["levels"]][["other"]]                    <- "Other"
  list_labels_groupSex_table1[["race"]][["levels"]][["white"]]                    <- "White"
  
  list_labels_groupSex_table1[["sexOrientation"]] <- list()
  list_labels_groupSex_table1[["sexOrientation"]][["label"]] <- "Sexual Orientation"
  list_labels_groupSex_table1[["sexOrientation"]][["levels"]][["bisexual"]]       <- "Bisexual"
  list_labels_groupSex_table1[["sexOrientation"]][["levels"]][["gay"]]            <- "Gay"
  list_labels_groupSex_table1[["sexOrientation"]][["levels"]][["queer"]]          <- "Queer"
  list_labels_groupSex_table1[["sexOrientation"]][["levels"]][["something-else"]] <- "Something Else"
  list_labels_groupSex_table1[["sexOrientation"]][["levels"]][["straight"]]       <- "Straight"
  
  list_labels_groupSex_table1[["stratum"]] <- list()
  list_labels_groupSex_table1[["stratum"]][["label"]] <- "Group Sex or Physical Contact"
  list_labels_groupSex_table1[["stratum"]][["levels"]][["yes"]]       <- "Physical / Sexual\nContact"
  list_labels_groupSex_table1[["stratum"]][["levels"]][["no"]]            <- "No\nContact"
  list_labels_groupSex_table1[["stratum"]][["levels"]][["overall"]]            <- "Overall"
  
  
  settings[["labels_list"]] <- list_labels_groupSex_table1
  
  settings
}


