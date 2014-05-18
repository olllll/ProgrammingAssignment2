## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  setMatrix <-function(y){
    ##x$data<<-y$data
    ##x$nrow<<-y$nrow
    ##x$ncol<<-y$ncol
    x<<-y ##x takes y
    inv<<-NULL
  }
  getMatrix<-function() x
##  setInverse<-function(inverse) inv<<-inverse##solve(x)
  getInverse<-function() inv

##return the "special" matrix which contains its inverse
list(setMatrix = setMatrix,
  getMatrix = getMatrix, 
  getInverse = getInverse##,
 ## setInverse = setInverse
     )
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse<-x$getInverse()
  if(!is.null(inverse)){ ##inv exists
    message("getting cached data")
    return(inverse)
  }
  ##if we're still here, we have work to do
  mat<-x$getMatrix() ##we take x through get() and assign it to mat
  inverse<- solve(mat, ...) ##we solve mat (plus the extra args) and assign to inv
  ##mat$setInverse(inverse) ##we call the setInverse function of mat through inv; 
  inverse
}
