make_plotdata_racegender_radar_grid <- function(
                                                  variable = sexOrientation, 
                                                  data_bipartite_graph_collected = targets::tar_read(data_bipartite_graph_collected), 
                                                  data_bipartite_graph_simulated = targets::tar_read(data_bipartite_graph_simulated)
                                                  ){
  
  
  make_plotdata_stratified_radar_grid(
                                      variable = {{variable}}, 
                                      data_bipartite_graph_collected = {{data_bipartite_graph_collected}}, 
                                      data_bipartite_graph_simulated = {{data_bipartite_graph_simulated}},
                                      stratifying_variable = demo_group
                                    ) 
}