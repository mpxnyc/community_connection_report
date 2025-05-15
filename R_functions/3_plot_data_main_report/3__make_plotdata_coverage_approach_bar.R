make_plotdata_coverage_approach_bar <- function(){
  make_plotdata_coverage_approach_choro() |>
    dplyr::filter(group != "Group C") 
}