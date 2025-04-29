make_example_network_data <- function(type = "bipartite"){
  
  example_nodes <- data.frame(
    name = c(
      paste0("Person ", c(1:8)), 
      paste0("Community ", c("a", "b", "c", "d", "e"))
    ),
    type = c(rep(TRUE, 8), rep(FALSE, 5)),
    label = c(c(1:8, "A", "B", "C", "D", "E")),
    age = c(rep("18-25", 4), rep("26-50", 4), rep("-", 5))
  )
  
  labelled::var_label(example_nodes$name)  <- "Name"
  labelled::var_label(example_nodes$type)  <- "Type"
  labelled::var_label(example_nodes$label) <- "Label"
  labelled::var_label(example_nodes$age)   <- "Age"
  
  example_edges <- data.frame(
    from = c(
      "Person 1", 
      "Person 2", 
      "Person 3",
      "Person 3",
      "Person 4",
      "Person 4",
      "Person 5",
      "Person 4",
      "Person 6",
      "Person 3",
      "Person 4",
      "Person 6",
      "Person 7",
      "Person 8",
      "Person 3",
      "Person 6",
      "Person 8",
      "Person 2"
    ),
    to   = c(
      "Community a", 
      "Community a", 
      "Community a",
      "Community b",
      "Community b",
      "Community c",
      "Community c",
      "Community d",
      "Community d",
      "Community e",
      "Community e",
      "Community e",
      "Community c",
      "Community c",
      "Community e",
      "Community d",
      "Community d",
      "Community b"
    ),
    relation = c(
      "HOME",
      "GSEX",
      "PHYS",
      "HOME",
      "PHYS",
      "HOME",
      "HOME",
      "GSEX",
      "PHYS",
      "GSEX",
      "GSEX",
      "PHYS",
      "HOME",
      "GSEX",
      "PHYS",
      "HOME",
      "HOME",
      "HOME"
    ),
    weight = 1
    
  )
  
  labelled::var_label(example_edges$from)  <- "From"
  labelled::var_label(example_edges$to)  <- "To"
  labelled::var_label(example_edges$relation) <- "Relation"
  labelled::var_label(example_edges$weight) <- "Weight"

  
  result   <- tidygraph::tbl_graph(
    nodes = example_nodes, 
    edges = example_edges
  ) |>
    tidygraph::activate(edges) |>
    dplyr::mutate(weight_label = as.character(weight)) |>
    tidygraph::activate(nodes)
  
  if (type == "bipartite"){

  } else if (type == "places"){
    result <- result |>
      igraph::bipartite_projection(which = "false") |>
      tidygraph::as_tbl_graph() |>
      tidygraph::mutate(type = FALSE) |>
      tidygraph::activate(edges) |>
      tidygraph::mutate(weight_label = as.character(weight)) |>
      tidygraph::activate(nodes) 
    
  } else if (type == "people") {
    result       <- result |>
      igraph::bipartite_projection(which = "true") |>
      tidygraph::as_tbl_graph() |>
      tidygraph::mutate(type = TRUE) |>
      tidygraph::activate(edges) |>
      tidygraph::mutate(weight_label = as.character(weight)) |>
      tidygraph::activate(nodes)
  }
  
  

  
  
  
  
  result
  
  
}
