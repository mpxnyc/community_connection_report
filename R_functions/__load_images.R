helper_emoji_path <- function(icon){
  paste0(here::here(), "/R_resources/MPX_", icon, ".svg") 
}

load_emojis <- function(){
  
  
  emojis <- list()
  
  emojis[["bear"]]        <- helper_emoji_path("bear")
  emojis[["devil"]]       <- helper_emoji_path("devil")
  emojis[["droplets"]]    <- helper_emoji_path("droplets")
  
  emojis[["eggplant"]]    <- helper_emoji_path("eggplant")
  emojis[["peach"]]       <- helper_emoji_path("peach")
  emojis[["pignose"]]     <- helper_emoji_path("pignose")
  
  emojis[["taco"]]        <- helper_emoji_path("taco")
  emojis[["tulip"]]       <- helper_emoji_path("tulip")
  emojis[["unicorn"]]     <- helper_emoji_path("unicorn")

  
  emojis
  
}


