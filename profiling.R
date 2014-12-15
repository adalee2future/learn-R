## Elapsed time > user time
system.time(readLines("http://www.jhsph.edu"))

## Elaspsed time < user time
hilbert <- function(n) {
  i <- 1:n
  1 / outer(i - 1, i, "+")
}
x <- hilbert(100)
system.time(svd(x))

## timing longer expressiosn
system.time({
  n <- 1000
  r <- numeric(n)
  for (i in 1:n) {
    x <- rnorm(n)
    r[i] <- mean(x)
  }
})

## R profile Raw Output
sample.interval = 1000