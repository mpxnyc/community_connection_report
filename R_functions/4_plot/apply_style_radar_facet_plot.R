apply_style_radar_facet_plot <- function(plot, caption_hjust = 0){
  
  plot +
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