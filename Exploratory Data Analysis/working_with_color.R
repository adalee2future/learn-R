## colors 1, 2 and 3
x <- rnorm(10)
plot(x, col = 1)
plot(x, col = 2)
plot(x, col = 3)

## colorRamp
pal <- colorRamp(c("red", "blue"))
pal(0)
pal(1)
pal(0.5)

pal(seq(0, 1, len = 10))

## colorRampPalette
pal <- colorRampPalette(c("red", "yellow"))
pal(2)
pal(10)

## RColorBrewer and color RampPalette
library(RColorBrewer)
cols <- brewer.pal(3, "BuGn")
cols
pal <- colorRampPalette(cols)
image(volcano, col = pal(20))

## the smoothScatter function
par(mfrow = c(1, 2))
x <- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x, y)

## scatter plot with no transparency
plot(x, y, pch = 19)

## scatterplot with transparency
plot(x, y, col = rgb(0, 0, 0, 0.2), pch = 19)