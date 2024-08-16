plot_netimpact_bar             <- function(data){
  data %>%
    mutate(lcc = lcc / n_participants) %>%
    mutate(unvaccinated = n_unvaccinated / n_participants) %>%
    ggplot2::ggplot() +
    ggplot2::geom_point(
      aes(x = intervention_ranking, y = lcc), 
      stat = "identity", 
      color = dark_pink
    ) +
    ggplot2::geom_point(
      aes(x = intervention_ranking, y = unvaccinated), 
      stat = "identity", 
      color = dark_blue)
}