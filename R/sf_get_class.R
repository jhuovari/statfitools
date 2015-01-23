#' Download statistical classifications from the Statistics Finland.
#'
#' Download a data.frame of classifications from the Statistics Finland webpage.
#' The data.frame includes codes and names for a classifications.
#'
#' For all available classifications see
#' \url{http://tilastokeskus.fi/meta/luokitukset/index_en.html} (for english)
#' and \url{http://tilastokeskus.fi/meta/luokitukset/} (for finnish).
#'
#' Some of available classification include:
#'
#' Regional
#' \itemize{
#'   \item kunta
#'   \item seutukunta
#'   \item maakunta
#' }
#'
#' Economic
#' \itemize{
#'   \item toimiala
#'   \item cpa
#' }
#'
#'
#' @param class a a name of the classification.
#' @param year a year of the classification.
#' @param lang a language code. Available "fi", "en", "sv".
#' @return a data.frame.
#' @export
#' @examples
#' x <- sf_get_class("kunta", 2014)
#' y <- sf_get_class("seutukunta", 2013)
#' z <- sf_get_class("maakunta", 2013)
#' t <- sf_get_class("toimiala", 2008, lang = "en")
sf_get_class <- function(class, year, lang = "fi"){
  lang <- if(lang == "fi") "" else paste0("_", lang)
  base_url <- "http://tilastokeskus.fi/meta/luokitukset/"
  tk_url <- paste0(base_url, class, "/001-", year, "/tekstitiedosto", lang, ".txt")
  z <- read.delim2(file = tk_url, na.strings = "-", skip = 3)
  z
}
