## Caching the Inverse of a Matrix

## The first function, makeCacheMatrix: This function creates a special "matrix" object 
## that can cache its inverse
## 	inv:     inverse of matrix x
## 	set:	 set the value of the matrix
## 	get:	 get the value of the matrix
## 	setinv:	 set the value of the inverse
## 	getinv:	 get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  ## intially set inv NULL
  inv <- NULL
 
  set <- function(ne){
    x <<- ma
    inv <<- NULL
  }
  
  get <- function() x
  
  setinv <- function(inversed) inv <<- inversed
  
  getinv <- function() inv
  
  ## return
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## This second function, cacheSolve: This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  inv <- x$getinv()
  
  ## if there is inv, then return it
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  
  ## otherwise, compute the inv, save it to x, and return the inv
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv  		
}
