helper_image_path <- function(icon){
  paste0(here::here(), "/R_resources/image_", icon, ".png") 
}

load_images <- function(){
  
  
  images <- list()
  
  images[["app_graphic"]]                  <- helper_image_path("app_graphic")
  images[["campaign_graphic"]]             <- helper_image_path("campaign_graphic")
  images[["creative_requirements"]]        <- helper_image_path("creative_requirements")
  images[["mpxny"]]                        <- helper_image_path("mpxny")


  
  images
  
}


