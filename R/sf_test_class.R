#' Test if classification used is Statistics Finland classification
#'
#' @param x avector to test for classification
#' @param col a column name from a classification data.frame to test against.
#' Names form Statistics Finland, see what code{\link{sf_get_class}} gives.
#' @param ... parameters to select a classification. Passed to \code{\link{sf_get_class}}.
#' @export

sf_test_class <- function(x, col, ...){
  classific <<- sf_get_class(...)[, col]
x <<- x
  if (is.factor(x)){
    x <- levels(x)
    classific <- levels(classific)
  }
  y <- if(length(setdiff(classific, x)) == 0) TRUE else FALSE
  warning("Missing from x:\n", paste(classific[!classific %in% x], collapse = ", "),
          "\nMissing from classification:\n", paste(x[!x %in% classific], collapse = ", "))
  y
}

