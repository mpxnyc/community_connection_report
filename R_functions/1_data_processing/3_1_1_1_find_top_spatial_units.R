
find_top_spatial_units <- function(bipartite_graph, intervention_priority_input, stratum_input){
  bipartite_graph |>
    tidygraph::activate(nodes) |>
    tidygraph::filter(is.na(intervention_ranking)) |>
    tidygraph::filter(stratum == stratum_input | !type) |>
    igraph::simplify() |>
    tidygraph::as_tbl_graph() |>
    {function(x) tidygraph::mutate(x, contact = igraph::degree(x))}() |>
    igraph::bipartite.projection(which = "false") |>
    tidygraph::as_tbl_graph() |>
    {function(x) tidygraph::mutate(x, movement = igraph::strength(x))}() |>
    data.frame() |>
    {function(x) dplyr::mutate(x, count = x[,intervention_priority_input])}() |>
    dplyr::arrange(rep, -count) |>
    dplyr::group_by(rep) |>
    dplyr::summarize(name = dplyr::first(name)) |>
    dplyr::pull(name)
}

