plot_home_vs_residence_dbn_bar <- function(data){
  
  ggplot2::ggplot(data) +
    ggplot2::geom_bar(
      ggplot2::aes(x = community, y = weight, fill = borough, alpha = highlight), 
      stat = "identity", 
      size = 0.2, 
      width = 1,
      color = "white",
      position = "dodge"
    ) 
  
}