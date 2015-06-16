## Functions cache a matrix object and its inverse.

## Functions makeCacheMatrix receives a matrix object and stores it in cache. It also 
## creates get and set methods for the matrix object and inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(new_value) {
        x <<- new_value
        inverse <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse_matrix) inverse <<- inverse_matrix
    getinverse <- function() inverse
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Function returns a matrix that is the inverse of a given matrix. It retrieves the cached
## matrix if available, if not, it calculates the inverse and stores it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inverse <- x$getinverse()
    if(!is.null(inverse)){
        message("getting cached data")
        return(inverse)
    }
    invertible_matrix <- x$get()
    inverse <- solve(invertible_matrix)
    x$setinverse(inverse)
    inverse
}
