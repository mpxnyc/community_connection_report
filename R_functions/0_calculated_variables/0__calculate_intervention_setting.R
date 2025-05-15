calculate_intervention_setting <- function(places_data){
  places_data |>
    dplyr::mutate(
      intervention_setting = ifelse(is.na(placeSex), "home", as.character(placeSex))
      )
}