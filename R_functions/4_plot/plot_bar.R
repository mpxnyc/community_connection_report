plot_bar                 <- function(data){
  
  ggplot2::ggplot(data) + 
    ggplot2::geom_bar(
      aes(x = level, fill = level, y = proportion), 
      width = 1, 
      stat = "identity", 
      color = "black"
    ) + 
    ggplot2::geom_text(
      aes(x = level, y = proportion + 0.05, label = count), 
      alpha = 0.1,
      size = 8
    ) +
    ggplot2::theme_void() + 
    ggplot2::scale_x_discrete(
      drop = FALSE
    ) +
    ggplot2::scale_y_continuous(
      "Proportion of participants", 
      labels = scales::percent
    ) +
    ggplot2::scale_x_discrete(
      labels = scales::label_wrap(10)
    )
  
  
}
