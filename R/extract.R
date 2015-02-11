#' Extract only numeric component
#'
#' This uses a regular expression to strip all non-numeric character
#' from a string, including minus sign. Then coerces the result to a number.
#' Modification of \code{\link[dplyr]{extract_numeric}}, that does not
#' strip minus sign. Useful to extract numeric codes from code-name variables.
#'
#' @param x A character vector (or a factor).
#' @export
#'
#' @examples
#'  extract_code("508 Mantta-Vilppula")

extract_code <- function (x) {
  as.numeric(gsub("[^0-9]+", "", as.character(x)))
}
