plot_netimpact_bar             <- function(data){
  data %>%
    ggplot2::ggplot() +
    ggplot2::geom_bar(
      aes(x = intervention_ranking, y = est, fill = name), 
      stat = "identity", 
      position = "fill",
      width = 1,
      alpha = 0.8
    ) 
}