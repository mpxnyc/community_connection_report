find_participant_intervention_contact_place <- function(bipartite_graph, intervention_priority_input, strata){
  
  strata           <- rlang::enquo(strata)
  strata_name      <- rlang::quo_text(strata)
  
  coverage_graph   <- helper_initialize_coverage_graph(bipartite_graph, {{strata}})
  
  n_strata         <- attr(coverage_graph, "n_strata")
  strata_levels    <- attr(coverage_graph, "strata_levels")
  n_spatial_units  <- attr(coverage_graph, "n_spatial_units")
  

  seq(n_spatial_units) |>
    purrr::reduce(
      function(accumulated_value, next_value){
        strata_levels[(next_value %% n_strata) + 1] |>
            {function(x) find_top_spatial_units(accumulated_value, intervention_priority_input, x)}() |>
            {function(x) mark_people_connected_to_top_spatial_units(accumulated_value, x)}()
      },
      .init = coverage_graph
    ) |>
    dplyr::mutate(strata                = strata_name) |>
    dplyr::mutate(intervention_priority = intervention_priority_input) |>
    dplyr::mutate(intervention_ranking  = ifelse(is.na(intervention_ranking), 999, intervention_ranking)) |>
    data.frame() |>
    dplyr::tibble() |>
    dplyr::filter(type)
  
}



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
