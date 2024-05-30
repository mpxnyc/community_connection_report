plot_coverage_bar            <- function(data){
  
  data %>%
    ggplot2::ggplot() + 
    ggplot2::geom_bar(
      aes(x = level, 
          fill = group, 
          y = proportion
      ), 
      width = 1, 
      stat = "identity", 
      color = "black"
    ) + 
    ggplot2::theme_void() + 
    ggplot2::scale_x_discrete(
    ) +
    ggplot2::scale_y_continuous(
      "Proportion of participants", 
      labels = scales::percent
    ) + 
    ggplot2::theme(
      axis.text = element_text(),
      axis.text.x = element_text(angle = 90),
      panel.grid.major.y = element_line()
    )
  
}