plot_coverage_bar            <- function(data){
  
  data |>
    dplyr::arrange(stratum, intervention_ranking) |>
    dplyr::group_by(stratum) |>
    dplyr::mutate(rank = 1:dplyr::n()) |>
    dplyr::mutate(name = as.character(name)) |>
    {function(x) dplyr::mutate(x, name = factor(name, unique(x$name)))}() |>
    ggplot2::ggplot() + 
    ggplot2::geom_bar(
                      ggplot2::aes(
                                    x = rank, 
                                    fill = group, 
                                    y = proportion
                                    ), 
                      stat = "identity", 
                      color = "black",
                      width = 1
                    ) +
    ggplot2::geom_label(ggplot2::aes(x = rank, y = proportion, label = name)) +
    ggplot2::facet_grid(. ~ stratum, scales = "free_x")
  
}