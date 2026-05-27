make_plotdata_stratified_radar_grid <- function(
    variable = sexOrientation, 
    data_bipartite_graph_collected = targets::tar_read(data_bipartite_graph_collected), 
    data_bipartite_graph_simulated = targets::tar_read(data_bipartite_graph_simulated),
    stratifying_variable ,
    person_analysis = TRUE
){
  
  
  stratified <- make_table_freq2({{variable}}, {{stratifying_variable}}, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated, person_analysis = person_analysis)
  
  overall <- make_table_freq2({{variable}}, overall, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated, person_analysis = person_analysis)
  
  new_labels <- c("Overall", levels(stratified$stratum))
  new_levels <- c("overall", levels(stratified$stratum))
  
  stratified |> 
    dplyr::mutate(stratum = as.character(stratum)) |>
    rbind(overall |> dplyr::mutate(stratum = as.character(stratum))) |>
    dplyr::mutate(stratum = factor(stratum, new_levels, new_labels))
}