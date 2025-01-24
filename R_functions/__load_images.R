
load_images <- function(root = here::here()){
  
  
  images <- list()
  
  images[["app_graphic"]]                  <- paste0(root, "/const/images/image_app_graphic.png")
  images[["campaign_graphic"]]             <- paste0(root, "/const/images/image_campaign_graphic.png") 
  images[["creative_requirements"]]        <- paste0(root, "/const/images/image_creative_requirements.png")  
  images[["mpxny"]]                        <- paste0(root, "/const/images/image_mpxny.png")  


  
  images
  
}


