apply_style_matrix_movement <- function(plot, caption_hjust = 0){
  
  plot +
    ggplot2::theme_void() +
    ggplot2::theme(
      axis.text        = element_text(size = 7, color = "black", margin = margin(10,10,10,10)),
      axis.text.x      = element_text(angle = 90),
      axis.title       = element_text(margin = margin(10,10,10,10)),
      axis.title.y     = element_text(angle = 90),
      legend.position = "right",
      panel.margin  = margin(1,1,1,1, "cm"),
      panel.grid = element_line(color = "black", size = 0.1),
      plot.title    = element_text(hjust = 0.5, margin = margin(0, 0, 1, 0, "mm")),
      plot.subtitle = element_text(hjust = 0.5, margin = margin(0, 0, 15, 0, "mm")),
      plot.caption  = element_text( hjust = caption_hjust),
      plot.margin   = margin(1,1,1,1, "cm")
    ) +
    ggplot2::scale_x_discrete(
      "Destination community district", 
      position = "top"
    ) +
    ggplot2::scale_y_discrete(
      "Home community district",  
      limits=rev
    )  +
    scale_fill_manual("Home Borough", values = c(
      dark_blue,
      dark_pink,
      dark_purple,
      dark_green,
      dark_brown
    )) +
    scale_color_manual("Destination Borough", values = c(
      dark_blue,
      dark_pink,
      dark_purple,
      dark_green,
      dark_brown
    )) +
    guides(color = guide_legend(), fill = guide_legend(), weight = "none")
}