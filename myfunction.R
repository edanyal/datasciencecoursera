###############
##Test File
###############

myVector <- function(x) { 
  x <- 1:10
  print(x)
}

myList <- function(x) {
  x <- list(1, "a", TRUE, 1+4i)
  print(x)
}

myMatrix <- function(x) {
  x <- matrix(1:6, nrow=2, ncol=3)
  print(x)
  
  m <- 1:10
  print (m)
  
  dim(m) <- c(2,5)
  print(m)
  
  a <- 1:3
  b <- 10:12
  print( cbind(a,b) )
  print( rbind(a,b) )
}

myFactor <- function(x){
  x <- factor(c("yes","yes","no","yes","no"), levels = c("yes","no"))
  print(x)
}

myDataframe <- function(x){
  x <- data.frame( foo=1:4, bar=c(T,T,F,F))
  print(x)
  print(ncol(x))
  print(nrow(x))
}

myNames <- function(x) {
  x <- 1:3
  print(names(x))
  
  names(x) <- c("foo","bar","norf")
  print(x)
  
  y <- list(a = 1,b = 2,c = 3)
  print(y)

  m <- matrix(1:4, nrow=2, ncol=2)
  dimnames(m) <- list(c("a","b"), c("c","d"))
  print(m)
}

readData <- function(x) {
  data <- read.table("foo.txt")
  print(data)
  
  csv <- read.csv("foo.txt")
  print(csv)
}

#no data file for this one yet
readLargeData <- function(x) {
  initial <- read.table("datatable.txt", nrows = 100)
  classes <- sapply(initial, class)
  tabAll <- read.table("datatable.txt", colClasses=classes)
}

dputFile <- function(x){
  x <- data.frame(a=1, b="a")
  print(x)
  print(dput(x))
  n
  dput(x, file = "dputFile.R")
  new.x <- dget("dputFile.R")
  print(new.x)
}

dumpFile <- function(x){
  x <- "foo"
  y <- data.frame(a=1, b="a")
  dump(c("x","y"), file="data.R")
  
  rm(x,y)
  source("data.R")
  print(x)
  print(y)
}

otherInterfaces <- function(x){
  #file
  con <- file("foo.txt", "r")
  data <- read.csv(con)
  close(con)
  
  #same as
  data <- read.csv("foo.txt")
  
  #gzfile
  #con <- gzfile("words.gz")
  #x <- readLines(con, 10)
  #print(x)
  
  #bzfile
  #url
  con <- url("http://www.jhsph.edu","r")
  x <- readLines(con)
  print(head(x))
}

subsettingVector <- function(x){
  # [ always returns an object of same class as the original
  x <- c("a","b","c","d","a")
  print( x[1] )
  print( x[2] )
  print( x[1:4] )
  
  print( x[x >"a"] )
  
  u <- x > "a"
  print(u)
  print(x[u])
  # [[ is used to extract elements of a list or a data frame; can be used to extract a single element
  
  # $ is used ot extract elements of a list or data frame by name
}

subsettingList <- function(x) {
  x <- list(foo = 1:4, bar = 0.6)
  print( x ) #list
  print( x[1] ) #list
  print( x[[1]] ) #vector
  print( x$bar ) #vector
  print( x[["bar"]] ) #vector
  print( x["bar"] ) #list
  
  x <- list(foo=1:4, bar=0.6, baz="hello")
  print( x[c(1,3)] )
  
  name <- "foo"
  print( x[[name]] )
  
  print( x$name )
  
  print( x$foo )
  
  x <- list( a=list(10,12,14), b=c(3.14,2.81))
  print( x[[c(1,3)]] )
  
  print( x[[1]][[3]] )
  
  print( x[[c(2,1)]] )
}

subsettingMatrix <- function(x){
  x <- matrix(1:6, 2, 3)
  print(x)
  print( x[1,2] ) #row 1 col 2
  print( x[2,1] ) #row 2 col 1
  print( x[1, ] ) #row 1
  print( x[, 2] ) #col 2
  
  print( x[1,2, drop=FALSE] ) #preserve demesions, get a matrix of row 1 col 2
  
  print( x[1, , drop=FALSE] ) #matrix row 1
}

partialMatching <- function(x){
  x <- list(aardvark = 1:5)
  print( x$a ) #finds matching aardvark
  print( x[["a"]] ) #expects exact match, NULL
  print( x[["a", exact=FALSE ]] ) #works same as x$a
}

removingNAValues <- function(x) { 
  x <- c(1,2,NA,4,NA,5)
  print( x )
  
  bad <- is.na(x)
  print( x[!bad] ) #logical vector
  
  ######
  
  y <- c("a","b", NA, "d", NA, "f")
  good <- complete.cases(x,y) #subset all missing values
  print(good)
  
  print(x[good]) #logical vectors
  print(y[good])
}

vectorizedOps <- function(x) {
  x <- 1:4; y <- 6:9
  print( x + y )
  print( x > 2)
  print( x>= 2)
  print( y==8 )
  print( x * y )
  print( x / y )
}

vectorizedMatrixOps <- function(x) {
  x <- matrix(1:4, 2, 2); y <- matrix(rep(10,4), 2, 2)
  print(x)
  print(y)
  print(x * y)
  print(x / y)
  print(x %*% y)
}
