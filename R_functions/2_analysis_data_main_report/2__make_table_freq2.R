make_table_freq2                <- function(
    variable = overall, 
    stratum_variable = overall, 
    person_analysis = TRUE,
    data_bipartite_graph_collected = targets::tar_read(data_bipartite_graph_collected),
    data_bipartite_graph_simulated = targets::tar_read(data_bipartite_graph_simulated)
    ){
  
  make_table_freq3({{variable}}, {{stratum_variable}}, person_analysis = person_analysis, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated) |>
    dplyr::select(-stratum_b, -strata_b) |>
    dplyr::rename(stratum = stratum_a, strata = strata_a)
}
