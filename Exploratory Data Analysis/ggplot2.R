library(ggplot2)
str(mpg)

## ggplot "Hello, world!"
qplot(displ, hwy, data = mpg)

## modify aesthetics
qplot(displ, hwy, data = mpg, color = drv)

## adding a geom
qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))

## histograms
qplot(hwy, data = mpg, fill = drv)

## facets
qplot(displ, hwy, data = mpg, facets = . ~ drv)
qplot(hwy, data = mpg, facets = drv ~., binwidth = 2)

## eample: MAACS
str(maacs)

## histogram of eNO
qplot(log(eno), data = maacs)

## histogram by Group
qplot(log(eno), data = maacs, fill = mopos)

## density smooth
qplot(log(eno), data = maacs, geom = "density")
qplot(log(eno), data = maacs, geom = "density", color = mopos)

## scatterplots
qplot(log(pm25), log(eno), data = maacs)
qplot(log(pm25), log(eno), data = maacs, shape = mopos)
qplot(log(pm25), log(eno), data = maacs, color = mopos)
qplot(log(pm25), log(eno), data = maacs, color = mopos, geom = c("point", "smooth"), method = "lm")
qplot(log(pm25), log(eno), data = maacs, color = mopos, geom = c("point", "smooth"), method = "lm", facets = .~mopos)

g <- ggplot(maacs, aes(log(pm25), NocturnalSympt))
p <- g + geom_point()
print(p)

## axis limits
testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50, 2] <- 100
plot(testdat$x, testdat$y, type = "l", ylim = c(-3, 3))

g <- ggplot(testdat, aes(x = x, y = y))
g + geom_line()

g + geom_line() + ylim(-3, 3)
g + geom_line() + coord_cartesian(ylim = c(-3, 3))