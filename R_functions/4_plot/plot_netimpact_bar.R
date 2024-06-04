plot_netimpact_bar             <- function(data){
  data %>%
    ggplot2::ggplot() +
    ggplot2::geom_bar(
      aes(x = intervention_ranking, y = est, fill = name), 
      stat = "identity", 
      position = "fill"
    ) +
    ggplot2::facet_grid(intervention_stratification ~ intervention_priority)
}