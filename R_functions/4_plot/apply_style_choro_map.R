apply_style_choro_map <- function(plot, show.na = FALSE){
  
  na_value <- ifelse(show.na, "grey50", "white")
  
  plot +
    theme_void() +
    scale_fill_gradient(low = "white", high = dark_blue, na.value = na_value) +
    theme(
      legend.position = "right"
    )  
}