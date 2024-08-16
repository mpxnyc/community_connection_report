apply_style_coverage_bar <- function(plot, caption_hjust = 0){
  
  plot +
    ggplot2::theme_void() + 
    scale_fill_manual("", values = c(
      dark_blue,
      dark_pink,
      light_blue
    )) +
    theme(
      plot.title    = element_text(hjust = 0.5, margin = margin(0, 0, 1, 0, "mm")),
      plot.subtitle = element_text(hjust = 0.5, margin = margin(0, 0, 15, 0, "mm")),
      axis.text = element_text(),
      plot.caption  = element_text( hjust = caption_hjust),
      legend.position = "none"
    )  +
    ggplot2::scale_x_discrete(
      limits=rev
    ) +
    ggplot2::scale_y_continuous(
      "Proportion Coverage", 
      labels = scales::percent
    ) + 
    ggplot2::theme(
      axis.text = element_text(),
      panel.grid.major.x = element_line(),
      plot.background = element_rect(color = "black"),
      axis.title.x = element_text(margin = margin(5, 0, 0, 0)),
      plot.margin = margin(10, 10, 10, 10)
    ) 
}
