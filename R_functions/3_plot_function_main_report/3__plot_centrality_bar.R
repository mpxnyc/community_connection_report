
plot_centrality_bar             <- function(data){
  data |>
    ggplot2::ggplot() +
          ggplot2::geom_bar(ggplot2::aes(y = proportion, x = intervention_ranking, fill = group), stat = "identity", width = 1) +
          ggplot2::geom_hline(ggplot2::aes(yintercept = 0.5), size = 1, color = "white") +
          ggplot2::geom_hline(ggplot2::aes(yintercept = 0.25), size = 1,  color = "white") +
          ggplot2::geom_hline(ggplot2::aes(yintercept = 0.75), size = 1, color = "white") +
          ggplot2::geom_vline(ggplot2::aes(xintercept = 10), size = 1, color = "white") +
          ggplot2::geom_vline(ggplot2::aes(xintercept = 20), size = 1, color = "white") +
          ggplot2::geom_vline(ggplot2::aes(xintercept = 30), size = 1, color = "white") +
          ggplot2::facet_grid( . ~ intervention_priority )
}