load_factor_labels <- function(){

  
  list_labels_people <- list()

  list_labels_people[["age"]] <- list()
  list_labels_people[["age"]][["label"]] <- "Age"
  list_labels_people[["age"]][["levels"]][["18-24"]]          <- "18-24"
  list_labels_people[["age"]][["levels"]][["25-34"]]          <- "25-34"
  list_labels_people[["age"]][["levels"]][["35-44"]]          <- "35-44"
  list_labels_people[["age"]][["levels"]][["45-54"]]          <- "45-54"
  list_labels_people[["age"]][["levels"]][["55+"]]            <- "55+"
  
  
  list_labels_people[["borough"]] <- list()
  list_labels_people[["borough"]][["label"]] <- "Borough"
  list_labels_people[["borough"]][["levels"]][["bronx"]]          <- "Bronx"
  list_labels_people[["borough"]][["levels"]][["brooklyn"]]       <- "Brooklyn"
  list_labels_people[["borough"]][["levels"]][["manhattan"]]      <- "Manhattan"
  list_labels_people[["borough"]][["levels"]][["queens"]]         <- "Queens"
  list_labels_people[["borough"]][["levels"]][["staten_island"]]  <- "Staten Island"
  
  list_labels_people[["channel"]] <- list()
  list_labels_people[["channel"]][["label"]] <- "Recruitment channel"
  list_labels_people[["channel"]][["levels"]][["grindr"]]                   <- "Grindr"
  list_labels_people[["channel"]][["levels"]][["partner_toolkit"]]          <- "Partner toolkit"
  list_labels_people[["channel"]][["levels"]][["instagram"]]                <- "Instagram"
  list_labels_people[["channel"]][["levels"]][["twitter"]]                  <- "Twitter"
  list_labels_people[["channel"]][["levels"]][["unknown"]]                  <- "Unknown"
  
  list_labels_people[["countFriendsCut"]] <- list()
  list_labels_people[["countFriendsCut"]][["label"]] <- "Count of queer/trans friends"
  list_labels_people[["countFriendsCut"]][["levels"]][["0"]]     <- "0"
  list_labels_people[["countFriendsCut"]][["levels"]][["1-5"]]   <- "1-5"
  list_labels_people[["countFriendsCut"]][["levels"]][["6-10"]]  <- "6-10"
  list_labels_people[["countFriendsCut"]][["levels"]][["11-15"]] <- "11-15"
  list_labels_people[["countFriendsCut"]][["levels"]][["16+"]]   <- "16+"
  
  list_labels_people[["countSexCut"]] <- list()
  list_labels_people[["countSexCut"]][["label"]] <- "Count of sex partners"
  list_labels_people[["countSexCut"]][["levels"]][["0"]]     <- "0"
  list_labels_people[["countSexCut"]][["levels"]][["1"]]     <- "1"
  list_labels_people[["countSexCut"]][["levels"]][["2"]]     <- "2"
  list_labels_people[["countSexCut"]][["levels"]][["3"]]     <- "3"
  list_labels_people[["countSexCut"]][["levels"]][["4"]]     <- "4"
  list_labels_people[["countSexCut"]][["levels"]][["5+"]]    <- "5+"
  
  list_labels_people[["countPhysicalCut"]] <- list()
  list_labels_people[["countPhysicalCut"]][["label"]] <- "Count of physical contact partners"
  list_labels_people[["countPhysicalCut"]][["levels"]][["0"]]     <- "0"
  list_labels_people[["countPhysicalCut"]][["levels"]][["1"]]     <- "1"
  list_labels_people[["countPhysicalCut"]][["levels"]][["2"]]     <- "2"
  list_labels_people[["countPhysicalCut"]][["levels"]][["3"]]     <- "3"
  list_labels_people[["countPhysicalCut"]][["levels"]][["4"]]     <- "4"
  list_labels_people[["countPhysicalCut"]][["levels"]][["5+"]]    <- "5+"
  
  
  list_labels_people[["createdAtCut"]] <- list()
  list_labels_people[["createdAtCut"]][["label"]] <- "Recruitment date"
  list_labels_people[["createdAtCut"]][["levels"]][["30-31 Aug 2022"]]          <- "30-31 Aug 2022"
  list_labels_people[["createdAtCut"]][["levels"]][["01-10 Sep 2022"]]          <- "01-10 Sep 2022"
  list_labels_people[["createdAtCut"]][["levels"]][["10-11 Sep 2022"]]          <- "10-11 Sep 2022"
  list_labels_people[["createdAtCut"]][["levels"]][["12 Sep - 31 Nov 2022"]]    <- "12 Sep - 31 Nov 2022"
  
  list_labels_people[["demo_group"]] <- list()
  list_labels_people[["demo_group"]][["label"]]                            <- "Race x gender"
  list_labels_people[["demo_group"]][["levels"]][["white-cisgender-man"]]  <- "White Cisgender Man"
  list_labels_people[["demo_group"]][["levels"]][["latinx-cisgender-man"]] <- "Latinx Cisgender Man"
  list_labels_people[["demo_group"]][["levels"]][["black-cisgender-man"]]  <- "Black Cisgender Man"
  list_labels_people[["demo_group"]][["levels"]][["other-cisgender-man"]]  <- "Other Cisgender Man"
  list_labels_people[["demo_group"]][["levels"]][["non-binary"]]           <- "Non-Binary Person"
  list_labels_people[["demo_group"]][["levels"]][["transgender-man"]]      <- "Transgender Man"
  list_labels_people[["demo_group"]][["levels"]][["transgender-woman"]]    <- "Transgender Woman"
  list_labels_people[["demo_group"]][["levels"]][["cisgender-woman"]]      <- "Cisgender Woman"
  list_labels_people[["demo_group"]][["levels"]][["other"]]                <- "Another Demographic"
  list_labels_people[["demo_group"]][["levels"]][["missing"]]              <- "Another Demographic"
  
  list_labels_people[["genderId"]] <- list()
  list_labels_people[["genderId"]][["label"]] <- "Gender identity"
  list_labels_people[["genderId"]][["levels"]][["cisgender-man"]]          <- "Cisgender Man"
  list_labels_people[["genderId"]][["levels"]][["non-binary"]]             <- "Non Binary"
  list_labels_people[["genderId"]][["levels"]][["transgender-man"]]        <- "Transgender Man"
  list_labels_people[["genderId"]][["levels"]][["transgender-woman"]]      <- "Transgender Woman"
  list_labels_people[["genderId"]][["levels"]][["cisgender-woman"]]        <- "Cisgender Woman"
  list_labels_people[["genderId"]][["levels"]][["other"]]                  <- "Another Demographic"
  list_labels_people[["genderId"]][["levels"]][["missing"]]                  <- "Another Demographic"
  
  list_labels_people[["hivPrep"]] <- list()
  list_labels_people[["hivPrep"]][["label"]] <- "PrEP Use"
  list_labels_people[["hivPrep"]][["levels"]][["no"]]                     <- "Not on PrEP"
  list_labels_people[["hivPrep"]][["levels"]][["yes"]]                    <- "On PrEP"

  
  list_labels_people[["hivStatus"]] <- list()
  list_labels_people[["hivStatus"]][["label"]] <- "HIV Status"
  list_labels_people[["hivStatus"]][["levels"]][["living-with-hiv"]]       <- "Living with HIV"
  list_labels_people[["hivStatus"]][["levels"]][["not-living-with-hiv"]]   <- "Not living with HIV"
  
  list_labels_people[["hivSuppressed"]] <- list()
  list_labels_people[["hivSuppressed"]][["label"]]  <- "HIV viral suppression"
  list_labels_people[["hivSuppressed"]][["levels"]][["yes"]]                     <- "Suppressed"
  list_labels_people[["hivSuppressed"]][["levels"]][["no"]]                      <- "Not Suppressed"
  
  list_labels_people[["monkeypoxVaccine"]] <- list()
  list_labels_people[["monkeypoxVaccine"]][["label"]] <- "MPOX Vaccination"
  list_labels_people[["monkeypoxVaccine"]][["levels"]][["yes"]]                   <- "Vaccinated"
  list_labels_people[["monkeypoxVaccine"]][["levels"]][["no"]]                    <- "Unvaccinated"
  
  list_labels_people[["monkeypoxTest"]] <- list()
  list_labels_people[["monkeypoxTest"]][["label"]] <- "MPOX Test"
  list_labels_people[["monkeypoxTest"]][["levels"]][["yes"]]                   <- "Tested"
  list_labels_people[["monkeypoxTest"]][["levels"]][["no"]]                    <- "Untested"
  
  list_labels_people[["NumSymptomsCut"]] <- list()
  list_labels_people[["NumSymptomsCut"]][["label"]] <- "Number STI Symptoms"
  list_labels_people[["NumSymptomsCut"]][["levels"]][["0"]]                   <- "0"
  list_labels_people[["NumSymptomsCut"]][["levels"]][["1+"]]                  <- "1+"
  
  list_labels_people[["race"]] <- list()
  list_labels_people[["race"]][["label"]] <- "Race"
  list_labels_people[["race"]][["levels"]][["white"]]                    <- "White"
  list_labels_people[["race"]][["levels"]][["latinx"]]                   <- "Latinx"
  list_labels_people[["race"]][["levels"]][["black"]]                    <- "Black"
  list_labels_people[["race"]][["levels"]][["asian"]]                    <- "Asian"
  list_labels_people[["race"]][["levels"]][["multiple"]]                 <- "Multi Racial"
  list_labels_people[["race"]][["levels"]][["other"]]                    <- "Another Group"
  
  
  list_labels_people[["sexOrientation"]] <- list()
  list_labels_people[["sexOrientation"]][["label"]] <- "Sexual Orientation"
  list_labels_people[["sexOrientation"]][["levels"]][["gay"]]            <- "Gay"
  list_labels_people[["sexOrientation"]][["levels"]][["bisexual"]]       <- "Bisexual"
  list_labels_people[["sexOrientation"]][["levels"]][["straight"]]       <- "Straight"
  list_labels_people[["sexOrientation"]][["levels"]][["queer"]]          <- "Queer"
  list_labels_people[["sexOrientation"]][["levels"]][["something-else"]] <- "Another Orientation"
  

  list_labels_people[["travelTimeCut"]] <- list()
  list_labels_people[["travelTimeCut"]][["label"]] <- "Willing travel time for hooking up"
  list_labels_people[["travelTimeCut"]][["levels"]][["0-15 min"]]        <- "0-15 min"
  list_labels_people[["travelTimeCut"]][["levels"]][["16-30 min"]]       <- "16-30 min"
  list_labels_people[["travelTimeCut"]][["levels"]][["31-45 min"]]       <- "31-45 min"
  list_labels_people[["travelTimeCut"]][["levels"]][["45+ min"]]         <- "45+ min"

  
  list_labels_people[["groupSex"]] <- list()
  list_labels_people[["groupSex"]][["label"]]                             <- "Recent group sexual or physical contact"
  list_labels_people[["groupSex"]][["levels"]][["yes"]]                   <- "Yes"
  list_labels_people[["groupSex"]][["levels"]][["no"]]                    <- "No"
  
  list_labels_people[["overall"]] <- list()
  list_labels_people[["overall"]][["label"]]                             <- "Total participants"
  list_labels_people[["overall"]][["levels"]][["overall"]]                   <- "Count (%)"
  
  
  
  
  
  list_labels_places <- list()
  
  list_labels_places[["intervention_setting"]] <- list()
  list_labels_places[["intervention_setting"]][["label"]]                              <- "Intervention setting"
  list_labels_places[["intervention_setting"]][["levels"]][["home"]]                   <- "Home"
  list_labels_places[["intervention_setting"]][["levels"]][["no"]]                     <- "Sex venue"
  list_labels_places[["intervention_setting"]][["levels"]][["yes"]]                    <- "Phys venue"
  
  list_labels_places[["place_borough"]] <- list()
  list_labels_places[["place_borough"]][["label"]]                              <- "Borough"
  list_labels_places[["place_borough"]][["levels"]][["Bronx"]]          <- "Bronx"
  list_labels_places[["place_borough"]][["levels"]][["Brooklyn"]]       <- "Brooklyn"
  list_labels_places[["place_borough"]][["levels"]][["Manhattan"]]      <- "Manhattan"
  list_labels_places[["place_borough"]][["levels"]][["Queens"]]         <- "Queens"
  list_labels_places[["place_borough"]][["levels"]][["Staten Island"]]  <- "Staten Island"
  
  list_labels_places[["placeType"]] <- list()
  list_labels_places[["placeType"]][["label"]]                              <- "Place type"
  list_labels_places[["placeType"]][["levels"]][["concert"]]                <- "Concert/Theatre/Show"
  list_labels_places[["placeType"]][["levels"]][["theatre/show"]]           <- "Concert/Theatre/Show"
  list_labels_places[["placeType"]][["levels"]][["darkroom"]]               <- "Dark Room/Sex Party"
  list_labels_places[["placeType"]][["levels"]][["sex-party"]]              <- "Dark Room/Sex Party"
  list_labels_places[["placeType"]][["levels"]][["dance-party"]]            <- "Dance Party"
  list_labels_places[["placeType"]][["levels"]][["sport-game"]]             <- "Sport Game"
  list_labels_places[["placeType"]][["levels"]][["private-residence-"]]     <- "Private Residence"
  list_labels_places[["placeType"]][["levels"]][["something-else"]]         <- "Something Else"
  
  list_labels_places[["placeSex"]] <- list()
  list_labels_places[["placeSex"]][["label"]]                               <- "Sexual contact at place"
  list_labels_places[["placeSex"]][["levels"]][["no"]]                      <- "Did not have sex"
  list_labels_places[["placeSex"]][["levels"]][["yes"]]                     <- "Had sex"
  
  list_labels_places[["distanceFromHome"]] <- list()
  list_labels_places[["distanceFromHome"]][["label"]]                                     <- "Distance from home"
  list_labels_places[["distanceFromHome"]][["levels"]][["Same Community District"]]       <- "Same community as home"
  list_labels_places[["distanceFromHome"]][["levels"]][["Same Borough"]]                  <- "Same borough as home"
  list_labels_places[["distanceFromHome"]][["levels"]][["Different Borough"]]              <- "Different borough from home"
  
  
  list(people = list_labels_people, places = list_labels_places)
  
}


