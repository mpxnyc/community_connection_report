apply_style_matrix_mixing_plot <- function(plot, caption_hjust = 0){
  
  plot +
    theme(
      plot.title    = element_text(hjust = 0.5, margin = margin(0, 0, 1, 0, "mm")),
      plot.subtitle = element_text(hjust = 0.5, margin = margin(0, 0, 15, 0, "mm")),
      plot.caption  = element_text( hjust = caption_hjust),
      panel.margin  = margin(1,1,1,1, "cm"),
      plot.margin   = margin(1,1,1,1, "cm"),
      legend.position = "bottom"
    ) +
    scale_fill_gradient2("", trans = "log", low = dark_blue, mid = "white", high = dark_pink)  
}