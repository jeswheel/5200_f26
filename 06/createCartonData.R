set.seed(2027)

# Design parameters
n_mach <- 5
n_oper <- 4
n_rep <- 4

# Create the completely randomized factorial grid
carton <- expand.grid(
  Machine = factor(paste0("M", 1:n_mach)),
  Operator = factor(paste0("Op", 1:n_oper)),
  Replicate = 1:n_rep
)

# Define true variances
var_machine <- 12
var_operator <- 6
var_interaction <- 3
var_error <- 1.5

# Simulate random effects from Normal distributions
eff_M <- rnorm(n_mach, mean = 0, sd = sqrt(var_machine))
eff_O <- rnorm(n_oper, mean = 0, sd = sqrt(var_operator))
eff_MO <- rnorm(n_mach * n_oper, mean = 0, sd = sqrt(var_interaction))

# Map effects to the dataset and calculate final response
carton$thickness <- 50 + 
  eff_M[carton$Machine] + 
  eff_O[carton$Operator] + 
  eff_MO[interaction(carton$Machine, carton$Operator)] + 
  rnorm(nrow(carton), mean = 0, sd = sqrt(var_error))

write.csv(carton, file = 'carton.csv', row.names = FALSE)



