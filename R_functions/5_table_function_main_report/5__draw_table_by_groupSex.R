draw_table_by_groupSex <- function(data){
  data |>
  gtsummary::tbl_summary(by = groupSex) |>
    gtsummary::add_overall(last = TRUE) |>
    gtsummary::modify_spanning_header(c("stat_1", "stat_2", "stat_0") ~ "**Physical or sexual contact in group setting in past 4 weeks**") |>
    gtsummary::add_p() |>
    gtsummary::modify_header(label ~ "**Variable**") |>
    gtsummary::bold_labels() |>
    gtsummary::as_gt() |>
    gt::tab_source_note(gt::md("*Data source: MPX NYC 2022*")) |>
    gt::tab_options(quarto.disable_processing = TRUE) |>
    gt::sub_values(columns = p.value, fn = function(x) x < .001, replacement = "<.001")
}