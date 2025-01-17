apply_style_matrix_movement <- function(plot, caption_hjust = 0){
  
  plot +
    ggplot2::theme_void() +
    ggplot2::theme(
      axis.text         = ggplot2::element_text(size = 7, color = "black", margin = ggplot2::margin(10,10,10,10)),
      axis.text.x       = ggplot2::element_text(angle = 90),
      axis.title        = ggplot2::element_text(margin = ggplot2::margin(10,10,10,10)),
      axis.title.y      = ggplot2::element_text(angle = 90),
      legend.box        = "vertical",
      legend.box.margin = ggplot2::margin(1,1,1,1, "cm"),
      legend.position   = "bottom",
      panel.grid        = ggplot2::element_line(color = "black", size = 0.1),
      plot.caption      = ggplot2::element_text( hjust = caption_hjust),
      plot.subtitle     = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 15, 0, "mm")),
      plot.title        = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 1, 0, "mm"))
    ) +
    ggplot2::scale_x_discrete("Contact venue community distrtict", position = "top") +
    ggplot2::scale_y_discrete("Residence community district",  limits=rev)  +
    ggplot2::scale_size_continuous("Count") +
    ggplot2::scale_fill_manual("Home borough", values = c(
      dark_blue,
      dark_pink,
      dark_purple,
      dark_green,
      dark_brown
    )) +
    ggplot2::scale_color_manual( "Contact venue\nborough", values = c(
      dark_blue,
      dark_pink,
      dark_purple,
      dark_green,
      dark_brown
    )) +
    ggplot2::guides( size = ggplot2::guide_legend(order = 3), fill = ggplot2::guide_legend(order = 2), color = ggplot2::guide_legend(order = 1))
}