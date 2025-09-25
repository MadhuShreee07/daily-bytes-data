#variables name in R can be a combination of letters,digits,period and underscore
#R is case sensitive

x <- 10
.y <- 20
z <- x+.y
print(z)

model1 <- 'hello'
typeof(model1)
class(model1)
model1

x <- 100
typeof(x)

y <- 100L
typeof(y)

num <- 3.7
num
typeof(num)
class(num)

#class(x) → tells type of variable
#typeof(x) → internal storage type
#length(x) → number of elements (for vectors, lists)

x <- NA          #Missing values
y <- NULL         #empty varibales
z <- 0/0       # NaN not a number
w <- 1/0       # Infinity

#Type converstions
as.numeric("5")    # converts "5" to 5
as.character(10)   # converts 10 to "10"

#ls() → lists all current variables
#exists("x") → checks if variable x exists
#rm(x)          # removes variable x
#rm(list=ls())  # removes all variables

