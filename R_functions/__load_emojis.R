

load_emojis <- function(root = here::here()){
  
  
  emojis <- list()
  
  emojis[["bear"]]        <- paste0(root, "/__const/emojis/MPX_bear.svg")
  emojis[["devil"]]       <- paste0(root, "/__const/emojis/MPX_devil.svg")
  emojis[["droplets"]]    <- paste0(root, "/__const/emojis/MPX_droplets.svg")
  
  emojis[["eggplant"]]    <- paste0(root, "/__const/emojis/MPX_eggplant.svg")
  emojis[["peach"]]       <- paste0(root, "/__const/emojis/MPX_peach.svg")
  emojis[["pignose"]]     <- paste0(root, "/__const/emojis/MPX_pignose.svg")
  
  emojis[["taco"]]        <- paste0(root, "/__const/emojis/MPX_taco.svg")
  emojis[["tulip"]]       <- paste0(root, "/__const/emojis/MPX_tulip.svg")
  emojis[["unicorn"]]     <- paste0(root, "/__const/emojis/MPX_unicorn.svg")

  
  emojis
  
}


