make_plotdata_placetype_bar_grid <- function(
    data_bipartite_graph_collected = targets::tar_read(data_bipartite_graph_collected),
    data_bipartite_graph_simulated = targets::tar_read(data_bipartite_graph_simulated)
    ){
  make_table_freq3(placeType, distanceFromHome, placeSex, person_analysis = FALSE,
                   data_bipartite_graph_collected = data_bipartite_graph_collected,
                   data_bipartite_graph_simulated = data_bipartite_graph_simulated
                   ) |>
    dplyr::mutate(proportion = ifelse(stratum_b == "Did not have sex", -proportion, proportion)) |>
    dplyr::mutate(y_placement = ifelse(proportion> 0 , proportion + 0.1, proportion - 0.08)) |>
    dplyr::filter(!is.na(level))
}