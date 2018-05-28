# Generate Random Data
set.seed(3)
x <- rnorm(n = 50, mean = 21, sd = 7)

a_true <- sample.int(n = 5, size = 1)
b_true <- sample.int(n = 5, size = 1)

y <- a_true + b_true*x + rnorm(n = 50, mean = 0, sd = 6)
# True DGP: y = a_t + b_t * x + u

# a = intercept, b = slope
a <- 3
b <- 2
line <- a + b*seq(min(x)-1, max(x)+1, .1)

if (a == 3 && b == 2){ # maybe use "near" instead?
  plot(x, y, col = "royalblue", size = 1, ylim = c(0, 150))
  lines(seq(min(x)-1, max(x)+1, .1), line, col='green')
} else {
  plot(x, y, col = "royalblue")
  lines(seq(min(x)-1, max(x)+1, .1), line, col='darkred')
}

#TODO: generate infinitely many examples
