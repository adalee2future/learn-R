## basic
x <- rnorm(100)
hist(x)
y <- rnorm(100)
plot(x, y)
z <- rnorm(100)
plot(x, z)

## set marginal
plot(x, y)
par(mar = c(2, 2, 2, 2))
plot(x, y)
par(mar = c(4, 4, 2, 2))
plot(x, y)

## pch
plot(x, y, pch = 20)
plot(x, y, pch = 19)
plot(x, y, pch = 2)
plot(x, y, pch = 3)
plot(x, y, pch = 4)

## some examples
example(points)

## add title, text, legend
x <- rnorm(100)
y <- rnorm(100)
plot(x, y, pch = 20)
title("Scatterplot")
text(-2, -2, "label")
legend("topleft", legend = "Data")
legend("topleft", legend = "Data", pch = 20)

## fit 
fit <- lm(y ~ x)
abline(fit)
abline(fit, lwd = 3)
abline(fit, lwd = 3, col = "blue")

## xlab and ylab
plot(x, y, xlab = "Weight", ylab = "Height", main = "Scatterplot", pch = 20)
legend("topright", legend = "Data", pch = 20)
fit <- lm( y~ x)
abline(fit, lwd = 3, col = "red")

## par
z <- rpois(100, 2)
par(mfrow = c(2, 1))
plot(x, y, pch = 20)
plot(x, z, pch = 19)
par("mar")
par(mar = c(2, 2, 1, 1))
plot(x, y, pch = 20)
plot(x, z, pch = 20)
par(mfrow = c(1, 2))
plot(x, y, pch = 20)
plot(x, z, pch = 20)
par(mar = c(4, 4, 2, 2))
plot(x, y, pch = 20)
plot(x, z, pch = 20)
par(mfrow = c(2, 2))
plot(x, y)
plot(x, z)
plot(z, x)
plot(y, x)
par(mfcol = c(2, 2))
plot(x, y)
plot(x, z)
plot(z, x)
par(mfrow = c(1, 1))

x <- rnorm(100)
y <- x + rnorm(100)
g <- gl(2, 50)
g <- gl(2, 50, labels = c("Male", "Female"))
str(g)
plot(x, y)
plot(x, y, type = "n")
points(x[g== "Male"], y[g == "Male"], col = "green")
points(x[g== "Female"], y[g == "Female"], col = "blue")
points(x[g== "Female"], y[g == "Female"], col = "blue", pch = 19)




 







