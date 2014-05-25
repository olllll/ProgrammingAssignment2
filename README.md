### Introduction

This is my submission for the second programming assignment in Coursera's
R Programming course.
The assignment consists in creating an R function that is able to cache potentially time-consuming computations, so the result of the computation
can be reused later without re-computing.
The actual computation to be cached is a matrix inversion.
The assignment is meant as an exploration of some of the specificities of
the R language, like lexical scoping and functional programming. 
The assignment uses the '<<-' operator as a way to assign the values of the special matrix


### Caching the Inverse of a Matrix

The code contained in the file "cachematrix.R" consists of two functions
* 'makeCacheMatrix' is a function that creates a special "matrix" object
    that can cache its inverse.
* 'cacheSolve' is a function that computes the inverse of the special
"matrix" returned by 'makeCacheMatrix' above. If the inverse has
already been calculated (and the matrix has not changed), then
'cacheSolve' retrieves the inverse from the cache.


### Testing and specificities
For this assignment, I have assumed that the matrix supplied is always
invertible, as was indicated in the instructions.
The function has been tested with several cases designed to ensure that
the functions are (sorry) functional. The example cases include:
* direct calls to makeCacheMatrix and cacheSolve
* calls to the "member functions" get() and getInverse(), both using the entire matrix and a single point as arguments  
  