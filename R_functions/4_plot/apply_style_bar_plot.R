apply_style_bar_plot <- function(plot, caption_hjust = 1){
  
  plot +
    theme_void() +
    scale_fill_manual("", values = c(
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
    theme(
      plot.title         = element_text(hjust = 0.5, margin = margin(0, 0, 1, 0, "mm")),
      plot.subtitle      = element_text(hjust = 0.5, margin = margin(0, 0, 15, 0, "mm")),
      #axis.title.y       = element_text(angle = 90, margin = margin(0, 10, 0, 0, "mm")),
      plot.caption       = element_text(margin = margin(60, 0, 0, 0), hjust = caption_hjust),
      panel.margin       = margin(1,1,5,1, "cm"),
      plot.margin        = margin(1,1,1,1, "cm"),
      legend.position    = "none", 
      panel.grid.major.y = ggplot2::element_line(size = 0.1),
      axis.text.x        = element_text(size = 10),
      axis.text.y        = element_text(margin = margin(0, 5, 0, 0, "mm"))
    )
}