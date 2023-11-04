#' Data Wrangling
#' AUTHOR: Cole Brookson
#' DATE: 2023-11-01

# pull data from online source =================================================

## noaa data ===================================================================
url_noaa <- paste0("https://www.webapps.nwfsc.noaa.gov/data/api/v1/source/",
              "observer.gemm_fact/selection.csv")

# system() is running a command on your computer to download the file
download.file(url_noaa, here::here("./data/raw/noaa-data.csv"), mode="wb")

## species richness data =======================================================

#' This bit here will work on your own if you want to set up the googldrive API
#googledrive::drive_download("species-richness.csv")

url_spp <- paste0("https://drive.google.com/uc?export=download&id=",
                  "1N4nyfU12nSg68N14C6LfMuPA2L14KWBh")

# system() is running a command on your computer to download the file
download.file(url_spp, here::here("./data/raw/richness-data.csv"), mode="wb")

# read in data and clean it ====================================================

## noaa data ===================================================================
noaa_df <- readr::read_csv(here::here("./data/raw/noaa-data.csv"))

noaa_df <- noaa_df %>% 
  dplyr::filter(years > 2010) %>% 
  dplyr::select(year, total_discard_with_mort_rates_applied_and_landings_mt) %>% 
  dplyr::rename(
    total_mt = total_discard_with_mort_rates_applied_and_landings_mt
    )

## species richness data =======================================================
rich_df <- readr::read_csv(here::here("./data/raw/richness-data.csv"))

# look to see if there's any NA's in the data 
if(any(complete.cases(rich_df) == FALSE)) {
  rich_df <- na.omit(rich_df)
}

# write out resulting files ====================================================
readr::write_csv(noaa_df, here::here("./data/clean/noaa-data.csv"))
readr::write_csv(rich_df, here::here("./data/clean/richness-data.csv"))
