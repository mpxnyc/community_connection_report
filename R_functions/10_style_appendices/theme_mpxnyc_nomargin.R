theme_mpxnyc_nomargin <- function(...){
    ggplot2::theme(
      plot.margin            = ggplot2::unit(c(0, 0, 0, 0), "cm"),
    )
}

