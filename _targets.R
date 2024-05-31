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
tar_source(files = "R_functions/1_data_processing")
tar_source(files = "R_functions/2_data_summary")
tar_source(files = "R_functions/3_data_extract")
tar_source(files = "R_functions/4_plot")
# source("other_functions.R") # Source other scripts as needed.

# Replace the target list below with your own:
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
    command = create_bipartite_graph_collected(data_places_clean, data_people_clean, analytic_scale = initial_settings[["analytic_scale"]])
  ),  
  tar_target(
    name = data_bipartite_graph_simulated,
    command = create_bipartite_graph_simulated(data_bipartite_graph_collected, n_reps = initial_settings[["n_reps_graph"]])
  ),
  tar_target(
    name = data_intervention_results_coverage_collected,
    command = conduct_all_campaigns(data_bipartite_graph_collected, data_bipartite_graph_collected)
  ),
tar_target(
  name = data_intervention_results_coverage_simulated,
  command = conduct_all_campaigns(data_bipartite_graph_simulated, data_bipartite_graph_collected)
),
tar_target(
  name = graph_evolution_data,
  command = get_graph_evolution(data_bipartite_graph_collected, data_intervention_results_coverage_collected)
),
tar_target(
  name = graph_evolution_data_sim,
  command = get_graph_evolution(data_bipartite_graph_simulated, data_intervention_results_coverage_simulated)
)
)



