plot_radar_stratified2   <- function(data){
  data |>
    dplyr::mutate(prop_label = scales::percent(proportion, accuracy = 1)) |>
    ggplot2::ggplot() +
    ggplot2::geom_bar(ggplot2::aes(x = level, y = proportion, fill = level), stat = "identity", width = 1, color = "black") +
    ggplot2::facet_grid( stratum_a ~ stratum_b, switch = "y", labeller = ggplot2::label_wrap_gen(width = 10), scales = "free") 
}

plot_bar_stratified   <- function(data){
  data |>
    dplyr::mutate(prop_label = scales::percent(proportion, accuracy = 1)) |>
    ggplot2::ggplot() +
    ggplot2::geom_bar(ggplot2::aes(x = level, y = proportion, fill = level), stat = "identity", width = 1, color = "black") +
    ggplot2::facet_grid( stratum_a ~ stratum_b, switch = "y", labeller = ggplot2::label_wrap_gen(width = 10), scales = "free") 
}