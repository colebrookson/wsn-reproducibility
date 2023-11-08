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
library(broom)

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

#' MODEL FITTING
#' We compare two models, a simpler model and a more complex option, using AIC.
#' The best model is selected, and the model object is written out to 
#' `./outputs/`
source(here::here("./R/01_model_fitting.R"))

rm(list = ls()); gc()

# plotting =====================================================================

#' PLOTTING 
#' We generate the model predictions on the data from our best model, and plot
#' the raw data along with our model predictions. The final figure is written
#' out to: 
#' `./figs/`
source(here::here("./R/02_plotting.R"))

