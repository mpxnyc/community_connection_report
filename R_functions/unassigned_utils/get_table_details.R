
get_table_details <- function(tbl_name = "tbl-gendermodality"){
  targets::tar_read(config_list)[[1]][["tablecaptions"]][[tbl_name]]
}