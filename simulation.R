x <- rnorm(10)
x
x <- rnorm(10, 20, 2)
x
summary(x)

## always set the random number seed when conducting a simu
set.seed(1)
rnorm(5)
rnorm(5)
set.seed(1)
rnorm(5)

## generrating Poisson data
rpois(10, 1)
rpois(10, 2)
rpois(10, 20)
rpois(2, 2)  ## Cumulative distribution, Pr(x <= 2)
rpois(4, 2)  ## Pr(x <= 4)
rpois(6, 2)  ## Pr(x <= 6)

## generating random numbers from a model
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)
## What if x is binary?
set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)
## a Poisson model
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y)

## Random Sampling
set.seed(1)
sample(1:10, 4)
sample(1:10, 4)
sample(letters, 5)
sample(1:10)
sample(1:10)
sample(1:10, replace = TRUE)

