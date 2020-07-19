## The following functions allow a matrix to be inverted and cached
## so that it is stored and can be used without having to invert it again.

## makeCacheMatrix will invert and cache a matrix


makeCacheMatrix <- function(x = matrix()) {

    matriz<-NULL
    set <-function (y){
      x<<-y
      matriz<<-NULL
    }
  
    get <- function() x
    setinverted<-function(solve) matriz <<-solve
    getinverted<- function() matriz
    list (set=set,get=get,setinverted=setinverted,getinverted=getinverted)
  
}


## Function to invert a matrix after checking if it was already calculated


cacheSolve <- function(x, ...) {
        
  m<-x$getinverted()
  if(!is.null(matriz)){
    return(matriz)
  }
  
  data-x$get()
  matriz<-solve(data,...)
  x$setinverted(matriz)
  matriz
}
