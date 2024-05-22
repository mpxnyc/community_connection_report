make_person_data_by_groupSex <- function(bipartite_graph_sim) {
  
      make_table_1_datatable(
                            bipartite_graph_sim, 
                            by = groupSex, 
                            variables = c(
                                          "age",
                                          "genderId", 
                                          "race", 
                                          "sexOrientation", 
                                          "hivStatus", 
                                          "borough", 
                                          "countFriends",
                                          "countSex",
                                          "monkeypoxVaccine",
                                          "hivPrep",
                                          "demo_group"
                                          ),
                            person_data = TRUE)
}