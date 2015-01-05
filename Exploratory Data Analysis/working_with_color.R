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