make.power <- function(n) {
    pow <- function(x) {
        x ^ n
    }
    pow
}
cube <- make.power(3)
cube(3)
square <- make.power(2)
square(3)

## exploring a function closure
ls(environment(cube))   ## [1] "n"   "pow"
get("n", environment(cube)) ## [1] 3
ls(environment(square)) ## [1] "n"   "pow"
get("n", environment(square))   ## [1] 2

y <- 10
f <- function(x) {
    y <- 2
    y ^ 2 + g(x)
}

g <- function(x) {
    x * y
}

f(3) ## [1] 34