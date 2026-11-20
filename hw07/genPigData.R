# Set seed for reproducibility
set.seed(42)

# Study parameters
n_feeds <- 3
n_pens_per_feed <- 4
n_pigs_per_pen <- 5

# True effects and variances
mu <- 275
feed_effects_true <- c(0, -20, 12) # Standard, High-Protein, High-Fat
var_pen <- 8^2 # Pen-to-pen variance
var_pig <- 27^2  # Pig-to-pig variance

# Generate factors
Feed <- as.factor(rep(c("Standard", "High-Protein", "High-Fat"), 
                      each = n_pens_per_feed * n_pigs_per_pen))
Pen <- as.factor(rep(1:(n_feeds * n_pens_per_feed), 
                     each = n_pigs_per_pen))
Pig <- as.factor(rep(1:n_pigs_per_pen, 
                     times = n_feeds * n_pens_per_feed))

# Generate weights based on the nested model
feed_eff <- rep(feed_effects_true, each = n_pens_per_feed * n_pigs_per_pen)
pen_eff <- rep(rnorm(n_feeds * n_pens_per_feed, mean = 0, sd = sqrt(var_pen)), 
               each = n_pigs_per_pen)
pig_eff <- rnorm(n_feeds * n_pens_per_feed * n_pigs_per_pen, mean = 0, sd = sqrt(var_pig))

Weight <- mu + feed_eff + pen_eff + pig_eff

# Combine into a dataframe
pig_data <- data.frame(Feed, Pen, Pig, Weight)

write.csv(pig_data, "pig_feed_data.csv", row.names = FALSE)
