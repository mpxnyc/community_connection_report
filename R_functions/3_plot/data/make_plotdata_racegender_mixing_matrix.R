make_plotdata_racegender_mixing_matrix <- function(){
  make_table_mixing_2(demo_group)  |>
    dplyr::filter(ego_level != "Another demographic") |>
    dplyr::filter(alter_level != "Another demographic") 
}