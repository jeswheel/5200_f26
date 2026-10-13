set.seed(123)

# Create the treatment grid and convert to factors
unrep_data <- expand.grid(
  A = factor(c('a1', 'a2')),
  B = factor(c('b1', 'b2')),
  C = factor(c('c1', 'c2', 'c3')),
  D = factor(c('d1', 'd2'))
)

# Define the true underlying effects
base_yield <- 50

# Strong Main Effects
eff_A <- ifelse(unrep_data$A == 'a2', 12, 0)
eff_B <- ifelse(unrep_data$B == 'a2', -9, 0)
eff_C <- c(6, 0, 15)[unrep_data$C] # Level 1=0, Level 2=6, Level 3=15
eff_D <- ifelse(unrep_data$D == 'd2', 8, 0)

# Moderate 2-Way Interactions (A:B and B:C)
eff_AB <- ifelse(unrep_data$A == 'a2' & unrep_data$B == 'b2', 5, 0)
eff_BC <- ifelse(unrep_data$B == 'b2' & unrep_data$C == 'c3', -6, 0)

# 3. Combine effects and add noise (higher-order error)
unrep_data$yield <- base_yield + eff_A + eff_B + eff_C + eff_D + 
  eff_AB + eff_BC + 
  rnorm(nrow(unrep_data), mean = 0, sd = 2)

unrep_data$yield <- round(unrep_data$yield, 2)

write.csv(unrep_data, 'unrepData.csv', row.names = FALSE)
