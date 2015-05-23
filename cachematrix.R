## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
          x <<- y
          m <<- NULL
        } 
    ##get the inverse of the special matrix created
    
        get <- function() x
    ##use r inbult function solve to calculate the inverse
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
    ##use list to obtain the inverse matrix
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
  
  
}


## Write a short comment describing this function
##This function computes the inverse of the special "matrix" returned by makeCacheMatrix above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        
        ## if m is not null, get the cached data from the special matrix
        if(!is.null(m)) {
          message("getting cached data")
          return(m)
        }
        data <- x$get()
        m <- inverse(data, ...)
        
        ## settins m as the inverse matrix
        x$setinverse(m)
        m  
}
