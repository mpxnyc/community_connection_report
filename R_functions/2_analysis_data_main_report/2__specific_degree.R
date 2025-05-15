specific_degree           <- function(graph, variable){
  
  levels_vec <- graph |>
    dplyr::filter(!is.na({{variable}})) |>
    dplyr::pull({{variable}}) |>
    unique()
  
  levels_vec |>
    purrr::map(
      function(level) specific_degree_single(graph, {{variable}}, level)
    ) |>
    dplyr::bind_rows()
}
