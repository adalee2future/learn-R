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
