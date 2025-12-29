make_plotdata_recruitment <- function(){
targets::tar_read(data_people_clean) |> 
  dplyr::arrange(createdAt) |>
  dplyr::group_by(createdAt) |>
  dplyr::summarize(count = dplyr::n()) |>
  dplyr::mutate(labelled = count > 190) |>
  dplyr::mutate(createdAtLabel = format(createdAt, format = "%d %b %Y"))
}