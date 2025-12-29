make_table_freq1                <- function(
    variable = overall, 
    person_analysis = TRUE,
    data_bipartite_graph_collected = targets::tar_read(data_bipartite_graph_collected),
    data_bipartite_graph_simulated = targets::tar_read(data_bipartite_graph_simulated)
    ){
  
  make_table_freq2({{variable}}, person_analysis = person_analysis, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated) |>
    dplyr::select(-stratum, -strata)
}