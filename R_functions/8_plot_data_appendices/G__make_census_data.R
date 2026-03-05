make_edge_census_data             <- function(stratum_variable, bipartite_graph = targets::tar_read(data_bipartite_graph_collected), spatial_unit_label = place_community){
  bipartite_graph |>
    tidygraph::activate(nodes) |>
    tidygraph::mutate(stratum = {{stratum_variable}}) |>
    tidygraph::activate(edges) |>
    tidygraph::mutate(stratum = tidygraph::.N()$stratum[from]) |>
    tidygraph::mutate(name = {{spatial_unit_label}}) |>
    data.frame() |>
    dplyr::group_by(stratum, name) |>
    dplyr::summarize(count = dplyr::n()) |>
    dplyr::group_by(stratum) |>
    dplyr::mutate(proportion = count / sum(count)) |>
    dplyr::ungroup()
}

