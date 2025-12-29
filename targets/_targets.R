

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
                    ),
  targets::tar_target(
                      name        = plotdata_racegender_radar_grid,
                      command     = make_plotdata_racegender_radar_grid(data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                      ),
  targets::tar_target(
                    name        = plotdata_movement_matrix,
                    command     = make_plotdata_movement_matrix(data_bipartite_graph_collected = data_bipartite_graph_collected)
                    ),
  targets::tar_target(
                    name        = plotdata_spatial_concentration_bar,
                    command     = make_plotdata_spatial_concentration_bar(data_bipartite_graph_collected )
                  ),
  targets::tar_target(
                    name        = tabledata_gatherings,
                    command     = make_tabledata_gatherings(data_bipartite_graph_collected)
                  ),
  targets::tar_target(
                    name        = tabledata_places,
                    command     = make_tabledata_places(data_bipartite_graph_collected)
                  ),
  targets::tar_target(
                    name        = plotdata_racegender_mixing_matrix,
                    command     = make_table_mixing_2(demo_group, data_bipartite_graph_simulated)
                  ),
  targets::tar_target(
                    name        = plotdata_sexorientation_mixing_matrix,
                    command     = make_table_mixing_2(sexOrientation, data_bipartite_graph_simulated)
                  ),
  targets::tar_target(
                    name        = plotdata_age_mixing_matrix,
                    command     = make_table_mixing_2(age, data_bipartite_graph_simulated)
                  ),
  targets::tar_target(
                    name        = plotdata_age,
                    command     = make_table_freq1(age, person_analysis = TRUE,
                                                   data_bipartite_graph_collected = data_bipartite_graph_collected,
                                                   data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                                   )
                  ),
  targets::tar_target(
                  name        = plotdata_channel,
                  command     = make_table_freq1(channel, person_analysis = TRUE,
                                                 data_bipartite_graph_collected = data_bipartite_graph_collected,
                                                 data_bipartite_graph_simulated = data_bipartite_graph_simulated
                    )
                  ),
  targets::tar_target(
                    name        = plotdata_genderid,
                    command     = make_table_freq1(genderId, person_analysis = TRUE,
                                                   data_bipartite_graph_collected = data_bipartite_graph_collected,
                                                   data_bipartite_graph_simulated = data_bipartite_graph_simulated
                    )
                  ),
  targets::tar_target(
                    name        = plotdata_sexorientation,
                    command     = make_table_freq1(sexOrientation, person_analysis = TRUE,
                                                   data_bipartite_graph_collected = data_bipartite_graph_collected,
                                                   data_bipartite_graph_simulated = data_bipartite_graph_simulated
                    )
                  ),
  targets::tar_target(
                  name        = plotdata_groupsex,
                  command     = make_table_freq1(groupSex, person_analysis = TRUE,
                                                 data_bipartite_graph_collected = data_bipartite_graph_collected,
                                                 data_bipartite_graph_simulated = data_bipartite_graph_simulated
                  )
                ),
  targets::tar_target(
                name        = plotdata_race,
                command     = make_table_freq1(race, person_analysis = TRUE,
                                               data_bipartite_graph_collected = data_bipartite_graph_collected,
                                               data_bipartite_graph_simulated = data_bipartite_graph_simulated
                )
              ),
  targets::tar_target(
                name        = plotdata_racegender,
                command     = make_table_freq1(demo_group, person_analysis = TRUE,
                                               data_bipartite_graph_collected = data_bipartite_graph_collected,
                                               data_bipartite_graph_simulated = data_bipartite_graph_simulated
                )
              ),
  targets::tar_target(
                name        = plotdata_sexorientation_racegender,
                command     = make_table_freq2(sexOrientation, demo_group, person_analysis = TRUE,
                                               data_bipartite_graph_collected = data_bipartite_graph_collected,
                                               data_bipartite_graph_simulated = data_bipartite_graph_simulated
                )
              ),
  targets::tar_target(
                name        = plotdata_hivprep_racegender,
                command     = make_table_freq2(hivPrep, demo_group, person_analysis = TRUE,
                                               data_bipartite_graph_collected = data_bipartite_graph_collected,
                                               data_bipartite_graph_simulated = data_bipartite_graph_simulated
                )
              ),
  targets::tar_target(
              name        = plotdata_mpoxvax_racegender,
              command     = make_table_freq2(monkeypoxVaccine, demo_group, person_analysis = TRUE,
                                             data_bipartite_graph_collected = data_bipartite_graph_collected,
                                             data_bipartite_graph_simulated = data_bipartite_graph_simulated
              )
            ),
  targets::tar_target(
            name        = plotdata_placetype_distancefromhome_placeSex,
            command     = make_table_freq3(placeType, distanceFromHome, placeSex, person_analysis = FALSE,
                                           data_bipartite_graph_collected = data_bipartite_graph_collected,
                                           data_bipartite_graph_simulated = data_bipartite_graph_simulated
            )
          ),
  targets::tar_target(
            name        = plotdata_placetype_distancefromhome,
            command     = make_table_freq2(placeType, distanceFromHome, person_analysis = FALSE,
                                           data_bipartite_graph_collected = data_bipartite_graph_collected,
                                           data_bipartite_graph_simulated = data_bipartite_graph_simulated
            )
          ),
  targets::tar_target(
            name        = plotdata_placetype_placesex,
            command     = make_table_freq2(placeType, placeSex, person_analysis = FALSE,
                                           data_bipartite_graph_collected = data_bipartite_graph_collected,
                                           data_bipartite_graph_simulated = data_bipartite_graph_simulated
            )
          )
  
  
  
)





