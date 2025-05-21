

draw_table_3 <- function(data, label){
  
  data |>
    gt::gt(groupname_col = c("stratum_a", "stratum_b")) |>
    gt::tab_header(
      title = label,
      subtitle = "(MPX NYC, 2022)"
    ) |>
    gt::cols_label(
      group = "",
      count = "N",
      percentage = "% (CI)"
    ) |>
    gt::cols_align(
      align = c( "left"),
      columns = group
    ) |>
    gt::cols_align(
      align = c( "center"),
      columns = c(count, percentage)
    ) |>
    gt::tab_options(
      table.font.size = 11
    )
}

