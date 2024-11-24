apply_style_centrality_bar <- function(plot){
  plot +
  scale_y_continuous("Proportion of participants", limits = c(0, 1), labels = scales::percent) +
    scale_x_continuous("Intervention order", limits = c(0, 40), breaks = c(0, 10, 20, 30, 40)) +
    theme_void() +
    scale_fill_manual("", values = c(light_blue, mid_blue, dark_blue)) +
    theme(
      axis.text = element_text(),
      axis.title = element_text(margin = margin(15,5,5,5)),
      axis.title.y = element_text(angle = 90), 
      legend.position = "bottom",
      plot.margin = margin(10,10,10,10),
      strip.text = element_text(margin = margin(10, 10, 10, 10))
    )
}