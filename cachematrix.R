##we want to be able to avoid computing the inverse of a matrix more than once
##for that purpose, instead of using solve() directly, we create a set of two functions:
##one that, when called, creates a list that stores a particular matrix and its inverse 
##and another that, when called, returns the inverse of the matrix


##This function takes a matrix as argument and returns a list to a series of 
##functions which "contain"//"guard the access to" the original matrix and its inverse 

makeCacheMatrix <- function(x = matrix()) {
  ##inv is the variable that holds the inverse of the matrix.
## When we call makeCacheMatrix, it is set to NULL by default
  inv <- NULL
  ##this function is meant to establish the values of the matrix. 
  ##If we had a previous matrix stored, it rewrites its parameters 
##and clears the value for the inverse
  set <-function(y){
    x<<-y ## x (the matrix we are building) is set to y
    inv<<-NULL ##if we had a previous matrix stored, 
		##this ensures that the inv variable 
		##is resetted when we define the new matrix
  }
  get<-function() x ##when called, this function returns the original matrix
  setInverse<-function(inverse) inv<<-inverse ##this function "stores" the inverse, 
						##as received from the outside parameter "inverse"
  getInverse<-function() inv ##when called, this function returns the inverse

##return the list of functions that hold the matrix and its inverse
list(set = set,
  get = get, 
  getInverse = getInverse,
  setInverse = setInverse
     )
}


## This function takes a list of functions as argument
##the function attempts to fetch the getInverse() function of the list
##if it succeeds, it means that the inverse of the matrix has been solved before 
  ##and just returns the value
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
  mat<-x$get() ##we take x through get() and assign it to mat
  inverse<- solve(mat, ...) ##we solve mat (plus the extra args) and assign to inv
  x$setInverse(inverse) ##we store the inverse in the cache in case we need to compute it again 
  inverse ##we return the inverse
}
