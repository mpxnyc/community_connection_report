# See targets package documentation

# This code runs from the root folder

# Load packages required to define the pipeline:
library(targets)

# Set target options:
#tar_option_set(
#  packages = c("tidyverse", "data.table", "dtplyr", "tidygraph", "igraph", "mpxnyc") # packages that your targets need to run
#)


# Run the R scripts in the R/ folder with your custom functions:


suppressMessages({
  targets::tar_source(files = "R_functions")

})


this_directory <- here::here()


list( 
  tar_target(
    name = config_list,
    command = load_config_list()
  ),
  tar_target(
    name = mpxnyc_images,
    command = load_images()
  ),
  tar_target(
    name = mpxnyc_emojis,
    command = load_emojis()
  ),
  tar_target(
    name = mpxnyc_colors,
    command = load_colors()
  ),
  tar_target(
  name = initial_settings,
  command = load_initial_settings()
),
tar_target(
  name = factor_levels,
  command = load_factor_levels()
),
tar_target(
  name = factor_labels,
  command = load_factor_labels()
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
    command = clean_data_people(data_people_raw, config_list)
  ),
  tar_target(
    name = data_places_clean,
    command = clean_data_places(data_places_raw, config_list)
  ),
  tar_target(
    name = data_bipartite_graph_collected,
    command = create_data_bipartite_graph_collected(data_places_clean, data_people_clean, config_list)
  ),  
  tar_target(
    name = data_bipartite_graph_simulated,
    command = create_data_bipartite_graph_simulated(data_bipartite_graph_collected, initial_settings)
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
  )
)



