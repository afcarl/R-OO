library(methods)

setClass("MyInteger", representation(value = "numeric"))
setClass("MyChar", representation(value = "character"))
setClass("MyList", representation(value = "list"))

setGeneric("adding", function(x, ...) {standardGeneric("adding")})
setGeneric("adding", function(x, y, z, ...) {standardGeneric("adding")})

setMethod("adding", signature(x = "MyInteger"), function(x, y) {x@value + y})
setMethod("adding", signature(x = "MyInteger", y = "numeric", z = "numeric"), function(x, y, z, ....) {x@value + y + z})
setMethod("adding", "MyList", function(x, y) {list(x@value, y)})

a <- new("MyInteger", value = 11)
adding(a, 1)
adding(a, 1, 2)

b <- new("MyList", value = list(1, 2, 3))
adding(b, 4)
adding(b, c(4, 5))
