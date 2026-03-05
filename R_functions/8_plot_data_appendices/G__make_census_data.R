make_edge_census_data             <- function(stratum_variable, bipartite_graph = targets::tar_read(data_bipartite_graph_collected), spatial_unit_label = place_community){
  bipartite_graph |>
    tidygraph::activate(nodes) |>
    tidygraph::mutate(stratum = {{stratum_variable}}) |>
    tidygraph::activate(edges) |>
    tidygraph::mutate(stratum = tidygraph::.N()$stratum[from]) |>
    tidygraph::mutate(name = {{spatial_unit_label}}) |>
    data.frame() |>
    dplyr::filter(!is.na(name)) |>
    dplyr::group_by(stratum, name) |>
    dplyr::summarize(count = dplyr::n()) |>
    dplyr::arrange(-count) |>
    dplyr::group_by(stratum) |>
    dplyr::mutate(proportion = count / sum(count)) |>
    dplyr::mutate(cum_proportion = cumsum(proportion)) |>
    dplyr::mutate(group = "Group A") |>
    dplyr::mutate(group = ifelse(cum_proportion >= 0.33, "Group B", group)) |>
    dplyr::mutate(group = ifelse(cum_proportion >= 0.66, "Group C", group)) |>
    dplyr::mutate(group = dplyr::lag(group)) |>
    dplyr::mutate(group = ifelse(is.na(group), "Group A", group))  |>
    dplyr::arrange(stratum, cum_proportion)
}

