library(methods)

setClass("Person", representation(name = "character", age = "numeric"))

bob <- new("Person", name = "Bob", age = 30)

print(bob@age)
