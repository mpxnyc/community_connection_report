make_plotdata_placetype_bar_grid <- function(){
  make_table_freq3(placeType, distanceFromHome, placeSex, person_analysis = FALSE) |>
    dplyr::mutate(proportion = ifelse(stratum_b == "Did not have sex", -proportion, proportion)) |>
    dplyr::mutate(y_placement = ifelse(proportion> 0 , proportion + 0.1, proportion - 0.08)) |>
    dplyr::filter(!is.na(level))
}