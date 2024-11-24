plot_coverage_bar            <- function(data){
  
  data %>%
    arrange(intervention_ranking) %>%
    mutate(name = as.character(name)) %>%
    mutate(name = factor(name, unique(.$name))) %>%
    ggplot2::ggplot() + 
    ggplot2::geom_bar(
      aes(x = name, 
          fill = group, 
          y = proportion
      ), 
      stat = "identity", 
      color = "black",
      width = 1
    ) 
  
}