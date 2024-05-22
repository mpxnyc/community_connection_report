

make_person_data_by_demo_group <- function(bipartite_graph_sim){

  make_table_1_datatable(
                                      bipartite_graph_sim, 
                                      by = demo_group, 
                                      variables = c(
                                                    "age", 
                                                    "sexOrientation", 
                                                    "monkeypoxVaccine", 
                                                    "hivPrep"
                                      ))
  
}
