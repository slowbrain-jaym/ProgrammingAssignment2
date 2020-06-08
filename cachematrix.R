## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##Takes a matrix as an argument and creates a vector of functions able to store
##the matrix and its inverse
makeCacheMatrix <- function(x = matrix()) {
  inv<- NULL
  set<-function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inversematrix) inv <<-inversematrix
  getinv <- function() inv
  list(set = set, get = get, setinv=setinv, getinv=getinv)
}


## Write a short comment describing this function
##Takes a makeCacheMatrix Vector as an argument, computes the inverse of the 
##matrix or returns the stored inverse if available
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)){
    message("getting cached inverse")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinv(inv)
  inv
}

