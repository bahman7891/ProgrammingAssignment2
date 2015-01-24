## The following two functions define a series of functions that find the inverse 
## of a defined matrix preferably from the cache if the inverse is already 
## there or otherwise calculates it using the function Solve.



## Function makeCacheMatrix will create a list of functions (setmat,getmat,setinv and getinv)
## which respectively : set the value of a matrix, get the value of a matrix, 
## set the value of the inverse of the matrix and finally gets the value of the 
## inverse of the matrix.


makeCacheMatrix <-function(mat = matrix()) {
  matin <- NULL
  setmat <- function(y) {
    mat <<- y
    matin <<- NULL
  }
  getmat <- function() mat
  setinv <- function(inv) matin <<- inv
  getinv <- function() matin
  list(setmat = setmat, getmat = getmat,
       setinv = setinv,
       getinv = getinv)
}


## Fucntion cacheSolve first finds out if the inverse of the matrix defined above
## exists in the cache or not and if it does gets it from cache using "getinv"
## and if it doesn't calculates it using R's "Solve" function.

cacheSolve <- function(mat, ...) {
  matin <- mat$getinv()
  if(!is.null(matin)) {
    message("getting cached data")
    return(matin)
  }
  data <- mat$getmat()
  matin <- Solve(data, ...)
  mat$setinv(m)
  m
}
