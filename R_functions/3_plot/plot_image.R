plot_image <- function(name = "campaign_graphic"){
  paste0( here::here(), "/", targets::tar_read(config_list)[[1]][["content"]][["images"]][[name]]) |>
    magick::image_read() 
  
}