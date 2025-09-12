plot_reach_diagram <- function(
    reach_diagram_data,
    base_color = grey(0.9,1), 
    reached_color = "#009BE8", 
    intermediate_color = "#C5EFFF",
    focal_color = "black"
    ){
  
  reach_diagram_data |>
  ggraph::ggraph(layout = "kk") +
  ggraph::geom_edge_fan(ggplot2::aes(color = type_color), show.legend = FALSE) +
  ggraph::geom_node_point(ggplot2::aes( size = type), color = base_color) +
  ggraph::geom_node_point(ggplot2::aes(color = type_color, size = type)) +
  ggraph::geom_node_text(ggplot2::aes(label = label, size = type, filter = !is.na(type_color)), color = "white", show.legend = FALSE) +
  ggplot2::scale_size_manual(name = "Size", values = c(7,12)) +
scale_color_mpxnyc(name = "Color", option = "manual", na.value = base_color, values = c("Focal node" = focal_color, "Reached nodes" = reached_color, "Intermediate nodes" = intermediate_color), na.translate = FALSE) +
  ggraph::scale_edge_color_manual(values = c("black"), na.value = base_color)
}