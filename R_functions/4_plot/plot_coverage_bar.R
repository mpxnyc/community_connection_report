plot_coverage_bar            <- function(data){
  
  data %>%
    arrange(-proportion) %>%
    mutate(name = as.character(name)) %>%
    mutate(name = factor(name, unique(.$name))) %>%
    ggplot2::ggplot() + 
    ggplot2::geom_bar(
      aes(x = name, 
          fill = group, 
          y = proportion
      ), 
      width = 1, 
      stat = "identity", 
      color = "black"
    ) + 
    ggplot2::coord_flip()
  
}