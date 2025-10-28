scale_fill_mpxnyc <- function(..., option = "all", aesthetics = "fill", values = NULL) {
  ggplot2::discrete_scale(
    ...,
    aesthetics = aesthetics, 
    palette = mpxnyc_colors(option = option, values = values)
  )
}

