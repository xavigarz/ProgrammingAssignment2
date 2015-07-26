## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function creates a special "matrix" object given a matrix.
## This object can store the matrix and its inverse using four functions:
## "set" the matrix into the object, "get" the matrix from the object
## "setinv" set the inverse of the matrix and "getinv" get the inverse
## of the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(inv) m <<- inv
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

## Write a short comment describing this function

## This function use the special "matrix" object created with the previous function
## First get the value of the inverse stored in the object using "getinv"
## If the inverse has been evaluated, it gets the value from cache
## else, calculates the inverse and set the inverse in the object

## Note: This function assumes that the matrix is a square invertible matrix

cacheSolve <- function(x) {
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  } else {
  matrix <- x$get()
  m <- solve(matrix)}
  x$setinv(m)
  m
}

## Example of output
##> source("cachematrix.R")
##> B = matrix(c(2, 4, 3, 1, 5, 7,1,3,6), nrow=3, ncol=3)
##> a <- makeCacheMatrix(B)
##> m <- cacheSolve(a)
##> m
##[,1]    [,2]   [,3]
##[1,]  0.5625  0.0625 -0.125
##[2,] -0.9375  0.5625 -0.125
##[3,]  0.8125 -0.6875  0.375
##> m <- cacheSolve(a)
##getting cached data