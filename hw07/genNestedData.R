# Data Generation for 4-Factor Nested/Crossed Design
set.seed(42)

# Create the experimental grid (72 observations)
# A(3), B(2), C(2), D(3), Replicates(2)
grid <- expand.grid(Rep = 1:2, C = 1:2, B = 1:2, A = 1:3, D = 1:3)

# Unique identifiers for nested factors to map random effects
grid$B_nest <- factor(paste0("A", grid$A, "B", grid$B))
grid$C_nest <- factor(paste0("A", grid$A, "B", grid$B, "C", grid$C))
grid$BD_nest <- factor(paste0(grid$B_nest, "D", grid$D))
grid$CD_nest <- factor(paste0(grid$C_nest, "D", grid$D))

# True parameter values
mu <- 50
alpha <- c(-3, 0, 3)          # Fixed A
delta <- c(2, -4, 2)          # Fixed D
ad_int <- matrix(c(1, -1, 0, 
                   -1,  2, -1, 
                   0, -1,  1), nrow=3, ncol=3) # Fixed AD

# Generate Random Effects (with specific variances)
beta_ji <- rnorm(6,  0, sd = 2)     # B(A) var = 4
gamma_kij <- rnorm(12, 0, sd = 1.5) # C(AB) var = 2.25
bd_jli <- rnorm(18, 0, sd = 1)      # BD(A) var = 1
cd_klij <- rnorm(36, 0, sd = 0.5)   # CD(AB) var = 0.25

# Simulate the response variable Y
y <- numeric(nrow(grid))
for(i in 1:nrow(grid)){
  a <- grid$A[i]
  d <- grid$D[i]
  
  y[i] <- mu + alpha[a] + delta[d] + ad_int[a,d] +
    beta_ji[as.numeric(grid$B_nest[i])] + 
    gamma_kij[as.numeric(grid$C_nest[i])] +
    bd_jli[as.numeric(grid$BD_nest[i])] + 
    cd_klij[as.numeric(grid$CD_nest[i])] + 
    rnorm(1, 0, sd = 1) # Residual error
}

grid$Y <- round(y, 2)

# Export only the columns the students should see
student_data <- grid[, c("A", "B", "C", "D", "Y")]
write.csv(student_data, "nestedDesignData.csv", row.names = FALSE)
