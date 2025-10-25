#DATA SORTING

Data-analysts, and Data scientists use order(), sort() and packages like dplyr to sort data depending upon the structure of the obtained data.
The function Order() can sort Vector, Matrix and alsO a Dataframe can be sorted in ascending and descending order.

SYNTAX:
         order(x, [decreasing = TRUE or FALSE], [na.last = TRUE or FLASE], [method = c("auto", "shell", "quick", "radix")])

*Here x - It is the vector or dataframe to be sorted.
*Decreasing - It is logical value that determines whether the sorting should be decreasing order(TRUE) or increasing order (FALSE)
*na.last- It is also a logical value that determines whether missings values should be placed at the end of the sorted vector(TRUE) or at the beginning(FALSE)
*method - It is an optional argument that specifes the sorting algorithm to be used.
The available options are auto(default),shell,quick,and radix
The AUTO algorithm automatically selects the best algorithm based on the size and type of input data.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
y=c(5,12,6,7,2,9,5)
order(y)               #OP:5  1  7 3  4  6   2 - the smallest value is at index 5 , the smallest is at index 1,and so on....


y=c(4,12,6,7,2,9,5,NA)         #OP:2 4 5 6 7 9 12 NA - sorted values
y[order(y)]                     

The "order" function returns the indices of the sorted values, so when we use these indices to subset "y" with square brackets, 
we get the sorted values of "y".

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
x<-c(8,2,4,1,-4,NA,46,8,9,5,3)
order(x,na.last=TRUE)                 # 5  4  2 11  3 10  1  8  9  7  6         
x[order(x)]                           #-4  1  2  3  4  5  8  8  9 46 NA          

The "na.last = TRUE" argument specifies that missing values (NA) should be placed at the end of the sorted vector. 

x <- c(8,2,4,1,-4,NA,46,8,9,5,3) 
order(x,na.last=FALSE)                  # 6  5  4  2 11  3 10  1  8  9  7
x[order(x, na.last = FALSE)]            #NA -4  1  2  3  4  5  8  8  9 46


The "na.last = FALSE" argument specifies that missing values (NA) should be placed at the end of the sorted vector. 

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
x <- c(8,2,4,1,-4,NA,46,8,9,5,3) 
order(x,decreasing=TRUE,na.last=TRUE)         # 7  9  1  8 10  3 11  2  4  5  6
x[order(x,decreasing=TRUE,na.last=TRUE)]      #46  9  8  8  5  4  3  2  1 -4 NA


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
#In R DataFrame is a two-dimensional tabular data structure that consists of rows and columns. 
#Sorting a DataFrame allows us to reorder the rows based on the values in one or more columns.
#Methods to sort a dataframe:
    *order() function (increasing and decreasing order)
    *arrange() function from dplyr package
    *setorder() function from data.table package

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
##USING ORDER FUNCTION:
*This function is used to sort the dataframe based on the particular column in the dataframe

Syntax:order(dataframe$column_name,decreasing=TRUE)

*dataframe is the input dataframe.
*column name is the column in the dataframe such that dataframe is sorted based on the column.
*Decreasing parameter specifies the type of sorting order.If it is TRUE dataframe is sorted in descending order otherwise,in increasing order.
*return type:Index positions of the elements.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Example:R program to create a dataframe with 2 columns and order based on particular columns in decreasing order. Displayed the Sorted dataframe based on subjects in decreasing order, 
displayed the Sorted dataframe based on roll no in decreasing order.

data=data.frame(
   rollno=c(1,5,4,2,3),
   subjects=c("java","python","php","sql","c")
)
 
print(data)                                                     #prints 1 java 5 python 2 php.....in a tabular column
print("sort the data in decreasing order based on rollno")
print(data[order(data$rollno,decreasing=TRUE),])               #print 5 python 4 php 3 c .....in a tab column

print(data)
print("sort the data in ascending order based on subjects")
print(data[order(data$subjects,decreasing=TRUE),])             #sorts based on alphabetical order.

print(data)
print("sort the data in decreasing order based on rollno")
print(data[order(data$rollno,decreasing=TRUE),])               # Prints 5 python 4 php 3 c 2 sql 1 java in a tab column

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Example 2: R program to create a dataframe with 3 columns named roll no, names, and subjects with a vector, displayed the Sorted dataframe based on subjects in increasing order,
displayed the Sorted dataframe based on roll no in increasing order, displayed the Sorted dataframe based on names in increasing order

data=data.frame(
  rollno=c(1,5,4,2,3),
  names=c("sravan", "bobby","pinkey", "rohith","ganesh"),
  subjects = c("java", "python","php", "sql", "c")
)

print(data)

print("sort the data in increasing order based on subjects")
print(data[order(data$subject),])

print("sort the data in increasing order based on rollno")
print(data[order(data$rollno),])

print("sort the data in increasing order based on names")
print(data[order(data$names),])

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


