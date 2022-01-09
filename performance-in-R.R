# Load the microbenchmark package
library(microbenchmark)

# The previous data frame solution is defined
# d() Simulates 6 dices rolls
d <- function() {
  data.frame(
    d1 = sample(1:6, 3, replace = TRUE),
    d2 = sample(1:6, 3, replace = TRUE)
  )
}

# Complete the matrix solution
m <- function() {
  matrix(sample(1:6, 6, replace = TRUE), ncol = 2)
}

# Use microbenchmark to time m() and d()
microbenchmark(
 data.frame_solution = d(),
 matrix_solution     = m()
)

# Example data
rolls

# Define the previous solution 
app <- function(x) {
    apply(x, 1, sum)
}

# Define the new solution
r_sum <- function(x) {
    rowSums(x)
}

# Compare the methods
microbenchmark(
    app_sol = app(rolls),
    r_sum_sol = r_sum(rolls)
)