scale_axis_mpxnyc <- function(label ="MPX NYC sample proportion"){
  ggplot2::scale_y_continuous(label, labels = function(x) scales::percent(abs(x))) 
}