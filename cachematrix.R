## This function creates a special object "matrix", and set the value
## of matrix elements, gets the value, sets and gets the value of inverted matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
         x <<- y
         m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}




## This function firstly checkes, whether the matrix was inverted
## previously, if so it gets the value from the cache, otherwise 
##it is calculating the invertion
cacheSolve <- function(x, ...) {
     m<-x$getsolve()
     if(!is.null(m)) {
           message("getting cached data")
           return(m)
       }
    matrix <- x$get()
    m <- solve(matrix, ...)
    x$setsolve(m)
    m
    
        }
