theme_mpxnyc_matrix_movement <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      axis.text         = ggplot2::element_text(size = 8),
      axis.text.x       = ggplot2::element_text(angle = 90),
      legend.direction  = "vertical",
      legend.box.margin = ggplot2::unit(c(30,30,30,30), "pt"),
      legend.position = "bottom",
      plot.margin = ggplot2::unit(c(0,0,0,0), "cm"),
      strip.text.y.left = ggplot2::element_text(angle = 90),
    ) +
    ggplot2::theme(...) +
    ggplot2::theme(
      strip.text               = ggplot2::element_text(margin = ggplot2::margin(5,5,5,5), color = "#636363"),
      axis.text                = ggplot2::element_text(color = "#636363"),
      axis.text.x              =  ggplot2::element_text(size = 7, color = "#636363", margin = ggplot2::margin(5,5,5,5)),
      axis.text.y.right        =  ggplot2::element_text(size = 7, color = "#636363", margin = ggplot2::margin(5,5,5,5)),
      panel.spacing            = ggplot2::unit(5, "pt"),
      axis.title.x             = ggplot2::element_text(size = 10, face = "bold", color = "#636363", margin = ggplot2::margin(10, 0, 0, 0)),
      axis.title.y             = ggplot2::element_text(size = 10, face = "bold", color = "#636363", margin = ggplot2::margin(0, 10, 0, 0)),
      strip.placement = "outside",
      legend.direction = "horizontal",
      legend.title.position = "top"
    )
}
