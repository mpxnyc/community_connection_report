plot_netimpact_bar             <- function(data){
  data %>%
    dplyr::mutate(lcc = lcc / n_participants) %>%
    dplyr::mutate(unvaccinated = n_unvaccinated / n_participants) %>%
    dplyr::select(intervention_ranking, lcc, unvaccinated) %>%
    dplyr::filter(intervention_ranking < 41) %>%
    tidyr::pivot_longer(c(lcc, unvaccinated), names_to = "type", values_to = "proportion") %>%
    ggplot2::ggplot() +
    ggplot2::geom_point(
      aes(x = intervention_ranking, y = proportion, color = type), 
      stat = "identity"
    ) 
}

