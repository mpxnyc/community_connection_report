
plot_centrality_bar             <- function(data, centrality_measure){
  data %>%
    dplyr::filter(intervention_ranking < 41) %>%
    ggplot2::ggplot() +
    ggplot2::geom_point(
      aes(x = intervention_ranking, y = {{centrality_measure}}, color = intervention_priority), 
      stat = "identity"
    ) 
}