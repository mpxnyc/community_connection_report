make_plotdata_racegender_radar_grid <- function(variable = sexOrientation, data_bipartite_graph_collected, data_bipartite_graph_simulated){
  make_table_freq2({{variable}}, demo_group, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated) |>
    dplyr::mutate(stratum = factor(stratum, c("White cisgender man", "Latinx cisgender man", "Black cisgender man", "Transgender man", "Transgender woman","Non binary", "Cisgender woman",  "Other cisgender man", "Another demographic")))
}