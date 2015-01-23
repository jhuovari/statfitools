#' Make syntactically valid names
#'
#' Try to make more convinient names than \code{\link{make.names}}.
#'
#'  Replacements:
#'  * replace some umlaut mark chracters with a character without
#'  * a space and punctuations with "_"
#'  * several, leading and trailing "_"
#'  * \code{\link{make.names}} with unique = TRUE
#'
#' @param x a character vector with names to change
#' @return a character vector.
#' @export
#' @examples
#'   make_names(c("M\u00E4\u00E4r\u00E4", "Regional code"))
#'   make_names("Hello, world!")

make_names <- function (x) {

  patt <- c("\u00C4", "\u00E4", "\u00D6", "\u00F6", "\u00C5", "\u00E5", " ")
  repl <- c("A", "a", "O", "o", "A", "a", "_")

  # more general could be iconv(x, to="ASCII//TRANSLIT"), but TRANSLIT could produce extra characters

  for (i in seq_along(patt)){
    x <- gsub(patt[i], repl[i], x)
  }
  # remove punctuations
  x <- gsub("[[:punct:]]", "_", x)
  # extra _
  x <- gsub("_+", "_", x)
  x <- gsub("^_|_$", "", x)

  x <- make.names(x, unique = TRUE)

  x
}

#' Make syntactically valid names and reuturn an object
#'
#' Apply \code{\link{make_names}} to object and return an object.
#'
#' @param x an object with names to change
#' @return an object.
#' @export
clean_names <- function(x){
  x_names <- names(x)
  x_names <- make_names(x_names)
  names(x) <- x_names
  x
}


