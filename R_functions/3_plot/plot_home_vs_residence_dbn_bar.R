plot_home_vs_residence_dbn_bar <- function(data){
  
  ggplot2::ggplot(data) +
    ggplot2::geom_bar(
      ggplot2::aes(x = community, y = weight, fill = borough), 
      stat = "identity", 
      size = 0.6, 
      width = 0.8,
      color = "black",
      position = "dodge"
    ) 
  
}