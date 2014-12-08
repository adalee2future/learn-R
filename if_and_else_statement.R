x <- 1
if(x > 3) {
    y <- 10
} else {
    y <- 0
}
y   ##[1] 0

y <- if(x > 3) {
    10
} else {
    0
}

if(x == 1){print("x equals to 1")}