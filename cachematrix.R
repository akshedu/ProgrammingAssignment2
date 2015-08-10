## The function makeCacheMatrix takes a matrix and converts it into a special matrix
## These functions are used in the cacheSolve function to check if the inverse of the matrix is already calculated, if yes it returns the same inverse, else it calculates the inverse and returns that

## Sets and gets the matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
      inv <- NULL
      set <- function(y){
        x <<- y
        inv <<- NULL
      }
      get <- function() x
      setinverse <- function(inverse) inv <<- inverse
      getinverse <- function() inv
      list (set = set, get = get,
            setinverse = setinverse, getinverse = getinverse)
}
## Checks if the inverse is already available, if yes returns that, else calcualtes and returns the inverse

cacheSolve <- function(x, ...) {
  inverse <- x$getinverse()
  if(!is.null(inverse)){
    message("getting cached data")
    return(inverse)}
      my_matrix <- x$get()
      inverse <- solve(my_matrix)
      x$setinverse(inverse)
      inverse
}