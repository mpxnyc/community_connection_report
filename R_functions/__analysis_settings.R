load_initial_settings <- function(){
  
  settings <- list()
  
  settings[["n_reps_graph"]]     <- 10
  settings[["n_neighborhoods"]]  <- 60
  settings[["list_intervention_priority"]] <- list("contact", "movement")
  settings[["list_intervention_settings"]] <- list(c("home"), c("home", "social"), c("home", "social", "sexual"))
  
  settings[["analytic_scale"]]  <- "community"
  
    
  settings[["colors"]] <- list()
  
  
  settings[["colors"]][["dark_pink"]]      <- "#F73C95"
  settings[["colors"]][["light_pink"]]     <- "#FF99C5"
  settings[["colors"]][["dark_blue"]]      <- "#009BE8"
  settings[["colors"]][["mid_blue"]]       <- "#41BFFF"
  settings[["colors"]][["light_blue"]]     <- "#C5EFFF"
  settings[["colors"]][["dark_purple"]]    <- "#5D207A"
  settings[["colors"]][["mid_purple"]]     <- "#7F3F98"
  settings[["colors"]][["light_purple"]]   <- "#9E7ACC"
  settings[["colors"]][["dark_green"]]     <- "#459B0E"
  settings[["colors"]][["light_green"]]    <- "#59C618"
  settings[["colors"]][["dark_orange"]]    <- "#EA773D"
  settings[["colors"]][["light_orange"]]   <- "#FFAA7B"
  settings[["colors"]][["dark_brown"]]     <- "#844D28"
  settings[["colors"]][["mid_brown"]]      <- "#D89000"
  settings[["colors"]][["light_brown"]]    <- "#FFCD2E"
  settings[["colors"]][["all_colors"]]     <-   settings[["colors"]] %>% unlist()
  
  
  settings
}


