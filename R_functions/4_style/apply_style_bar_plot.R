apply_style_bar_plot <- function(plot, caption_hjust = 1){
  
  plot +
    ggplot2::scale_x_discrete(drop = FALSE) +
    ggplot2::scale_y_continuous("Proportion of participants", labels = scales::percent) +
    ggplot2::scale_x_discrete(labels = scales::label_wrap(10)) + 
    ggplot2::theme_void() +
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
      plot.title         = element_text(hjust = 0.5, margin = margin(0, 0, 1, 0, "mm")),
      plot.subtitle      = element_text(hjust = 0.5, margin = margin(0, 0, 15, 0, "mm")),
      plot.caption       = element_text(margin = margin(60, 0, 0, 0), hjust = caption_hjust),
      panel.margin       = margin(1,1,5,1, "cm"),
      plot.margin        = margin(1,1,1,1, "cm"),
      legend.position    = "none", 
      panel.grid.major.y = ggplot2::element_line(size = 0.1),
      axis.text.x        = element_text(size = 10),
      axis.text.y        = element_text(margin = margin(0, 5, 0, 0, "mm"))
    )
}