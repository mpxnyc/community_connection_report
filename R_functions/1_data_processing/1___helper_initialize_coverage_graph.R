helper_initialize_coverage_graph <- function(bipartite_graph, strata){
  
  bipartite_graph_initialized                            <- bipartite_graph |> 
    tidygraph::activate(nodes) |>
    tidygraph::mutate(intervention_ranking = NA) |>
    tidygraph::mutate(stratum = {{strata}}) |>
    tidygraph::mutate(intervention_contact_place = NA)
  
  attr(bipartite_graph_initialized, "top_rank")          <- 0
  attr(bipartite_graph_initialized, "strata_levels")     <- bipartite_graph_initialized |>
    tidygraph::filter(type) |>
    tidygraph::pull(stratum) |>
    unique()
  
  attr(bipartite_graph_initialized, "n_strata")          <- attr(bipartite_graph_initialized, "strata_levels") |> 
    length()
  
  
  bipartite_graph_initialized
}
