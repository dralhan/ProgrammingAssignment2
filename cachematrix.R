## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#create cache object, and for the matrix the getter/setter methods.

makeCacheMatrix <- function(x = matrix()) {
  cache <- NULL
  set <- function(y) {
    x <<- y
    cache <<- NULL
  }
  get <- function() x
  setmatrix <- function(inverse) cache <<- inverse
  getmatrix <- function() cache
  list(set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)
}

# gets the result from cache, or if null calculates the inverse. 
cacheSolve <- function(x, ...) {
  cache <- x$getmatrix()
  if(!is.null(cache)) {
    message("getting cached data.")
    return(cache)
  }
  data <- x$get()
  cache <- solve(data)
  x$setmatrix(cache)
  cache
}

