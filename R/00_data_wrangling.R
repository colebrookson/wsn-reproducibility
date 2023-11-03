#' Data Wrangling
#' AUTHOR: Cole Brookson
#' DATE: 2023-11-01

# pull data from online source =================================================

url <- paste0("https://www.webapps.nwfsc.noaa.gov/data/api/v1/source/",
              "observer.gemm_fact/selection.csv")

# system() is running a command on your computer to download the file
download.file(url, here::here("./data/raw/noaa-data.csv"), mode="wb")

# read in data and clean it ====================================================
df <- readr::read_csv(here::here("./data/raw/noaa-data.csv"))


