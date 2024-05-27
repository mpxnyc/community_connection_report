# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline



# Load packages required to define the pipeline:
library(targets)

# library(tarchetypes) # Load other packages as needed.

# Set target options:
tar_option_set(
  packages = c("tidyverse", "data.table", "dtplyr", "tidygraph", "igraph", "mpxnyc") # packages that your targets need to run
  # format = "qs", # Optionally set the default storage format. qs is fast.
  #
  # For distributed computing in tar_make(), supply a {crew} controller
  # as discussed at https://books.ropensci.org/targets/crew.html.
  # Choose a controller that suits your needs. For example, the following
  # sets a controller with 2 workers which will run as local R processes:
  #
  #   controller = crew::crew_controller_local(workers = 2)
  #
  # Alternatively, if you want workers to run on a high-performance computing
  # cluster, select a controller from the {crew.cluster} package. The following
  # example is a controller for Sun Grid Engine (SGE).
  # 
  #   controller = crew.cluster::crew_controller_sge(
  #     workers = 50,
  #     # Many clusters install R as an environment module, and you can load it
  #     # with the script_lines argument. To select a specific verison of R,
  #     # you may need to include a version string, e.g. "module load R/4.3.0".
  #     # Check with your system administrator if you are unsure.
  #     script_lines = "module load R"
  #   )
  #
  # Set other options as needed.
)

# tar_make_clustermq() is an older (pre-{crew}) way to do distributed computing
# in {targets}, and its configuration for your machine is below.
options(clustermq.scheduler = "multicore")

# tar_make_future() is an older (pre-{crew}) way to do distributed computing
# in {targets}, and its configuration for your machine is below.
# Install packages {{future}}, {{future.callr}}, and {{future.batchtools}} to allow use_targets() to configure tar_make_future() options.

# Run the R scripts in the R/ folder with your custom functions:
tar_source(files = "R_functions")
# source("other_functions.R") # Source other scripts as needed.

# Replace the target list below with your own:
list(    
  tar_target(
  name = initial_settings,
  command = load_initial_settings()
),
  tar_target(
    name = raw_data_participants,
    command = readRDS("/Users/keletso/Documents/_data/mpxnyc/mpxnyc_person_data.R")
  ),
  tar_target(
    name = raw_data_places,
    command = readRDS("/Users/keletso/Documents/_data/mpxnyc/mpxnyc_place_data.R")
  ),
  tar_target(
    name = participant_data,
    command = clean_participant_data(raw_data_participants)
  ),
  tar_target(
    name = places_data,
    command = clean_place_data(raw_data_places)
  ),
  tar_target(
    name = bipartite_graph,
    command = make_bipartite_graph(places_data, participant_data, analytic_scale = initial_settings[["analytic_scale"]])
  ),  
  tar_target(
    name = bipartite_graph_sim,
    command = make_simulated_bipartite_graph(bipartite_graph, n_reps = initial_settings[["n_reps_graph"]])
  ),
  tar_target(
    name = bipartite_graph_coverage,
    command = add_coverage_data_to_bipartite(bipartite_graph)
  ),
  tar_target(
    name = bipartite_graph_coverage_sim,
    command = add_coverage_data_to_bipartite(bipartite_graph_sim)
  ))
