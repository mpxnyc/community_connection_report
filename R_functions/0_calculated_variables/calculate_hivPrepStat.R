calculate_hivPrepStat <- function(person_data){
  
  levels <- c("yes", "no", "living-with-hiv")
  labels <- c("Yes", "No", "Living with HIV")
  
  result <- person_data |>
                dplyr::mutate(
                  hivPrepStat      = ifelse(is.na(hivPrep), "living-with-hiv", as.character(hivPrep))
                ) |>
                dplyr::mutate(
                  hivPrepStat = factor(hivPrepStat, levels, labels)
                )
  
  result$hivPrepStat <- result$hivPrepStat |> labelled::set_variable_labels("HIV/PrEP status")
  
  result
  
}