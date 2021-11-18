
#' @noRd
check_getPS <- function(spatial) {

  if(!spatial %in% c(TRUE, FALSE)) {
    stop("Invalid 'spatial' argument provided. Must be logical")
  }

}
