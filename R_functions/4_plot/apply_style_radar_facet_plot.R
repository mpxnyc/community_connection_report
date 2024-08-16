apply_style_radar_facet_plot <- function(plot, caption_hjust = 0){
  
  plot +
    ggplot2::theme_void() +
    ggplot2::theme(
      legend.position = "bottom",
      strip.text    = element_text( hjust = 0.5, size = 10),
      strip.text.y  = element_text(angle =90),
      plot.title    = element_text(hjust = 0.5),
      plot.subtitle = element_text(hjust = 0.5, margin = margin(1, 0, 15, 0, "mm")),
      plot.caption  = element_text( hjust = 0)
    ) +
    ggplot2::scale_y_continuous(breaks = c(0,0.25, 0.50, 1), limits = c(-0.8, 1)) +
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
      plot.title    = element_text(hjust = 0.5, margin = margin(0, 0, 1, 0, "mm")),
      plot.subtitle = element_text(hjust = 0.5, margin = margin(0, 0, 15, 0, "mm")),
      plot.caption  = element_text( hjust = caption_hjust, margin = margin(1, 1, 1, 1, "cm")),
      plot.margin   = margin(1,1,1,1, "cm")
    )
}