load_questionnaire_text <- function(filepath){
  
  answers <- tidyjson::read_json(filepath) |>
    tidyjson::gather_object() |>
    tidyjson::enter_object(answers) |>
    tidyjson::gather_object() |>
    tidyjson::json_types() |>
    tidyjson::filter(type == "array") |>
    tidyjson::gather_array() |>
    tidyjson::append_values_string() |>
    dplyr::tibble() |>
    dplyr::transmute(variable = name, language = name.2, answer = string, index = array.index) |>
    dplyr::group_by(variable, language)  
  
  questions <- tidyjson::read_json(filepath) |>
    tidyjson::gather_object() |>
    tidyjson::enter_object(question)  |>
    tidyjson::gather_object() |>
    tidyjson::json_types() |>
    tidyjson::gather_array() |>
    tidyjson::append_values_string() |>
    dplyr::tibble() |>
    dplyr::transmute(variable = name, language= name.2, question = string) |>
    dplyr::group_by(variable, language) |>
    dplyr::summarize(question = paste(question, collapse = "\n\n")) |>
    dplyr::ungroup() |>
    dplyr::transmute(variable, language, answer = question, index = 0)
  
  
  
  data <- answers |>
    rbind(questions) |>
    dplyr::arrange(variable, language, index) |>
    dplyr::group_by(variable, language) |>
    dplyr::mutate(question = c(answer[1], rep("", length(answer) -1 )), answer = c("", answer[-1])) |>
    dplyr::select(variable, language, question, answer) |>
    dplyr::ungroup()
  
  data_english <- data |>
    dplyr::filter(language == "english") |>
    dplyr::select(-c(variable, language)) |>
    dplyr::rename(question_en = question, answer_en = answer)
  
  data_spanish <- data |>
    dplyr::filter(language == "spanish") |>
    dplyr::select(-c(language)) |>
    dplyr::rename(question_sp = question, answer_sp = answer)
  
data_english |>
    cbind(data_spanish) |>
    dplyr::filter(variable != "consent")
}


