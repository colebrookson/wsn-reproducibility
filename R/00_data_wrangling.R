#' Data Wrangling
#' AUTHOR: Cole Brookson
#' DATE: 2023-11-01

# pull data from online source =================================================
#' This bit here will work on your own if you want to set up the googldrive API
#googledrive::drive_download("species-richness.csv")

url_spp <- paste0("https://drive.google.com/uc?export=download&id=",
                  "1N4nyfU12nSg68N14C6LfMuPA2L14KWBh")

# system() is running a command on your computer to download the file
download.file(url_spp, here::here("./data/raw/richness-data.csv"), mode="wb")

# read in data and clean it ====================================================
rich_df <- readr::read_csv(here::here("./data/raw/richness-data.csv"))

# look to see if there's any NA's in the data 
if(any(stats::complete.cases(rich_df) == FALSE)) {
  rich_df <- stats::na.omit(rich_df)
}

# rename the column names
rich_df <- rich_df %>% 
  dplyr::rename(n_spp = Species) %>% 
  dplyr::rename_with(tolower)

# write out resulting files ====================================================
readr::write_csv(rich_df, here::here("./data/clean/richness-data.csv"))
