#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
library(methods)

setClass("MyInteger", representation(value = "numeric"))
setClass("MyChar", representation(value = "character"))
setClass("MyList", representation(value = "list"))

# setGeric over write the existing generic
setGeneric("adding", function(x, y, z, ...) {standardGeneric("adding")})

setMethod("adding", signature(x = "MyInteger", y = "numeric"), function(x, y, ...) {x@value + y})
setMethod("adding", signature(x = "MyInteger", y = "numeric", z = "numeric"), function(x, y, z, ...) {x@value + y + z})
setMethod("adding", "MyList", function(x, y) {list(x@value, y)})

a <- new("MyInteger", value = 11)
adding(a, 1)
adding(a, 1, 2)

b <- new("MyList", value = list(1, 2, 3))
adding(b, 4)
adding(b, c(4, 5))
