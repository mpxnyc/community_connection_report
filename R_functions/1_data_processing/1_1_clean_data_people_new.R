clean_data_people_new <- function(raw_data_participants, config_list) {
  
  #order matters
  
  raw_data_participants |>
    calculate_cut_variables_date(config_list) |>
    calculate_cut_variables_numeric(config_list) |>
    calculate_demo_group_variable() |>
    calculate_hivPrepStat() |>
    calculate_overall_variable() |>
    calculate_spatial_variables_people() |>
    calculate_categorical_variables(config_list)
}
  
  



