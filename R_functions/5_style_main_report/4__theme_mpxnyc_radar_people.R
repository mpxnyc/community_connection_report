theme_mpxnyc_radar_people <- function(...){
    ggplot2::theme(
      legend.position = "bottom",
      panel.spacing = ggplot2::unit(0, "cm"),
      strip.clip = "off",
      strip.text = ggplot2::element_text(size = 10),
      plot.title = ggplot2::element_text(hjust = 0.5, size = 25),
      legend.text = ggplot2::element_text(size = 20)
    ) +
    ggplot2::theme(...)
}