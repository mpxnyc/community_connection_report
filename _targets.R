# See targets package documentation

# Load packages required to define the pipeline:
library(targets)

# Set target options:
tar_option_set(
  packages = c("tidyverse", "data.table", "dtplyr", "tidygraph", "igraph", "mpxnyc") # packages that your targets need to run
)


# Run the R scripts in the R/ folder with your custom functions:
tar_source(files = "/Users/keletso/Documents/_gitrepos/mpxnyc_data_analysis/R_functions")
tar_source(files = "/Users/keletso/Documents/_gitrepos/mpxnyc_data_analysis/R_functions/1_data_processing")
tar_source(files = "/Users/keletso/Documents/_gitrepos/mpxnyc_data_analysis/R_functions/2_data_summary")
tar_source(files = "/Users/keletso/Documents/_gitrepos/mpxnyc_data_analysis/R_functions/3_data_extract")
tar_source(files = "/Users/keletso/Documents/_gitrepos/mpxnyc_data_analysis/R_functions/4_plot")


list(    
  tar_target(
  name = initial_settings,
  command = load_initial_settings()
),
  tar_target(
    name = data_people_raw,
    command = readRDS("/Users/keletso/Documents/_data/mpxnyc/mpxnyc_person_data.R")
  ),
  tar_target(
    name = data_places_raw,
    command = readRDS("/Users/keletso/Documents/_data/mpxnyc/mpxnyc_place_data.R")
  ),
  tar_target(
    name = data_people_clean,
    command = clean_data_people(data_people_raw)
  ),
  tar_target(
    name = data_places_clean,
    command = clean_data_places(data_places_raw)
  ),
  tar_target(
    name = data_bipartite_graph_collected,
    command = create_data_bipartite_graph_collected(data_places_clean, data_people_clean, analytic_scale = initial_settings[["analytic_scale"]])
  ),  
  tar_target(
    name = data_bipartite_graph_simulated,
    command = create_data_bipartite_graph_simulated(data_bipartite_graph_collected, n_reps = initial_settings[["n_reps_graph"]])
  ),
  tar_target(
    name = data_intervention_results_coverage_collected,
    command = make_intervention_results_coverage(data_bipartite_graph_collected)
  ),
  tar_target(
    name = data_intervention_results_coverage_simulated,
    command = make_intervention_results_coverage(data_bipartite_graph_simulated)
  ),
  tar_target(
    name = data_intervention_results_centrality_collected,
    command = make_intervention_results_centrality(data_bipartite_graph_collected, data_intervention_results_coverage_collected)
  ),
  tar_target(
    name = data_intervention_results_centrality_simulated,
    command = make_intervention_results_centrality(data_bipartite_graph_simulated, data_intervention_results_coverage_simulated)
  )
)



