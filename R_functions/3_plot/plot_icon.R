plot_icon                 <- function(
                                      icon_name = "unicorn", 
                                      color = "light_purple", 
                                      shape = 3, 
                                      alpha = 1, 
                                      size = 80, 
                                      mpxnyc_colors = targets::tar_read(mpxnyc_colors),
                                      mpxnyc_emojis = targets::tar_read(mpxnyc_emojis)
                                      ){
  
  
  
  ggplot2::ggplot() + 
    ggplot2::theme_void() +
    ggplot2::geom_point(ggplot2::aes(x = 1, y = 1), size = size, color =  mpxnyc_colors[[color]], shape = shape, alpha = alpha) +
    ggimage::geom_image(ggplot2::aes(image=mpxnyc_emojis[[icon_name]], x = 1, y = 1), size = 0.4) 
  
  
}
