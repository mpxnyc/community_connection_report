make_plotdata_racegender_mixing_matrix <- function(data_bipartite_graph_simulated = targets::tar_read(data_bipartite_graph_simulated)){
  make_table_mixing_2(demo_group, data_bipartite_graph_simulated = data_bipartite_graph_simulated)  |>
    dplyr::filter(ego_level != "Another demographic") |>
    dplyr::filter(alter_level != "Another demographic") 
}