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

# Example data
is_double

# Define the previous solution
move <- function(is_double) {
    if (is_double[1] & is_double[2] & is_double[3]) {
        current <- 11 # Go To Jail
    }
}

# Define the improved solution
improved_move <- function(is_double) {
    if (is_double[1] && is_double[2] && is_double[3]) {
        current <- 11 # Go To Jail
    }
}

# microbenchmark both solutions
# Very occassionally the improved solution is actually a little slower
# This is just random chance
microbenchmark(move(is_double), improved_move(is_double), times = 1e5)