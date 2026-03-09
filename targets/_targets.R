

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
                    name        = plotdata_age,
                    command     = make_table_freq1(
                                                  age, person_analysis = TRUE,
                                                  data_bipartite_graph_collected = data_bipartite_graph_collected,
                                                  data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                                  )
                    ),  
  targets::tar_target(
                    name        = plotdata_censustract_home,
                    command     = make_table_freq1(
                                                  censusTractHome, person_analysis = TRUE,
                                                  data_bipartite_graph_collected = data_bipartite_graph_collected,
                                                  data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                                )
                    ),   
  targets::tar_target(
                  name        = plotdata_channel,
                  command     = make_table_freq1(
                                                channel, person_analysis = TRUE,
                                                data_bipartite_graph_collected = data_bipartite_graph_collected,
                                                data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                              )
  ),
  targets::tar_target(
                  name        = plotdata_countfriends,
                  command     = make_table_freq1(
                                                countFriendsCut, person_analysis = TRUE,
                                                data_bipartite_graph_collected = data_bipartite_graph_collected,
                                                data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                              )
  ),  
  targets::tar_target(
                  name        = plotdata_countphysical,
                  command     = make_table_freq1(
                                                countPhysicalCut, person_analysis = TRUE,
                                                data_bipartite_graph_collected = data_bipartite_graph_collected,
                                                data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                              )
  ),   
  targets::tar_target(
                  name        = plotdata_countsex,
                  command     = make_table_freq1(
                                                countSex, person_analysis = TRUE,
                                                data_bipartite_graph_collected = data_bipartite_graph_collected,
                                                data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                              )
  ),   
  targets::tar_target(
                name        = plotdata_covidtestpositive,
                command     = make_table_freq1(
                                              covidTestPositive, person_analysis = TRUE,
                                              data_bipartite_graph_collected = data_bipartite_graph_collected,
                                              data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                            )
  ),  
  targets::tar_target(
              name        = plotdata_genderid,
              command     = make_table_freq1(
                                              genderId, person_analysis = TRUE,
                                              data_bipartite_graph_collected = data_bipartite_graph_collected,
                                              data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                            )
  ), 
  targets::tar_target(
              name        = plotdata_groupsex,
              command     = make_table_freq1(
                                              groupSex, person_analysis = TRUE,
                                              data_bipartite_graph_collected = data_bipartite_graph_collected,
                                              data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                            )
  ), 
  targets::tar_target(
            name        = plotdata_hivprep,
            command     = make_table_freq1(
                                              hivPrep, person_analysis = TRUE,
                                              data_bipartite_graph_collected = data_bipartite_graph_collected,
                                              data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                            )
  ),   
  targets::tar_target(
            name        = plotdata_hivstatus,
            command     = make_table_freq1(
                                            hivStatus, person_analysis = TRUE,
                                            data_bipartite_graph_collected = data_bipartite_graph_collected,
                                            data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                          )
  ),   
  targets::tar_target(
            name        = plotdata_hivsuppressed,
            command     = make_table_freq1(
                                            hivSuppressed, person_analysis = TRUE,
                                            data_bipartite_graph_collected = data_bipartite_graph_collected,
                                            data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                          )
  ),  
  targets::tar_target(
            name        = plotdata_mpoxcare,
            command     = make_table_freq1(
                                            monkeypoxCare, person_analysis = TRUE,
                                            data_bipartite_graph_collected = data_bipartite_graph_collected,
                                            data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                          )
  ),    
  targets::tar_target(
            name        = plotdata_mpoxtest,
            command     = make_table_freq1(
                                            monkeypoxTest, person_analysis = TRUE,
                                            data_bipartite_graph_collected = data_bipartite_graph_collected,
                                            data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                          )
  ),
  targets::tar_target(
            name        = plotdata_mpoxvax,
            command     = make_table_freq1(
                                            monkeypoxVaccine, person_analysis = TRUE,
                                            data_bipartite_graph_collected = data_bipartite_graph_collected,
                                            data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                          )
  ),  
  targets::tar_target(
            name        = plotdata_stisymptoms,
            command     = make_table_freq1(
                                            num_symptomsCut, person_analysis = TRUE,
                                            data_bipartite_graph_collected = data_bipartite_graph_collected,
                                            data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                          )
  ),  
  targets::tar_target(
            name        = plotdata_race,
            command     = make_table_freq1(
                                            race, person_analysis = TRUE,
                                            data_bipartite_graph_collected = data_bipartite_graph_collected,
                                            data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                          )
  ),
  targets::tar_target(
            name        = plotdata_sexorientation,
            command     = make_table_freq1(
                                            sexOrientation, person_analysis = TRUE,
                                            data_bipartite_graph_collected = data_bipartite_graph_collected,
                                            data_bipartite_graph_simulated = data_bipartite_graph_simulated
                                          )
  ), 
  targets::tar_target(
            name        = plotdata_traveltime,
            command     = make_table_freq1(
                                          travelTimeCut, person_analysis = TRUE,
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
                    name        = plotdata_age_racegender,
                    command     = make_plotdata_racegender_radar_grid(age, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                  ),
  targets::tar_target(
                    name        = plotdata_censustract_home_racegender,
                    command     = make_plotdata_racegender_radar_grid(censusTractHome, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                  ),
  targets::tar_target(
                      name        = plotdata_channel_racegender,
                      command     = make_plotdata_racegender_radar_grid(channel, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                    ),
  targets::tar_target(
                      name        = plotdata_countfriends_racegender,
                      command     = make_plotdata_racegender_radar_grid(countFriends, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                    ),
  targets::tar_target(
                      name        = plotdata_countphysical_racegender,
                      command     = make_plotdata_racegender_radar_grid(countPhysical, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                    ),
  targets::tar_target(
                      name        = plotdata_countsex_racegender,
                      command     = make_plotdata_racegender_radar_grid(countSex, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                    ),
  targets::tar_target(
                      name        = plotdata_covidtestpositive_racegender,
                      command     = make_plotdata_racegender_radar_grid(covidTestPositive, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                    ),
  targets::tar_target(
                      name        = plotdata_groupsex_racegender,
                      command     = make_plotdata_racegender_radar_grid(groupSex, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                    ),
  targets::tar_target(
                      name        = plotdata_hivprep_racegender,
                      command     = make_plotdata_racegender_radar_grid(hivPrep,data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                    ), 
  targets::tar_target(
                      name        = plotdata_hivstatus_racegender,
                      command     = make_plotdata_racegender_radar_grid(hivStatus,data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                    ),   
  targets::tar_target(
                      name        = plotdata_hivsuppressed_racegender,
                      command     = make_plotdata_racegender_radar_grid(hivSuppressed,data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                    ),   
  targets::tar_target(
                        name        = plotdata_mpoxcare_racegender,
                        command     = make_plotdata_racegender_radar_grid(monkeypoxCare,data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                      ), 
  targets::tar_target(
                        name        = plotdata_mpoxtest_racegender,
                        command     = make_plotdata_racegender_radar_grid(monkeypoxTest,data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                      ), 
  targets::tar_target(
                        name        = plotdata_mpoxvax_racegender,
                        command     = make_plotdata_racegender_radar_grid(monkeypoxVaccine,data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                      ), 
  targets::tar_target(
                        name        = plotdata_stisymptoms_racegender,
                        command     = make_plotdata_racegender_radar_grid(num_symptomsCut,data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                      ),                    
  targets::tar_target(
                      name        = plotdata_sexorientation_racegender,
                      command     = make_plotdata_racegender_radar_grid(sexOrientation, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                    ), 
  targets::tar_target(
                      name        = plotdata_traveltime_racegender,
                      command     = make_plotdata_racegender_radar_grid(travelTime, data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
                    ),
  
  targets::tar_target(
                      name        = plotdata_sexorientation_by_racegender_radar_grid,
                      command     = make_plotdata_racegender_radar_grid(sexOrientation,data_bipartite_graph_collected = data_bipartite_graph_collected, data_bipartite_graph_simulated = data_bipartite_graph_simulated )
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
            name        = plotdata_placetype_distancefromhome_placeSex,
            command     = make_table_freq3(placeType, distanceFromHome, placeSex, person_analysis = FALSE,
                                           data_bipartite_graph_collected = data_bipartite_graph_collected,
                                           data_bipartite_graph_simulated = data_bipartite_graph_simulated
            )
          ),
  targets::tar_target(
    name        = plotdata_placetype,
    command     = make_table_freq1(placeType, person_analysis = FALSE,
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
          ),
  targets::tar_target(
            name        = plotdata_coverage_approach_choro,
            command     = make_plotdata_coverage_approach_choro(
            data_intervention_results_coverage_simulated_place_coverage = data_intervention_results_coverage_simulated[["place_coverage"]],
            data_intervention_results_coverage_collected_place_coverage = data_intervention_results_coverage_collected[["place_coverage"]]
            )
          ),
  targets::tar_target(
            name        = plotdata_coverage_approach_bar,
            command     = make_plotdata_coverage_approach_bar(
                data_intervention_results_coverage_simulated_place_coverage = data_intervention_results_coverage_simulated[["place_coverage"]],
                data_intervention_results_coverage_collected_place_coverage = data_intervention_results_coverage_collected[["place_coverage"]]
            )
          ),
  targets::tar_target(
            name        = plotdata_net_impact_profile,
            command     = make_plotdata_net_impact_profile(data_intervention_results_centrality_collected)
          ),
  targets::tar_target(
            name        = plotdata_placetype_bar_grid,
            command     = make_plotdata_placetype_bar_grid(
              data_bipartite_graph_collected = data_bipartite_graph_collected,
              data_bipartite_graph_simulated = data_bipartite_graph_simulated
            )
          ),
  targets::tar_target(
    name        = plotdata_place_census_age,
    command     = make_edge_census_data(
      stratum_variable = age, 
      bipartite_graph = data_bipartite_graph_collected, 
      spatial_unit_label = place_community
    )
  ),
  targets::tar_target(
    name        = plotdata_place_census_sexorientation,
    command     = make_edge_census_data(
      stratum_variable = sexOrientation, 
      bipartite_graph = data_bipartite_graph_collected, 
      spatial_unit_label = place_community
    )
  ),
  targets::tar_target(
    name        = plotdata_place_census_racegender,
    command     = make_edge_census_data(
      stratum_variable = demo_group, 
      bipartite_graph = data_bipartite_graph_collected, 
      spatial_unit_label = place_community
    )
  )
  
  
  
  
)





