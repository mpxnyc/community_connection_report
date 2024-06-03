load_initial_settings <- function(){
  
  settings <- list()
  
  settings[["n_reps_graph"]]     <- 10
  settings[["n_neighborhoods"]]  <- 67
  settings[["list_intervention_priority"]] <- list("contact", "movement")
  settings[["list_intervention_settings"]] <- list(c("home"), c("home", "social"), c("home", "social", "sexual"))
  
  settings[["analytic_scale"]]  <- "community"
  
   
  
  
  list_labels <- list()
  
  list_labels[["age"]] <- list()
  list_labels[["age"]][["label"]] <- "Age"
  list_labels[["age"]][["levels"]][["18-24"]] <- "18-24"
  list_labels[["age"]][["levels"]][["25-34"]] <- "25-34"
  list_labels[["age"]][["levels"]][["35-44"]] <- "35-44"
  list_labels[["age"]][["levels"]][["45-54"]] <- "45-54"
  list_labels[["age"]][["levels"]][["55+"]]   <- "55+"
  
  list_labels[["borough"]] <- list()
  list_labels[["borough"]][["label"]]           <- "Borough"
  list_labels[["borough"]][["levels"]][["Bronx"]]           <- "Bronx"
  list_labels[["borough"]][["levels"]][["Brooklyn"]]        <- "Brooklyn"
  list_labels[["borough"]][["levels"]][["Manhattan"]]       <- "Manhattan"
  list_labels[["borough"]][["levels"]][["Queens"]]          <- "Queens"
  list_labels[["borough"]][["levels"]][["Staten Island"]]   <- "Staten Island"
  
  list_labels[["countFriends"]] <- list()
  list_labels[["countFriends"]][["label"]] <- "Queer/Trans Friends"
  list_labels[["countFriends"]][["levels"]][["0"]]     <- "0"
  list_labels[["countFriends"]][["levels"]][["1-5"]]   <- "1-5"
  list_labels[["countFriends"]][["levels"]][["6-10"]]  <- "6-10"
  list_labels[["countFriends"]][["levels"]][["11-15"]] <- "11-15"
  list_labels[["countFriends"]][["levels"]][["16+"]]   <- "16+"
  
  list_labels[["countSex"]] <- list()
  list_labels[["countSex"]][["label"]] <- "Sex Partners"
  list_labels[["countSex"]][["levels"]][["0"]]     <- "0"
  list_labels[["countSex"]][["levels"]][["1"]]     <- "1"
  list_labels[["countSex"]][["levels"]][["2"]]     <- "2"
  list_labels[["countSex"]][["levels"]][["3"]]     <- "3"
  list_labels[["countSex"]][["levels"]][["4"]]     <- "4"
  list_labels[["countSex"]][["levels"]][["5+"]]    <- "5"
  
  list_labels[["demo_group"]] <- list()
  list_labels[["demo_group"]][["levels"]][["white-cisgender-man"]]  <- "White\nCisgender\nMan"
  list_labels[["demo_group"]][["levels"]][["latinx-cisgender-man"]] <- "Latinx\nCisgender\nMan"
  list_labels[["demo_group"]][["levels"]][["black-cisgender-man"]]  <- "Black\nCisgender\nMan"
  list_labels[["demo_group"]][["levels"]][["other-cisgender-man"]]  <- "Other\nCisgender\nMan"
  list_labels[["demo_group"]][["levels"]][["non-binary"]]           <- "Non-Binary\nPerson"
  list_labels[["demo_group"]][["levels"]][["transgender-man"]]      <- "Transgender\nMan"
  list_labels[["demo_group"]][["levels"]][["transgender-woman"]]    <- "Transgender\nWoman"
  list_labels[["demo_group"]][["levels"]][["cisgender-woman"]]      <- "Cisgender\nWoman"
  list_labels[["demo_group"]][["levels"]][["other"]]                <- "Another\nDemographic"
  
  list_labels[["genderId"]] <- list()
  list_labels[["genderId"]][["label"]] <- "Gender Identity"
  list_labels[["genderId"]][["levels"]][["cisgender-man"]]          <- "Cisgender\nMan"
  list_labels[["genderId"]][["levels"]][["non-binary"]]             <- "Non\nBinary"
  list_labels[["genderId"]][["levels"]][["transgender-man"]]        <- "Transgender\nMan"
  list_labels[["genderId"]][["levels"]][["transgender-woman"]]      <- "Transgender\nWoman"
  list_labels[["genderId"]][["levels"]][["cisgender-woman"]]        <- "Cisgender\nWoman"
  list_labels[["genderId"]][["levels"]][["other"]]                  <- "Another Demographic"


  
  list_labels[["hivPrep"]] <- list()
  list_labels[["hivPrep"]][["label"]] <- "HIV Status/\nPrEP Use"
  list_labels[["hivPrep"]][["levels"]][["no"]]                     <- "Not on PrEP"
  list_labels[["hivPrep"]][["levels"]][["yes"]]                    <- "On PrEP"
  list_labels[["hivPrep"]][["levels"]][["living-with-hiv"]]        <- "Living with HIV"
  
  list_labels[["hivStatus"]] <- list()
  list_labels[["hivStatus"]][["label"]] <- "HIV Status"
  list_labels[["hivStatus"]][["levels"]][["living-with-hiv"]]       <- "Living with HIV"
  list_labels[["hivStatus"]][["levels"]][["not-living-with-hiv"]]   <- "Not living with HIV"
  list_labels[["hivStatus"]][["levels"]][["unsure"]]                <- "Unsure"
  
  list_labels[["monkeypoxVaccine"]] <- list()
  list_labels[["monkeypoxVaccine"]][["label"]] <- "MPOX Vaccination"
  list_labels[["monkeypoxVaccine"]][["levels"]][["yes"]]                   <- "Vaccinated"
  list_labels[["monkeypoxVaccine"]][["levels"]][["no"]]                    <- "Unvaccinated"
  
  list_labels[["race"]] <- list()
  list_labels[["race"]][["label"]] <- "Race"
  list_labels[["race"]][["levels"]][["white"]]                    <- "White"
  list_labels[["race"]][["levels"]][["latinx"]]                   <- "Latinx"
  list_labels[["race"]][["levels"]][["black"]]                    <- "Black"
  list_labels[["race"]][["levels"]][["asian"]]                    <- "Asian"
  list_labels[["race"]][["levels"]][["multiple"]]                 <- "Multi\nRacial"
  list_labels[["race"]][["levels"]][["other"]]                    <- "Another\nGroup"
  
  
  
  list_labels[["sexOrientation"]] <- list()
  list_labels[["sexOrientation"]][["label"]] <- "Sexual Orientation"
  list_labels[["sexOrientation"]][["levels"]][["gay"]]            <- "Gay"
  list_labels[["sexOrientation"]][["levels"]][["bisexual"]]       <- "Bisexual"
  list_labels[["sexOrientation"]][["levels"]][["straight"]]       <- "Straight"
  list_labels[["sexOrientation"]][["levels"]][["queer"]]          <- "Queer"
  list_labels[["sexOrientation"]][["levels"]][["something-else"]] <- "Another\nOrientation"

  

  
  list_labels[["channel"]] <- list()
  list_labels[["channel"]][["label"]]                             <- "Channel"
  list_labels[["channel"]][["levels"]][["grindr"]]                <- "Grindr"
  list_labels[["channel"]][["levels"]][["unknown"]]               <- "Unknown\nChannel"
  list_labels[["channel"]][["levels"]][["partner_toolkit"]]       <- "Toolkit"
  list_labels[["channel"]][["levels"]][["instagram"]]             <- "Instagram"
  list_labels[["channel"]][["levels"]][["twitter"]]               <- "Twitter"
  
  
  list_labels[["placeType"]] <- list()
  list_labels[["placeType"]][["label"]]                              <- "Place Type"
  list_labels[["placeType"]][["levels"]][["concert"]]                <- "Concert/Theatre/Show"
  list_labels[["placeType"]][["levels"]][["theatre/show"]]           <- "Concert/Theatre/Show"
  list_labels[["placeType"]][["levels"]][["darkroom"]]               <- "Dark Room/Sex Party"
  list_labels[["placeType"]][["levels"]][["sex-party"]]              <- "Dark Room/Sex Party"
  list_labels[["placeType"]][["levels"]][["dance-party"]]            <- "Dance Party"
  list_labels[["placeType"]][["levels"]][["sport-game"]]             <- "Sport Game"
  list_labels[["placeType"]][["levels"]][["private-residence-"]]     <- "Private Residence"
  list_labels[["placeType"]][["levels"]][["something-else"]]         <- "Something Else"

  list_labels[["placeSex"]] <- list()
  list_labels[["placeSex"]][["label"]]                               <- "Place Sex"
  list_labels[["placeSex"]][["levels"]][["no"]]                      <- "Social Contact"
  list_labels[["placeSex"]][["levels"]][["yes"]]                     <- "Sexual Contact"
  
  list_labels[["distanceFromHome"]] <- list()
  list_labels[["distanceFromHome"]][["label"]]                               <- "Distance from home"
  list_labels[["distanceFromHome"]][["levels"]][["Same Neighborhood"]]       <- "Same neighborhood\nas home"
  list_labels[["distanceFromHome"]][["levels"]][["Same Borough"]]            <- "Same borough\nas home"
  list_labels[["distanceFromHome"]][["levels"]][["Different Borough"]]       <- "Different borough\nfrom home"
  
  list_labels[["groupSex"]] <- list()
  list_labels[["groupSex"]][["label"]]                             <- "Group Sex or Physical Contact"
  list_labels[["groupSex"]][["levels"]][["yes"]]                   <- "Yes"
  list_labels[["groupSex"]][["levels"]][["no"]]                    <- "No"
  
  list_labels[["stratum"]] <- list()
  list_labels[["stratum"]][["label"]]                             <- "Group Sex or Physical Contact"
  list_labels[["stratum"]][["levels"]][["yes"]]                   <- "Physical / Sexual\nContact"
  list_labels[["stratum"]][["levels"]][["no"]]                    <- "No\nContact"
  list_labels[["stratum"]][["levels"]][["overall"]]               <- "Overall"
  
  
  settings[["labels_list"]] <- list_labels
  
  settings
}


