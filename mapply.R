str(mapply)

mapply(rep, 1:4, 4:1)

noise <- function(n, mean, sd) {rnorm(n, mean, sd)}
noise(5, 1, 2)
noise(1:5, 1:5, 2)
mapply(noise, 1:5, 1:5, 2)