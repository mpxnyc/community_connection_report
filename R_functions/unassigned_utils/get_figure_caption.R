
get_figure_details <- function(fig_name = "fig-options"){
  targets::tar_read(config_list)[[1]][["figurecaptions"]][[fig_name]]
}