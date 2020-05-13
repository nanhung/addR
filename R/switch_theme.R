#' Toggle RStudio Server Theme between Dark and Light
#'
#' @description This RStudio Addin switches between Dark and Light (Sourced from https://github.com/hebrewseniorlife/addin_demo/)
#' @importFrom rstudioapi getThemeInfo applyTheme
#' @export
switch_theme <- function() {
  current_theme <- rstudioapi::getThemeInfo()
  next_theme <- ifelse(current_theme$dark, "Tomorrow", "Tomorrow Night Blue")
  rstudioapi::applyTheme(next_theme)
}
