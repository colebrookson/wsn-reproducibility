#' Plotting
#' AUTHOR: Cole Brookson
#' DATE: 2023-11-01

# read in model object and dataframe ===========================================

rich_df <- readr::read_csv(here::here("./data/clean/richness-data.csv"),
                           show_col_types = FALSE)

# make results plot ============================================================

plot <- ggplot2::ggplot() +
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
print("plot generated")