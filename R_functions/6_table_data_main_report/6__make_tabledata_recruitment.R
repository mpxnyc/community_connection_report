make_table_data_recruitment <- function(){
  targets::tar_read(data_bipartite_graph_collected) |>
  tidygraph::activate(nodes)|>
  data.frame() |>
  dplyr::filter(type) |>
  dplyr::select(
  "borough" , "channel", "groupSex", "createdAtCut"
  )
}