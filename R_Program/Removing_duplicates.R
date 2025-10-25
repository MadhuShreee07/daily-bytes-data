#Find and remove duplicate record.

Data Duplicacy:
  Entries that have been added by a system user multiple times
for example, re registering because you have forgotten your details, It is one of the problem which causes inconsistency in databases.

Data Redundancy:
Same of data is stored at multiple locations or tables.
Data redundancy is costly to address as it requires 
       additional storage, synchronization between databases.
       design work to align the information represented by different presentation of the same data.
       
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Identifying Duplicate Data in vector:
         
We can use duplicated() function to find out how many duplicates value are present in a vector.
       SYNTAX:duplicated(vector_name)
             The R function duplicated() returns a logical vector where TRUE specifies which elements of a vector or data frame are duplicates.

vector1<-c(1,2,3,4,4,5)
duplicated(vector1)             #Identifies duplicate elements   - OP:FALSE FALSE FALSE FALSE  TRUE FALSE
sum(duplicated(vector1))        #count of duplicated data

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Removing Duplicate Data in vector:
  
We can remove duplicate data from vectors by using unique() functions so it will give only unique values.
     SYNTAX:unique(vector_name)
     
vector1<-c(1,2,3,4,4,5)
unique(vector1)               #Removes duplicate elements OP:1 2 3 4 5

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Identifying Duplicate Data in data frame:
  
For identification we will use the duplicated() function.
  SYNTAX:duplicated(dataframe)
  
Approach:  
  *create a data frame.
  *pass it to duplicated() function.
  *This function returns the rows which are duplicated in form of boolean values.
  *Apply the sum() function to get the number of duplicates.


student_result=data.frame(
  name=c("Ram","Geeta","John","Paul","Cassie","Geeta","Paul"),
  maths=c(7,8,8,9,10,8,9),
  science=c(5,7,6,8,9,7,8),
  history=c(7,7,7,7,7,7,7)
)
student_result
duplicated(student_result)
sum(duplicated(student_result))


data=data.frame(
  names=c("manoj","bobby","sravan", "deepu","manoj","bobby") ,
  id=c(1,2,3,1,1,2), 
  subject=c("java","python","php","html","java","python")
)

data
data[!duplicated(data$subject),]        #Removes duplicate rows in subject column
print(data[!duplicated(data$names),])            #Remove duplicate rows in names column
print(data[!duplicated(data$id),])               #Remove duplicate rows in id column
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Removing Duplicate Data in data frame.

we use unique() and distinct() function.

Approach:
  *create data.frame.
  *select rows which are unique.
  *Retrieve those rows
  *Display result.

METHOD1:Using unique.
   We use unique() to get rows having unique values in our data.
         Syntax: unique(dataframe)

         
student=data.frame(
     name=c("Ram","Geeta","John","Paul","Cassie","Geeta","Paul"),
      maths=c(7,8,8,9,10,8,9),
      science=c(5,7,6,8,9,7,8),
      history=c(7,7,7,7,7,7,7)
)

student
unique(student)


METHOD2:Using distinct()
      This method is available in dplyr package which is used to get the unique rows from the dataframe. 
      We can remove rows from the entire which are duplicates and also we can remove duplicate rows in a particular column.
      
      SYNTAX:distinct(dataframe.keepall)
  *dataframe-data in use
  *keepall - decides which variable to keep.

library(dplyr)
data=data.frame(
  names=c("manoj","bobby","sravan","deepu","manoj","bobby"),
  id=c(1,2,3,4,1,2), 
  subjects=c("java","python","php","html","java","python") 
  
)

print(dplyr::distinct(data))              #Remove all duplicate rows
print(dplyr::distinct(data,subjects))    # remove  duplicate rows in subjects column
print(dplyr::distinct(data,names))        #remove  duplicate rows in namescolumn


student=data.frame(
    name=c("Ram","Geeta","John","Paul", "Cassie","Geeta","Paul"),
    maths=c(7,8,8,9,10,8,9),
     science=c(5,7,6,8,9,7,8),
     history=c(7,7,7,7,7,7,7))

student_result 
dplyr::distinct(student_result,maths,.keep_all = TRUE)

#distinct() removes duplicate rows based on the columns you specify.
    If you give it one column (here maths), it will keep only the first occurrence of each unique value in that column.

keep_all = FALSE (default): returns only the distinct column(s) you listed.
    keep_all = TRUE: keeps all other columns as well, but still removes duplicates based on the chosen column(s).
    
