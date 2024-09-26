apply_style_coverage_map <- function(plot, caption_hjust = 0){
  
  plot +
    theme_void() +
    scale_fill_manual("", values = c(
      dark_blue,
      dark_pink,
      light_blue
    ),
    na.translate = FALSE
    ) +
    theme(
      plot.title    = element_text(hjust = 0.5, margin = margin(0, 0, 1, 0, "mm")),
      plot.subtitle = element_text(hjust = 0.5, margin = margin(0, 0, 15, 0, "mm")),
      axis.title.x  = element_text(angle = 90, margin = margin(0, 10, 0, 0, "mm")),
      plot.caption  = element_text( hjust = caption_hjust),
      panel.margin  = margin(1,1,1,1, "cm"),
      plot.margin   = margin(30,30,10,30),
      legend.position = "none",
      plot.background = element_rect( fill = "transparent", color = "white")
      
      
    )  
}