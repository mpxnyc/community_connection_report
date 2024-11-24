
plot_centrality_bar             <- function(data){
  data %>%
    ggplot() +
    geom_bar(aes(y = proportion, x = intervention_ranking, fill = group), stat = "identity", width = 1) +
    geom_hline(aes(yintercept = 0.5), size = 1, color = "white") +
    geom_hline(aes(yintercept = 0.25), size = 1,  color = "white") +
    geom_hline(aes(yintercept = 0.75), size = 1, color = "white") +
    geom_vline(aes(xintercept = 10), size = 1, color = "white") +
    geom_vline(aes(xintercept = 20), size = 1, color = "white") +
    geom_vline(aes(xintercept = 30), size = 1, color = "white") +
    facet_grid( . ~ intervention_priority )
}