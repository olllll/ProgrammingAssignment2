##we want to be able to avoid computing the inverse of a matrix more than once
##for that purpose, instead of using solve() directly, we create a set of two functions:
##one that, when called, can store the inverse of that particular matrix 
##and another that, when called, returns the inverse of the matrix


##This function takes a matrix as argument and returns a list to a series of 
##functions which "contain"//"guard the access to" the original matrix and its inverse 
##if the inverse doesn't exist, its value is NULL
makeCacheMatrix <- function(x = matrix()) {
  ##we begin setting inv to NULL
  inv <- NULL
  ##this function is meant to determine the values of the matrix
  setMatrix <-function(y){
    x<<-y ##in all contexts, x gets y
    inv<<-NULL ##in all contents, inv gets null
  }
  getMatrix<-function() x ##this function returns the original matrix
  setInverse<-function(inverse) inv<<-inverse ##this function "stores" the inverse
  getInverse<-function() inv ##this function returns the inverse

##return the list of functions that hold the matrix and its inverse
list(setMatrix = setMatrix,
  getMatrix = getMatrix, 
  getInverse = getInverse,
  setInverse = setInverse
     )
}


## This function takes a list of functions as argument
##the function attempts to fetch the getInverse() function of the list
##if it succeeds, it means that the inverse of the matrix has been solved before and just returns the value
##if it fails, it means that the matrix has not been solved before, so 
  ##it computes the inverse, and returns it (after storing it)

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse<-x$getInverse()
  if(!is.null(inverse)){ ##inverse matrix exists, so we don't have to compute it
    message("getting cached data") ##we can just grab what's in the cache
    return(inverse) ##and leave the function
  }
  ##if we're still here, we have work to do
  mat<-x$getMatrix() ##we take x through getMatrix() and assign it to mat
  inverse<- solve(mat, ...) ##we solve mat (plus the extra args) and assign to inv
  x$setInverse(inverse) ##we store the inverse in the cache in case we need to compute it again 
  inverse ##we return the inverse
}
