#' Plotting
#' AUTHOR: Cole Brookson
#' DATE: 2023-11-01

# read in model object and dataframe ===========================================

rich_df <- readr::read_csv(here::here("./data/clean/richness-data.csv"))
mod <- readRDS(here::here("./outputs/best-model.rds"))

# get model predictions ========================================================

# make new data to regress against -- use expand.grid()
full_df <- expand.grid(
  biomass = seq(min(rich_df$biomass), max(rich_df$biomass), length.out = 200),
  # note that pH has to be a factor here
  ph = levels(as.factor(rich_df$ph)))

# make model predictions
mod_pred <- stats::predict(
  mod,
  newdata = full_df,
  type = "response"
)

# bind to a dataframe
predict_df <- data.frame(
  cbind(full_df,
        n_spp = mod_pred)
)
head(predict_df)

# make results plot ============================================================

plot <- ggplot2::ggplot() +
  ggplot2::geom_line(data = predict_df, 
                     ggplot2::aes(x = biomass, y = n_spp, colour = ph),
                     linewidth = 1.3) +
  ggplot2::geom_point(data = rich_df, 
                      ggplot2::aes(x = biomass, y = n_spp, fill = ph),
                      shape = 21, size = 3) +
  ggplot2::labs(x = "Biomass", y = "# Species") + 
  ggplot2::theme_classic()

# save plot 
ggplot2::ggsave(
  here::here("./figs/model-predictions.png"),
  plot,
  height = 6, width = 8
)
