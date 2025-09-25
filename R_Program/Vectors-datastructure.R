#VECTORS - A vector is a sequence of elements of the same type (numeric, character, logical, etc.).
  
num_vec <- c(1, 2, 3, 4)                      #numeric vector
char_vec <- c("apple", "banana", "cherry")    #character vector
log_vec <- c(TRUE, FALSE, TRUE)               #logical vector

---------------------------------------------------------------------------------------------------------------------------------
rep1 <- rep(5, 3)                         # 5 5 5
rep2 <- rep(1:3, times=2)                 # 1 2 3 1 2 3
rep3 <- rep(1:3, each=2)                  # 1 1 2 2 3 3

-----------------------------------------------------------------------------------------------------------------------------------
seq2 <- seq(0, 1, by=0.2)               # 0 0.2 0.4 0.6 0.8 1.0 step size is fixed
seq3 <- seq(1, 10, length.out=5)       # 1 3.25 5.5 7.75 10  no of elements is fixed spacing is calculated automatically

------------------------------------------------------------------------------------------------------------------------------------
#Accessing Vector Elements (Indexing) - IN R INDEXING STARTS FROM 1

a) By position

v <- c(10, 20, 30, 40)
v[1]                                  # 10
v[2:3]                               # 20 30
v[c(1,4)]                             # 10 40

b)Excluding elements

v[-2]                              # 10 30 40 (excludes 2nd element)

c)Logical indexing

v[v > 20]                        # 30 40
v[v %% 20 == 0]                  # 20 40

a <- c(1, 2)
b <- c(10, 20, 30, 40)
a + b                               # 11 22 31 42 (a recycled)

--------------------------------------------------------------------------------------------------------------------------------------
Useful vector functions:

Function 	        Description	Example
length()	         Number of elements                    	length(a) → 2
sum()             	Sum of elements	                      sum(c(1,2,3)) → 6
mean()	              Average	                             mean(c(1,2,3)) → 2
median()	            Median	                            median(c(1,5,3)) → 3
sd() 	             Standard deviation	                      sd(c(1,2,3))
var()	               Variance	                              var(c(1,2,3))
min()/max()	        Minimum / Maximum	                      min(a) / max(a)
sort()	           Sort elements ascending	                sort(c(3,1,2)) → 1 2 3
rev()	              Reverse elements	                      rev(c(1,2,3)) → 3 2 1
unique()	          Unique elements	                      unique(c(1,2,2,3)) → 1 2 3
which()       	Index of elements meeting a condition     	which(a > 1) → 2
any()	        TRUE if any element satisfies condition	    any(a > 2) → TRUE
all()	        TRUE if all elements satisfy condition	     all(a > 0) → TRUE

---------------------------------------------------------------------------------------------------------------------------------------------
scores <- c(90, 85, 88)
names(scores) <- c("Math", "Science", "English")
scores["Science"]                                           # 85

----------------------------------------------------------------------------------------------------------------------------------------------
Combining Vectors

v1 <- c(1,2,3)
v2 <- c(4,5)
v3 <- c(v1, v2)                          # 1 2 3 4 5

----------------------------------------------------------------------------------------------------------------------------------------------
Type coercion - Vectors can only hold one data type. If you mix types, R will convert everything to the most flexible type
(character > numeric > logical).

mix <- c(1, "hello", TRUE)
mix                               ## "1" "hello" "TRUE"

-------------------------------------------------------------------------------------------------------------------------------------------------
NA handling-Missing values (NA) can exist inside vectors. Some functions need special handling.

v <- c(1, 2, NA, 4)
mean(v)                       # NA
mean(v, na.rm=TRUE)           # 2.333...

-------------------------------------------------------------------------------------------------------------------------------------------------
**Membership operator %in% - Check if elements exist in a vector.

fruits <- c("apple", "banana", "cherry")
"apple" %in% fruits                             # TRUE
"mango" %in% fruits                             # FALSE

---------------------------------------------------------------------------------------------------------------------------------------------------
** Replacing one value 
fruits <- c("banana","apple","orange")"
fruits[1] <-"pear"		                              “pear” “apple” “orange”
fruits

**Vectorized conditional replacement - replace elements in vectors based on conditions.

v <- c(10, 20, 30, 40)
v[v > 25] <- 100                   ## 10 20 100 100
v

---------------------------------------------------------------------------------------------------------------------------------------------------
**Logical vectors directly as TRUE/FALSE - Since logicals act as numbers (TRUE=1, FALSE=0), you can use them in math

x <- c(TRUE, FALSE, TRUE, TRUE)
sum(x)                                 # 3 (counts TRUEs)
mean(x)                                # 0.75 (proportion TRUE)

---------------------------------------------------------------------------------------------------------------------------------------------------
**Sort() - To sort items in a vector alphabetically / numerically

fruits <- c("banana","apple","orange“)
numbers <- c(13,3,5,7)]
sort(fruits)                    	  #“apple” “banana” “orange”
sort(numbers)                       # 3 5 7 13

---------------------------------------------------------------------------------------------------------------------------------------------------

  numbers <- seq(from=0, to =100, by =20)
  numbers 	                              #	 0 20 40 60 80 100
  

