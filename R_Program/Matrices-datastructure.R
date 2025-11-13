#MATRICES-A matrix is a 2-dimensional collection of elements of the same type (numeric, character, or logical).

mat <- matrix(1:6, nrow=2, ncol=3)
mat
                                #      [,1] [,2] [,3]
                                # [1,]    1    3    5
                                # [2,]    2    4    6
---------------------------------------------------------------------------------------------------------------------------------
Creating Matrices

a) Using matrix()

mat1 <- matrix(1:9, nrow=3, ncol=3)


b) By row vs by column - Default fills column-wise,Use byrow=TRUE to fill row-wise

mat2 <- matrix(1:6, nrow=2, ncol=3, byrow=TRUE)
mat2
                                                 #        [,1] [,2] [,3]
                                                 # [1,]    1    2    3
                                                 # [2,]    4    5    6

c) Using rbind() / cbind()-Combine vectors into matrix

v1 <- c(1,2,3)
v2 <- c(4,5,6)
mat3 <- rbind(v1, v2)                          # rows = v1 & v2
mat4 <- cbind(v1, v2)                          # columns = v1 & v2
print(mat3)
print(mat4)
------------------------------------------------------------------------------------------------------------------------------------
**Accessing Matrix Elements

a) By row and column indices

mat <- matrix(1:9, nrow=3)
mat[1,2]                                           # row 1, col 2 → 4
mat[2,]                                            # row 2 → 2 5 8
mat[,3]                                            # column 3 → 3 6 9

b) Logical indexing

mat[mat > 5]                                     # 6 7 8 9

------------------------------------------------------------------------------------------------------------------------------------
  Modifying Matrices

a) Changing elements

mat[1,1] <- 100

b) Adding rows/columns

new_row <- c(10,11,12)
mat <- rbind(mat, new_row)                             # adds as new row

new_col <- c(20,21,22,23)
mat <- cbind(mat, new_col)                              # adds as new column


c) Removing rows/columns

mat <- mat[-1, ]                                       # remove first row
mat <- mat[ , -2]                                      # remove second column

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
| Operation           | Description                       | Example                 |
  | ------------------- | --------------------------------- | ----------------------- |
  | `+` / `-`           | Element-wise addition/subtraction | mat1 + mat2             |
  | `*`                 | Element-wise multiplication       | mat1 * mat2             |
  | `%*%`               | Matrix multiplication             | mat1 %*% mat2           |
  | `t()`               | Transpose                         | t(mat1)                 |
  | `diag()`            | Diagonal elements                 | diag(mat1)              |
  | `rowSums()`         | Sum of each row                   | rowSums(mat1)           |
  | `colSums()`         | Sum of each column                | colSums(mat1)           |
  | `rowMeans()`        | Mean of each row                  | rowMeans(mat1)          |
  | `colMeans()`        | Mean of each column               | colMeans(mat1)          |
  | `dim()`             | Dimensions (rows, columns)        | dim(mat1)               |
  | `nrow()` / `ncol()` | Number of rows / columns          | nrow(mat1) / ncol(mat1) |
  
------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
**Naming Rows and Columns

rownames(mat) <- c("R1","R2","R3")
colnames(mat) <- c("C1","C2","C3")
mat
mat["R2","C3"]                                   # access element by name

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
**Converting Between Vectors and Matrices

a) Vector → Matrix

v <- 1:6
mat <- matrix(v, nrow=2, byrow=TRUE)


b) Matrix → Vector

v2 <- as.vector(mat)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
a) All elements must be same type-Mixing types will coerce to a common type (like vectors)

mat <- matrix(c(1,"a",TRUE), nrow=1)
                                                    # All become character


b) Matrices are vectors with a dim attribute

mat <- matrix(1:6,2,3)
is.vector(mat)                                   # FALSE
length(mat)                                      # 6 elements
dim(mat)                                         # 2 3


c) Subsetting returns matrix if drop=FALSE

mat[1, , drop=FALSE]                              # keeps as matrix


d) Logical indexing works across the matrix

mat[mat > 3]                                          # returns 4 5 6

-------------------------------------------------------------------------------------------------------------------------------------------------
