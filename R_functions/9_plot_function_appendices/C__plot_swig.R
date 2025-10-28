plot_swig <- function(data, arrow_length_head = 0.2, arrow_length_tail = 0.05, edge_width = 0.2, node_radius = 0.5, node_margin = 0.4, nudge_intervention_labels = 0.1, size = 5){
  
  variable_names <- data |>
    tidygraph::activate(edges) |>
    data.frame() |>
    names() 
  
  analysis_data <- data 
  edge_label_exists <-"edge_label" %in% variable_names
  
  
  if (!edge_label_exists) {
    analysis_data <- data |>
      tidygraph::activate(edges) |>
      tidygraph::mutate(edge_label = "") |>
      tidygraph::activate(nodes)
  } else {
    analysis_data  <- data
  }
  
  
  
  node_characteristics <- analysis_data |>
    data.frame() 
  
  ggraph::create_layout(analysis_data, data.frame(analysis_data)) |>
    ggraph::ggraph(analysis_data) +
    ggraph::geom_edge_link(
      mapping     = ggplot2::aes(
        label     = latex2exp::TeX(edge_label, output = "character")
      ), 
      arrow       = grid::arrow(
        angle       = 15, 
        length      = ggplot2::unit(arrow_length_head, "inches"), 
        ends        = "last", 
        type        = "closed"
      ), 
      end_cap     = ggraph::circle(node_margin, 'inches'), 
      start_cap   = ggraph::circle(node_margin, 'inches'),
      edge_width  = edge_width,
      label_size  = 8,
      edge_alpha       = 0.3
    ) +
    ggforce::geom_arc_bar(
      mapping     = ggplot2::aes(x0 = x, y0 = y, r = node_radius + 0.05, fill = node_type, start = 0, end = 1*pi, r0 = 0), 
      data        = node_characteristics |> dplyr::filter(node_shape == "intervention"), 
      position    = ggplot2::position_nudge(x = 0.25 * nudge_intervention_labels),
      linewidth = 0
    ) +
    ggforce::geom_arc_bar(
      mapping     = ggplot2::aes(x0 = x, y0 = y, r = node_radius + 0.05, fill = node_type, start = pi, end = 2*pi, r0 = 0), 
      data        = node_characteristics |> dplyr::filter(node_shape == "preintervention"), 
      position    = ggplot2::position_nudge(x = - 0.25 * nudge_intervention_labels),
      linewidth = 0
    ) +
    ggforce::geom_circle(
      mapping     = ggplot2::aes(x0 = x, y0 = y, r = node_radius + 0.05, fill = node_type), data = node_characteristics |> dplyr::filter(node_shape == "covariate"), linewidth = 0
    ) +
    ggraph::geom_node_text(
      mapping     = ggplot2::aes(label = label, color = node_type),
      size        = size,
      parse       = TRUE,
      data        = node_characteristics |> dplyr::filter(node_shape == "preintervention"),
      nudge_x     = -nudge_intervention_labels,
      fontface = "bold"
    ) +
    ggraph::geom_node_text(
      mapping     = ggplot2::aes(label = label, color = node_type),
      size        = size,
      parse       = TRUE,
      data        = node_characteristics |> dplyr::filter(node_shape == "intervention"),
      nudge_x     = nudge_intervention_labels,
      fontface = "bold"
    ) +
    ggraph::geom_node_text(
      mapping     = ggplot2::aes(label = label, color = node_type),
      size        = size,
      parse       = TRUE,
      data        = node_characteristics |> dplyr::filter(node_shape == "covariate"),
      fontface = "bold"
    ) +
    ggplot2::coord_fixed()
}