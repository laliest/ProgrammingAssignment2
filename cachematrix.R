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
        
  matriz<-x$getinverted()
  if(!is.null(matriz)){
    return(matriz)
  }
  
  data<-x$get()
  matriz<-solve(data,...)
  x$setinverted(matriz)
  matriz
}

# Matrix to test the functions
numeros<-c(-0.1033,-0.0801,-0.0858,-0.0853,-0.0822,-0.0602,-0.102,0.918,0.946)
placa=matrix(numeros,3,3)
#Functions put to test
matrizobjeto <- makeCacheMatrix(placa)
cacheSolve(matrizobjeto)

