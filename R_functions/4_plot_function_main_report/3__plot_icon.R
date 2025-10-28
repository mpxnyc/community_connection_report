plot_icon                 <- function(
                                      icon_name = "unicorn", 
                                      color = "light_purple", 
                                      shape = 3, 
                                      alpha = 1, 
                                      size = 80, 
                                      mpxnyc_colors = targets::tar_read(config_list)[[1]][["content"]][["colors"]],
                                      mpxnyc_emojis = targets::tar_read(config_list)[[1]][["content"]][["emojis"]],
                                      image_size = 0.2,
                                      image_alpha = 0.1
                                      ){
  
  mpxnyc_emojis_file <- c(paste0(here::here(), "/", mpxnyc_emojis[[icon_name]]))
  
  
  ggplot2::ggplot() + 
    ggplot2::theme_void() +
    ggplot2::geom_point(ggplot2::aes(x = 1, y = 1), size = size, color =  mpxnyc_colors[[color]], shape = shape, alpha = alpha) +
    ggimage::geom_image(ggplot2::aes(image=mpxnyc_emojis_file, x = 1, y = 1), size = image_size, alpha = image_alpha) 
  
  
}
