theme_mpxnyc_radar_people <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      legend.position = "bottom",
      plot.margin = ggplot2::unit(c(3,2,3,2), "cm")
    ) +
    ggplot2::theme(...)
}