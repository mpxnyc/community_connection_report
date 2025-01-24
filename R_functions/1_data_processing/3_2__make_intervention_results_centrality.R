make_intervention_results_centrality <- function(bipartite_graph_sim, intervention_coverage_data_sim){
  
  list_results      <- list()
  
  list_results[[1]] <- get_centrality_results(bipartite_graph_sim, intervention_coverage_data_sim, intervention_priority_input = "contact", intervention_stratification_input = "overall")
  list_results[[2]] <- get_centrality_results(bipartite_graph_sim, intervention_coverage_data_sim, intervention_priority_input = "contact", intervention_stratification_input = "demo_group")
  list_results[[3]] <- get_centrality_results(bipartite_graph_sim, intervention_coverage_data_sim, intervention_priority_input = "movement", intervention_stratification_input = "overall")
  list_results[[4]] <- get_centrality_results(bipartite_graph_sim, intervention_coverage_data_sim, intervention_priority_input = "movement", intervention_stratification_input = "demo_group")
  
  
  list_results |>
    dplyr::bind_rows()
  
}