

suppressMessages({
  targets::tar_source(files = "R_functions")

})



list( 
  targets::tar_target(
                        name      = config_json_filepath,
                        command   = "_config.json",
                        format    = "file"
                      ),
  targets::tar_target(
                        name      = config_list,
                        command   = tidyjson::read_json(config_json_filepath)[["..JSON"]]
                      ),
  targets::tar_target(
                        name      = data_people_raw,
                        command   = readRDS(config_list[[1]][["settings"]][["person_data_file_path"]])
                      ),
  targets::tar_target(
                        name      = data_places_raw,
                        command   = readRDS(config_list[[1]][["settings"]][["place_data_file_path"]])
                      ),
  targets::tar_target(
                        name      = data_people_clean,
                        command   = clean_data_people(data_people_raw, config_list)
                      ),
  targets::tar_target(
                        name      = data_places_clean,
                        command   = clean_data_places(data_places_raw, config_list)
                      ),
  
  targets::tar_target(
                        name      = data_bipartite_graph_collected,
                        command   = create_data_bipartite_graph_collected(data_places_clean, data_people_clean, config_list)
                      ),  
  
  targets::tar_target(
                        name      = data_bipartite_graph_simulated,
                        command   = create_data_bipartite_graph_simulated(data_bipartite_graph_collected, config_list)
                      ),
 
   targets::tar_target(
                        name      = data_intervention_results_coverage_collected,
                        command   = make_intervention_results_coverage(data_bipartite_graph_collected)
                      ),
  
  targets::tar_target(
                        name      = data_intervention_results_coverage_simulated,
                        command   = make_intervention_results_coverage(data_bipartite_graph_simulated)
                      ),
  
  targets::tar_target(
                      name        = data_intervention_results_centrality_collected,
                      command     = make_intervention_results_centrality(data_bipartite_graph_collected, data_intervention_results_coverage_collected)
                    )
)



