draw_table_bar <- function(table){
  table %>%
    knitr::kable() %>%
    kableExtra::kable_classic()
}
