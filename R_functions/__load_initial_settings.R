load_initial_settings <- function(){
  
  settings <- list()
  
  settings[["n_reps_graph"]]     <- 10
  settings[["n_neighborhoods"]]  <- 67
  settings[["list_intervention_priority"]] <- list("contact", "movement")
  settings[["list_intervention_settings"]] <- list(c("home"), c("home", "social"), c("home", "social", "sexual"))
  
  settings[["analytic_scale"]]  <- "community"
  
  settings
}


