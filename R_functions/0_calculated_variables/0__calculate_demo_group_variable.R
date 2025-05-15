calculate_demo_group_variable <- function(person_data){
  
  levels <- c(
              "white-cisgender-man", 
              "latinx-cisgender-man", 
              "black-cisgender-man",
              "transgender-man",
              "transgender-woman",
              "non-binary",
              "cisgender-woman",
              "other-cisgender-man",
              "cisgender-woman",
              "other",
              "missing"
              )
  
  labels <- c(
              "White cisgender man", 
              "Latinx cisgender man", 
              "Black cisgender man",
              "Transgender man",
              "Transgender woman",
              "Non binary",
              "Cisgender woman",
              "Other cisgender man",
              "Cisgender woman",
              "Another demographic",
              "Another demographic"
            )
  
  result <- person_data |> 
                dplyr::mutate(
                  demo_group       = as.character(genderId),
                  demo_group       = ifelse(
                    race %in% c("Black", "White", "Latinx") & genderId == "cisgender-man", 
                    paste(stringr::str_to_lower(race) , demo_group, sep = "-"), 
                    demo_group
                  ),
                  demo_group       = ifelse(
                    !(race %in% c("Black", "White", "Latinx")) & genderId == "cisgender-man", 
                    paste("other", demo_group, sep = "-"), 
                    demo_group
                  ),
                  demo_group       = factor(demo_group, levels, labels)
                  )
  
  
  result$demo_group <- result$demo_group |> labelled::set_variable_labels("Race-gender")
  
  result
}