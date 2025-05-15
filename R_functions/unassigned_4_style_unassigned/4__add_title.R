add_title <- function(plot, title, wrap_n_title = 5000000, subtitle = "", wrap_n_subtitle = 5000000){
  
  plot + 
    ggplot2::labs(
      title  = title |> stringr::str_wrap(wrap_n_title),
      subtitle = subtitle |> stringr::str_wrap(wrap_n_subtitle)
    )
}