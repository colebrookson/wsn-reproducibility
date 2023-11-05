#' Run full analysis pipeline
#' AUTHOR: Cole Brookson
#' DATE: 2023-11-01

#' If you're feeling verbose, you can add a description here of what the whole
#' analysis does

# set up =======================================================================

# packages
library(here)
library(readr)
#library(googledrive)
library(magrittr)
library(dplyr)

# data download and wrangling ==================================================

#' DATA WRANGLING
#' In this file, two datasets are downloaded, one from NOAA, one from Google
#' Drive, and both are cleaned in this script and clean versions are written
#' out to `./data/clean/`
source(here::here("./R/00_data_wrangling.R"))

#' first, use the rm(list = ls()) command with CAUTION, as it removes the
#' environment variables. gc() stands for garbage collector and will attempt
#' to free up any memory that's not being used
rm(list = ls()); gc()
# modeling =====================================================================


