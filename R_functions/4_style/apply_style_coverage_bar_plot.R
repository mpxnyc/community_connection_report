apply_style_coverage_bar <- function(plot, caption_hjust = 0){
  
  plot +
    ggplot2::theme_void() + 
    ggplot2::scale_fill_manual("", values = c(dark_blue, dark_pink, light_blue)) +
    ggplot2::scale_x_discrete(position = "top") +
    ggplot2::scale_y_continuous("Coverage", labels = function(x) {scales::percent(abs(x))}) + 
    ggplot2::theme(
      axis.text.x         = ggplot2::element_text(angle = 45, size = 8),
      axis.text.y         = ggplot2::element_text(margin = ggplot2::margin(10, 10,10,10)),
      axis.title.y        = ggplot2::element_text(margin = ggplot2::margin(5, 0, 0, 0), angle = 90),
      legend.position     = "none",
      panel.grid.major.y  = ggplot2::element_line(),
      plot.caption        = ggplot2::element_text( hjust = caption_hjust),
      plot.margin         = ggplot2::margin(15, 70, 20, 10),
      plot.subtitle       = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 15, 0, "mm")),
      plot.title          = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 1, 0, "mm"))
    ) 
}
