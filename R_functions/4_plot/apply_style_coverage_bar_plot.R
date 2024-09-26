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
      plot.caption  = element_text( hjust = caption_hjust),
      legend.position = "none"
    )  +
    ggplot2::scale_x_discrete(
      position = "top"
    ) +
    ggplot2::scale_y_continuous(
      "Coverage", 
      labels = function(x) {scales::percent(abs(x))}
    ) + 
    ggplot2::theme(
      axis.text.y = element_text(margin = margin(10, 10,10,10)),
      panel.grid.major.y = element_line(),
      #plot.background = element_rect(color = "white", fill = "transparent"),
      axis.title.y = element_text(margin = margin(5, 0, 0, 0), angle = 90),
      plot.margin = margin(15, 70, 20, 10),
      axis.text.x = element_text(angle = 45, size = 8)
    ) 
}
