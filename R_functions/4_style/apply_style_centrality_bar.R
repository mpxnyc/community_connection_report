apply_style_centrality_bar <- function(plot){
  plot +
  ggplot2::scale_y_continuous("Proportion of participants", limits = c(0, 1), labels = scales::percent) +
    ggplot2::scale_x_continuous("Intervention order", limits = c(0, 40), breaks = c(0, 10, 20, 30, 40)) +
    ggplot2::theme_void() +
    ggplot2::scale_fill_manual("", values = c(light_blue, mid_blue, dark_blue)) +
    ggplot2::theme(
      axis.text = ggplot2::element_text(),
      axis.title = ggplot2::element_text(margin = ggplot2::margin(15,5,5,5)),
      axis.title.y = ggplot2::element_text(angle = 90), 
      legend.position = "bottom",
      plot.margin = ggplot2::margin(10,10,10,10),
      strip.text = ggplot2::element_text(margin = ggplot2::margin(10, 10, 10, 10))
    )
}