plot_bar                 <- function(data){
  
  ggplot2::ggplot(data) + 
    ggplot2::geom_bar(
      ggplot2::aes(x = level, fill = level, y = proportion), 
      width = 1, 
      stat = "identity", 
      color = "black"
    ) + 
    ggplot2::geom_text(
      ggplot2::aes(x = level, y = proportion + 0.05, label = count), 
      alpha = 0.1,
      size = 8
    ) 
  
  
}
