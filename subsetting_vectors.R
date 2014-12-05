x <- sample(c(rnorm(20), rep(NA, 20)))
x[1: 10]
x[is.na(x)]
x[!is.na(x)]
y <- x[!is.na(x)]
y[y > 0]
x[!is.na(x) & x > 0]
x[c(3, 5, 7)]
x[c(-2, -10)]
x[-c(2, 10)]

vect <- c(foo = 11, bar = 2, norf = NA)
names(vect)
vect2 <- c(11, 2, NA)
names(vect2) <- c("foo", "bar", "norf")
identical(vect, vect2)
vect["bar"]
vect[c("foo", "bar")]