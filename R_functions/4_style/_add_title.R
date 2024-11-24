add_title <- function(plot, title, wrap_n_title = 5000000, subtitle = "", wrap_n_subtitle = 5000000){
  
  plot + 
    labs(
      title  = title %>% str_wrap(wrap_n_title),
      subtitle = subtitle %>% str_wrap(wrap_n_subtitle)
    )
}