clean_data_places <- function(raw_data_places, config_list){
  raw_data_places |>
    calculate_intervention_setting() |>
    calculate_spatial_variables_places() |>
    calculate_categorical_variables(config_list)
}


