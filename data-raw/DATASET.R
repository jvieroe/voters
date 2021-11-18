## code to prepare `DATASET` dataset goes here

vs <- utils::read.csv("C:/Users/jevi/OneDrive - Epinion/Documents/GitHub/PollingStationsDK/Geografiske_stamdata.csv",
                      sep = ";")

vs <- vs %>%
  dplyr::select(c(Valgsted.navn,
                  Valgsted.Id,
                  KommuneNr)) %>%
  dplyr::rename(ps_id = Valgsted.Id) %>%
  tibble::tibble()

usethis::use_data(vs, overwrite = TRUE, internal = FALSE)
