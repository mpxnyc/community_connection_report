scale_alpha_mpxnyc <- function(){
  ggplot2::scale_alpha_manual("MPX NYC Spatial Concentration", values = c("highlight" = 1, "lowlight" = 0.5), guide="none") 
}