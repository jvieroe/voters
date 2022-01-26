
#' @noRd
check_getPS <- function(spatial,
                        id) {

  # if(class(spatial) == "numeric") {
  #   stop("Invalid 'spatial' argument provided. Must be logical")
  # }
  #
  # if(class(spatial) == "character") {
  #   stop("Invalid 'spatial' argument provided. Must be logical")
  # }
  #
  # if(class(spatial) == "integer") {
  #   stop("Invalid 'spatial' argument provided. Must be logical")
  # }
  #
  # if(class(spatial) == "factor") {
  #   stop("Invalid 'spatial' argument provided. Must be logical")
  # }
  #
  if(!spatial %in% c(TRUE, FALSE)) {
    stop("Invalid 'spatial' argument provided. Must be logical")
  }

  # if(class(id) == "numeric") {
  #   stop("Invalid 'id' argument provided. Must be logical")
  # }
  #
  # if(class(id) == "character") {
  #   stop("Invalid 'id' argument provided. Must be logical")
  # }
  #
  # if(class(id) == "integer") {
  #   stop("Invalid 'id' argument provided. Must be logical")
  # }
  #
  # if(class(id) == "factor") {
  #   stop("Invalid 'id' argument provided. Must be logical")
  # }

  if(!id %in% c(TRUE, FALSE)) {
    stop("Invalid 'id' argument provided. Must be logical")
  }

}
