#' Get voting station data
#'
#' This function extracts spatial data on voting stations in Denmark from \url{https://info.aws.dk/afstemningsomraader/}
#' @param spatial a logical value. Return data of class `sf`? Defaults to `TRUE`
#' @param id a logical value. Return a numeric ID as a link to the election results data from \url{https://valgdatabase.dst.dk/?lang=en}. Defaults to TRUE
#' @return data on danish voting stations
#' @examples
#' voting_stations <- getPS()
#' @author Jeppe Vierø
#' @import sf rgdal janitor lubridate tibble dplyr magrittr labelled
#' @export

getPS <- function(spatial = TRUE,
                  id = TRUE) {

  check_getPS(spatial = spatial,
              id = id)

  ps <- sf::read_sf("https://api.dataforsyningen.dk/afstemningsomraader?format=geojson")

  labelled::var_label(ps) <- base::colnames(ps)

  ps <- ps %>%
    tibble::tibble() %>%
    janitor::clean_names() %>%
    dplyr::rename(dagi_ID = .data$dagi_id,
                  number = nummer,
                  name = navn,
                  station = .data$afstemningsstednavn,
                  st_id = .data$afstemningsstedadresseid,
                  st_add = .data$afstemningsstedadressebetegnelse,
                  st_lon = .data$afstemningssted_adgangspunkt_x,
                  st_lat = .data$afstemningssted_adgangspunkt_y,
                  muni_code = .data$kommunekode,
                  muni = .data$kommunenavn,
                  regi_code = .data$regionskode,
                  regi = .data$regionsnavn,
                  kreds_id = .data$opstillingskredsnummer,
                  kreds = .data$opstillingskredsnavn,
                  stkreds_id = .data$storkredsnummer,
                  stkreds = .data$storkredsnavn,
                  valg_ld_l = .data$valglandsdelsbogstav,
                  valg_ld = .data$valglandsdelsnavn,
                  edit = .data$aendret,
                  geo_edit = .data$geo_aendret,
                  geo_v = .data$geo_version,
                  vcent_lon = .data$visueltcenter_x,
                  vcent_lat = .data$visueltcenter_y) %>%
    sf::st_as_sf() %>%
    sf::st_cast("MULTIPOLYGON")

  ps <- ps %>%
    dplyr::mutate(edit = lubridate::ymd_hms(.data$edit),
                  geo_edit = lubridate::ymd_hms(.data$geo_edit)) %>%
    dplyr::mutate(edit = base::as.character(.data$edit),
                  geo_edit = base::as.character(.data$geo_edit)) %>%
    dplyr::mutate(muni_code = as.numeric(muni_code),
                  regi_code = as.numeric(regi_code))


  if (spatial == TRUE) {

    pss <- ps

  } else if (spatial == FALSE) {

    pss <- ps %>%
      tibble::tibble() %>%
      dplyr::select(-.data$geometry)

  }

  if (id == TRUE) {

    psss <- pss %>%
      dplyr::left_join(.,
                       voters::vs,
                       by = c("name" = "Valgsted.navn",
                              "muni_code" = "KommuneNr")) %>%
      dplyr::select(c("dagi_id",
                      "ps_id",
                      base::setdiff(names(.), c("dagi_id",
                                                "ps_id"))))


  } else if (id == FALSE) {

    psss <- pss

  }

  return(psss)

}
