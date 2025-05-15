scale_fill_mpxnyc_gradient <- function(...){
  ggplot2::scale_fill_gradient2(..., low = mpxnyc_dark(2)[2], high = mpxnyc_dark(2)[1], mid = "white")
}
