#' Convert Statfin time variable(s) to numeric or date
#'
#' @param x A data.frame.
#' @param time_format "num" for numeric (default for yearly) and
#'   "date" for \code{\link{Date}} (default otherwise)
#' @param year_col A column name for year
#' @param sub_year_col A column name for quarter or mounth.
#'   If \code{NULL} (default) tries to guess.
#' @export
#' @return A data.frame
#' @examples
#' public_debt2 <- clean_times(public_debt)
#' str(public_debt2)
#' str(clean_times(output_ind, time_format = "date"))


clean_times <- function(x, time_format = NULL,
                        year_col = "Vuosi", sub_year_col = NULL){
  # guess sub year
  if (is.null(sub_year_col)) {
    sub_years <- c("Nelj\u00e4nnesvuosi", "Neljannesvuosi", "Kuukausi")
    sub_year_col <- sub_years[sub_years %in% names(x)]
  }

  # Only yearly
  if (length(sub_year_col) == 0){
    if (is.null(time_format) || time_format == "num"){
      x$time <- tidyr::extract_numeric(x[, year_col])
    } else {
      x$time <- as.Date(
        paste0(tidyr::extract_numeric(x[, year_col]), "-01-01"))
    }
    x[, year_col] <- NULL
    return(x)

  # mounthly or quertely
  } else {

    subs <- as.character(unique(x[[sub_year_col]]))

    # TODO tarkistus subs == ensimmäiset

    mounths <- seq.int(1, by = 12/length(subs), length.out = length(subs))

    if (is.null(time_format) || time_format == "num"){
      x$time <- tidyr::extract_numeric(x[, year_col]) +
        (mounths - 1) * 1/length(mounths)
    } else {
      x$time <- as.Date(
        paste0(tidyr::extract_numeric(x[, year_col]), "-",
               mounths[match(subs, x[[sub_year_col]])] , "-1"))
    }
    x[, year_col] <- NULL
    x[, sub_year_col] <- NULL
    return(x)
  }


}
