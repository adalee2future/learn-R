x <- list(foo = 1:4, bar = 0.6)
x[1]
x[[1]]
x$bar
x[["bar"]]
x["bar"]

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
names <- "foo"
x[[names]] ## computed index for 'foo'
x$name     ## element 'name' doesn't exist!
x$foo

x <- list(aardvark = 1:5)
x$a  ## [1] 1 2 3 4 5
x[["a"]] ## NULL
x[["a", exact = FALSE]] ## [1] 1 2 3 4 5
