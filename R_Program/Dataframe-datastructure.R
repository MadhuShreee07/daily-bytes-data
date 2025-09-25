#DATA FRAMES- A data frame is a 2-dimensional table like a spreadsheet.
#Each column can have different data types (numeric, character, factor, etc.), but all elements in a column must be the same type

df <- data.frame(
  Name = c("Alice","Bob","Charlie"),
  Age = c(25,30,22),
  Score = c(85,90,88)
)
df
-----------------------------------------------------------------------------------------------------------------------------------------------
Creating Data Frames

a) From vectors

names <- c("Alice","Bob","Charlie")
ages <- c(25,30,22)
scores <- c(85,90,88)
df <- data.frame(Name=names, Age=ages, Score=scores)


b) Using data.frame() with stringsAsFactors = FALSE-By default, character columns may be converted to factors (depends on R version).

df <- data.frame(Name=names, Age=ages, Score=scores, stringsAsFactors=FALSE)

-----------------------------------------------------------------------------------------------------------------------------------------------------
  Accessing Data Frame Elements

a) By column using $
  
df$Name                                                     # "Alice" "Bob" "Charlie"

b)By row and column indices

df[1,2]                                                   # 25 (row 1, column 2)
df[ ,1]                                                   # first column
df[2, ]                                                  # second row

c) By column name

df[ , "Score"]                                      # 85 90 88


d) Subset rows based on condition

df[df$Age > 25, ]                                # rows where Age > 25

-------------------------------------------------------------------------------------------------------------------------------------------------------
Modifying Data Frames

a) Add a new column

df$Passed <- c(TRUE, TRUE, TRUE)

b) Change an existing value

df$Score[1] <- 95

c) Remove a column

df$Passed <- NULL

d) Add a new row

new_row <- data.frame(Name="David", Age=28, Score=92)
df <- rbind(df, new_row)

-------------------------------------------------------------------------------------------------------------------------------------------------------
  | Function     | Description                        | Example      |
  | ------------ | ---------------------------------- | ------------ |
  | `str()`      | Structure of the data frame        | str(df)      |
  | `summary()`  | Summary statistics for each column | summary(df)  |
  | `head()`     | First 6 rows (default)             | head(df)     |
  | `tail()`     | Last 6 rows (default)              | tail(df)     |
  | `nrow()`     | Number of rows                     | nrow(df)     |
  | `ncol()`     | Number of columns                  | ncol(df)     |
  | `colnames()` | Column names                       | colnames(df) |
  | `rownames()` | Row names                          | rownames(df) |
  | `dim()`      | Dimensions (rows, columns)         | dim(df)      |

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------
  
**Filtering and Sorting

a) Filter rows

df[df$Score > 85, ]  # rows with Score > 85


b) Order rows by column

df[order(df$Age), ]   # ascending by Age
df[order(df$Score, decreasing=TRUE), ]  # descending Score

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
**Combining Data Frames

a) Row-wise (rbind)

df2 <- data.frame(Name="Eve", Age=24, Score=89)
df_combined <- rbind(df, df2)


b) Column-wise (cbind)

Extra <- data.frame(City=c("NY","LA","SF","Chicago"))
df_combined <- cbind(df_combined, Extra)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
**Converting Between Data Frames and Other Structures

a) List → Data Frame

lst <- list(Name=c("A","B"), Score=c(10,20))
df <- as.data.frame(lst)


b) Data Frame → Matrix

mat <- as.matrix(df[, c("Age","Score")])  # numeric columns only


c) Data Frame → Vector

vec <- unlist(df["Score"])

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
**Factors in Data Frames

df$Gender <- factor(c("Male","Male","Female","Male"))
levels(df$Gender)  # "Female" "Male"


#Useful for categorical variables in analysis.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Always check structure with str(df) to know column types.
#Use subset() for cleaner filtering:
#Missing values: NA can exist in data frames. Handle with na.omit() or is.na().
  
subset(df, Score > 85 & Age < 30)


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------