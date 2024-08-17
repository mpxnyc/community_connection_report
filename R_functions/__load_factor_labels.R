load_factor_labels <- function(){
  

  
  list_labels <- list()
  
  
  
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
  list_labels[["demo_group"]][["levels"]][["white-cisgender-man"]]  <- "White Cisgender Man"
  list_labels[["demo_group"]][["levels"]][["latinx-cisgender-man"]] <- "Latinx Cisgender Man"
  list_labels[["demo_group"]][["levels"]][["black-cisgender-man"]]  <- "Black Cisgender Man"
  list_labels[["demo_group"]][["levels"]][["other-cisgender-man"]]  <- "Other Cisgender Man"
  list_labels[["demo_group"]][["levels"]][["non-binary"]]           <- "Non-Binary Person"
  list_labels[["demo_group"]][["levels"]][["transgender-man"]]      <- "Transgender Man"
  list_labels[["demo_group"]][["levels"]][["transgender-woman"]]    <- "Transgender Woman"
  list_labels[["demo_group"]][["levels"]][["cisgender-woman"]]      <- "Cisgender Woman"
  list_labels[["demo_group"]][["levels"]][["other"]]                <- "Another Demographic"
  list_labels[["demo_group"]][["levels"]][["missing"]]              <- "Another Demographic"
  
  list_labels[["genderId"]] <- list()
  list_labels[["genderId"]][["label"]] <- "Gender Identity"
  list_labels[["genderId"]][["levels"]][["cisgender-man"]]          <- "Cisgender Man"
  list_labels[["genderId"]][["levels"]][["non-binary"]]             <- "Non Binary"
  list_labels[["genderId"]][["levels"]][["transgender-man"]]        <- "Transgender Man"
  list_labels[["genderId"]][["levels"]][["transgender-woman"]]      <- "Transgender Woman"
  list_labels[["genderId"]][["levels"]][["cisgender-woman"]]        <- "Cisgender Woman"
  list_labels[["genderId"]][["levels"]][["other"]]                  <- "Another Demographic"
  list_labels[["genderId"]][["levels"]][["missing"]]                  <- "Another Demographic"
  
  
  
  list_labels[["hivPrep"]] <- list()
  list_labels[["hivPrep"]][["label"]] <- "HIV Status/ PrEP Use"
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
  list_labels[["race"]][["levels"]][["multiple"]]                 <- "Multi Racial"
  list_labels[["race"]][["levels"]][["other"]]                    <- "Another Group"
  
  
  
  list_labels[["sexOrientation"]] <- list()
  list_labels[["sexOrientation"]][["label"]] <- "Sexual Orientation"
  list_labels[["sexOrientation"]][["levels"]][["gay"]]            <- "Gay"
  list_labels[["sexOrientation"]][["levels"]][["bisexual"]]       <- "Bisexual"
  list_labels[["sexOrientation"]][["levels"]][["straight"]]       <- "Straight"
  list_labels[["sexOrientation"]][["levels"]][["queer"]]          <- "Queer"
  list_labels[["sexOrientation"]][["levels"]][["something-else"]] <- "Another Orientation"
  
  
  
  
  list_labels[["channel"]] <- list()
  list_labels[["channel"]][["label"]]                             <- "Channel"
  list_labels[["channel"]][["levels"]][["grindr"]]                <- "Grindr"
  list_labels[["channel"]][["levels"]][["unknown"]]               <- "Unknown Channel"
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
  list_labels[["distanceFromHome"]][["levels"]][["Same Neighborhood"]]       <- "Same neighborhood as home"
  list_labels[["distanceFromHome"]][["levels"]][["Same Borough"]]            <- "Same borough as home"
  list_labels[["distanceFromHome"]][["levels"]][["Different Borough"]]       <- "Different borough from home"
  
  list_labels[["groupSex"]] <- list()
  list_labels[["groupSex"]][["label"]]                             <- "Group Sex or Physical Contact"
  list_labels[["groupSex"]][["levels"]][["yes"]]                   <- "Yes"
  list_labels[["groupSex"]][["levels"]][["no"]]                    <- "No"
  
  list_labels[["stratum"]] <- list()
  list_labels[["stratum"]][["label"]]                             <- "Group Sex or Physical Contact"
  list_labels[["stratum"]][["levels"]][["yes"]]                   <- "Physical / Sexual Contact"
  list_labels[["stratum"]][["levels"]][["no"]]                    <- "No Contact"
  list_labels[["stratum"]][["levels"]][["overall"]]               <- "Overall"
  
   list_labels
  
}


