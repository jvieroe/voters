#' Get voting station data
#'
#' This function extracts spatial data on voting stations in Denmark from \url{https://info.aws.dk/afstemningsomraader/}
#' @param spatial a logical value. Return data of class `sf`? Defaults to `TRUE`
#' @return data on danish voting stations
#' @examples
#' voting_stations <- getPS()
#' @author Jeppe Vierø
#' @import sf rgdal janitor lubridate tibble dplyr magrittr
#' @export

getPS <- function(spatial = TRUE) {

  ps <- sf::read_sf("https://api.dataforsyningen.dk/afstemningsomraader?format=geojson")

  ps <- ps %>%
    tibble::tibble() %>%
    janitor::clean_names() %>%
    dplyr::rename(dagi_ID = dagi_id,
                  station = afstemningsstednavn,
                  st_id = afstemningsstedadresseid,
                  st_add = afstemningsstedadressebetegnelse,
                  st_lon = afstemningssted_adgangspunkt_x,
                  st_lat = afstemningssted_adgangspunkt_y,
                  muni_code = kommunekode,
                  muni = kommunenavn,
                  regi_code = regionskode,
                  regi = regionsnavn,
                  kreds_id = opstillingskredsnummer,
                  kreds = opstillingskredsnavn,
                  stkreds_id = storkredsnummer,
                  stkreds = storkredsnavn,
                  valg_ld_l = valglandsdelsbogstav,
                  valg_ld = valglandsdelsnavn,
                  edit = aendret,
                  geo_edit = geo_aendret,
                  geo_v = geo_version,
                  vcent_lon = visueltcenter_x,
                  vcent_lat = visueltcenter_y) %>%
    sf::st_as_sf() %>%
    sf::st_cast("MULTIPOLYGON")

  ps <- ps %>%
    dplyr::mutate(edit = lubridate::ymd_hms(edit),
                  geo_edit = lubridate::ymd_hms(geo_edit)) %>%
    dplyr::mutate(edit = as.character(edit),
                  geo_edit = as.character(geo_edit))


  if (spatial == TRUE) {

    ps <- ps

  } else if (spatial == FALSE) {

    ps <- ps %>%
      tibble::tibble() %>%
      dplyr::select(-geometry)

  }

  return(ps)

}
