#' Model Fitting
#' AUTHOR: Cole Brookson
#' DATE: 2023-11-01

# read in cleaned data =========================================================
rich_df <- readr::read_csv(here::here("./data/clean/richness-data.csv"))

# model fitting ================================================================

# check to make sure the columns are what we want them to be
if(is.character(rich_df$ph)) {
  rich_df$ph <- as.factor(rich_df$ph)
}

# compare between just biomass and biomass interacting with pH
mod1 <- stats::glm(n_spp ~ biomass, data = rich_df,
                   family = poisson(link = "log"))
mod2 <- stats::glm(n_spp ~ biomass*ph, data = rich_df,
                   family = poisson(link = "log"))

# use AIC as our comparison 
if(AIC(mod2) < (AIC(mod1) - 2)) {
  mod <- mod2
} else if(AIC(mod1) < (AIC(mod2) - 2)) {
  mod <- mod1
} else {
  stop("Models need manual evaluation")
}

# save our best model 
saveRDS(mod, here::here("./outputs/best-model.rds"))
