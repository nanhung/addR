#' Toggle the file extension
#'
#' @description Switches that add or remove the .R extension
#' @importFrom rstudioapi getSourceEditorContext
#' @export
switchR <- function(){

  file <- rstudioapi::getSourceEditorContext()[['path']]

  if(grepl('[.]model', file) | grepl('[.]in', file)) {
    ext <- unlist(strsplit(file, "/"))
    n.ext <- length(unlist(strsplit(file, "/")))
    old.name <- paste0(getwd(), "/",paste(ext[3:n.ext], collapse = "/"))
    ext[n.ext] <- paste0(ext[n.ext], ".R")
    new.name <- paste0(getwd(), "/",paste(ext[3:n.ext], collapse = "/"))
    invisible(file.rename(from = old.name, to = new.name))
  } else if (grepl('[.]R', file)) {
    ext <- unlist(strsplit(file, "/"))
    n.ext <- length(unlist(strsplit(file, "/")))
    old.name <- paste0(getwd(), "/",paste(ext[3:n.ext], collapse = "/"))
    nameR <- unlist(strsplit(ext[n.ext], "[.]"))
    n.nameR <- length(nameR)
    new.name <- paste(nameR[-n.nameR], collapse = ".")
    ext[n.ext] <- new.name
    new.name <- paste0(getwd(), "/",paste(ext[3:n.ext], collapse = "/"))
    invisible(file.rename(from = old.name, to = new.name))
  }
}
