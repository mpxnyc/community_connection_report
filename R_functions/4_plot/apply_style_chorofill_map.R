apply_style_chorofill_map <- function(plot, show.na = FALSE){
  
  na_value <- ifelse(show.na, "grey50", "white")
  
  plot +
    theme_void() +
    scale_fill_manual(values = c(dark_blue, light_blue, "white"),  na.value = na_value) +
    theme(
      legend.position = "none",
      plot.margin = margin(0, 0, 0, 40)
    )  
}