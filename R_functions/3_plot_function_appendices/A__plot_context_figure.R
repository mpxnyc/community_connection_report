plot_context_figure <- function(){
  contextless <- example_context_graph_base("Contextless") |>
    example_context_graph_outline() |>
    example_context_graph_nodes()
  
  social_context <- example_context_graph_base("Social context") |>
    example_context_graph_outline() |>
    example_context_graph_edges() |>
    example_context_graph_nodes()
  
  
  ecological_context <- example_context_graph_base("Ecological context") |>
    example_context_graph_outline() |>
    example_context_graph_inner_division() |>
    example_context_graph_nodes()
  
  spatial_context <- example_context_graph_base("Spatial context") |>
    example_context_graph_outline() |>
    example_context_graph_inner_division() |>
    example_context_graph_inner_gates() |>
    example_context_graph_nodes()
  
  ssnac_context  <- example_context_graph_base("SSNAC") |>
    example_context_graph_outline() |>
    example_context_graph_inner_division() |>
    example_context_graph_inner_gates() |>
    example_context_graph_edges() |>
    example_context_graph_nodes()
  
  
  cowplot::plot_grid(contextless, social_context, ecological_context, spatial_context, ssnac_context)  +
    theme_mpxnyc_blank()
}