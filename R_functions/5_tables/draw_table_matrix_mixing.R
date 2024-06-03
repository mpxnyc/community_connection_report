draw_table_matrix_mixing <- function(table){
  table %>%
    knitr::kable() %>%
    kableExtra::kable_classic()
}
