apply_style_radar_grid_plot <- function(plot, caption_hjust = 0){
  
  plot +
    ggplot2::scale_fill_manual("", values = c(
      dark_blue,
      dark_pink,
      dark_purple,
      light_blue,
      light_pink,
      light_purple,
      light_orange,
      dark_green,
      light_green,
      mid_blue,
      mid_purple,
      dark_brown,
      mid_brown,
      light_brown
    )) +
    ggplot2::theme(
      plot.title    = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 1, 0, "mm")),
      plot.subtitle = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 15, 0, "mm")),
      plot.caption  = ggplot2::element_text( hjust = caption_hjust, margin = ggplot2::margin(1, 1, 1, 1, "cm")),
      plot.margin   = ggplot2::margin(1,1,1,1, "cm"),
      legend.position = "bottom"
    )
}
