plot_coverage_bar            <- function(data){
  
  data |>
    dplyr::arrange(intervention_ranking) |>
    dplyr::mutate(name = as.character(name)) |>
    {function(x) dplyr::mutate(x, name = factor(name, unique(x$name)))}() |>
    ggplot2::ggplot() + 
    ggplot2::geom_bar(
      ggplot2::aes(x = name, 
          fill = group, 
          y = proportion
      ), 
      stat = "identity", 
      color = "black",
      width = 1
    ) 
  
}