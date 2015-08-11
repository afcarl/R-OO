library(methods)

setClass("Person", representation(name = "character", age = "numeric"))

setGeneric("getAge", function(x) {standardGeneric("getAge")})

setMethod("getAge", "Person", function(x) {x@age})

bob <- new("Person", name = "Bob", age = 30)

print(getAge(bob))
