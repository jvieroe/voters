
#' @noRd
check_getPS <- function(spatial,
                        id) {

  if(!spatial %in% c(TRUE, FALSE)) {
    stop("Invalid 'spatial' argument provided. Must be logical")
  }

  if(!id %in% c(TRUE, FALSE)) {
    stop("Invalid 'id' argument provided. Must be logical")
  }

}
