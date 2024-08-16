plot_matrix_coattendence    <- function(data){
  
  data_tiles <- mpxnyc::community_sf_obj %>%
    dplyr::transmute(to = community, from = community) %>%
    tidyr::expand(to, from)
  
  
  data %>% 
    ggplot2::ggplot() +
    ggplot2::geom_point(
      aes(y =from, x = to), 
      data = data_tiles, 
      color = "white"
    ) +
    ggplot2::geom_point(
      aes(y =from, x = to, size = weight), 
      alpha = 0.5
    ) +
    ggplot2::theme_void() +
    ggplot2::theme(
      axis.text        = element_text(size = 7, color = "black"),
      axis.text.x      = element_text(angle = 90),
      axis.title       = element_text(),
      axis.title.y     = element_text(angle = 90),
      legend.position  = "none"
    ) +
    ggplot2::scale_x_discrete(
      "Destination community district", 
      position = "top"
    ) +
    ggplot2::scale_y_discrete(
      "Home community district",  
      limits=rev
    ) 
}