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
#' @family sf_class
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


#' Download data.frame of Statistics Finland classification key.
#'
#' Download data.frame of classification key from Statistics Finland. At least
#' regional classifications other that administrative. For administrative
#' region keys see \code{\link{sf_get_reg_key}}.
#'
#' Versions for all years are not available and Statistical Finland might also
#' remove older versions.
#'
#' @param year A year of codes.
#' @param classification a regional classification.
#' Allowed at least: "kuntaryhmitys", "tyossakayntial".
#' @return A data.frame.
#' @family sf_class
#' @export
#' @examples
#' x <- sf_get_class_key("kuntaryhmitys", 2014)
#' y <- sf_get_class_key("tyossakayntial", 2014)
sf_get_class_key <- function(classification, year){
  base_url <- "http://tilastokeskus.fi/meta/luokitukset/"
  end_url <- "/luokitusavain_teksti.txt"
  tk_url <- paste0(base_url, classification, "/001-", year, end_url)
  z <- read.delim2(file = tk_url, na.strings = "-", skip = 3)
  z
}



#' Download a data.frame of key to trasform from kunta to other classifications
#'
#' Download a data.frame of regional classifications keys from Statistics Finland.
#'
#' @param year A year of codes.
#' @param to_reg a regional classification to tranforms.
#' Allowed at least: "maakunta", "skunta".
#' @return A data.frame.
#' @export
#' @family sf_class
#' @examples
#' x <- sf_get_reg_key("maakunta", 2014)
#' y <- sf_get_reg_key(to_reg = "skunta", year = 2013)

sf_get_reg_key <- function(to_reg, year){
  base_url <- "http://tilastokeskus.fi/meta/luokitukset/kunta/"
  mid_url <- "/luokitusavain_"
  end_url <- "_teksti.txt"
  tk_url <- paste0(base_url, "/001-", year, mid_url, to_reg, end_url)
  z <- read.delim2(file = tk_url, na.strings = "-", skip = 3)

  z
}
