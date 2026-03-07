make_plotdata_racegender_radar_grid <- function(
                                                  variable = sexOrientation, 
                                                  data_bipartite_graph_collected = targets::tar_read(data_bipartite_graph_collected), 
                                                  data_bipartite_graph_simulated = targets::tar_read(data_bipartite_graph_simulated)
                                                  ){
  stratified <- make_table_freq2({{variable}}, demo_group, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated)
  
  overall <- make_table_freq2({{variable}}, overall, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated)
  
  stratified |>
    rbind(overall) |>
    dplyr::mutate(stratum = factor(stratum, 
                                   c("overall", "White cisgender man", "Latinx cisgender man", "Black cisgender man", "Transgender man", "Transgender woman","Non binary", "Cisgender woman",  "Other cisgender man", "Another demographic"),
                                   c("Overall", "White cisgender man", "Latinx cisgender man", "Black cisgender man", "Transgender man", "Transgender woman","Non binary", "Cisgender woman",  "Other cisgender man", "Another demographic")
                                   ))
}