#Data cleaning and summarizing with dplyr package

"
*dplyr is a powerful R-package to transform and summarize tabular data with rows and columns
*The package contains a set of functions (or “verbs”) that perform common data manipulation operations such as filtering for rows, selecting specific columns, re-ordering rows, adding new columns and summarizing data.
*In addition, dplyr contains a useful function to perform another common task which is the “split-apply-combine” concept.


The below are some of the most common dplyr functions:
rename()		: rename columns.
recode()		: recode values in a column
select()		: subset columns
filter()		: subset rows on conditions
mutate()		: create new columns by using information from other columns
summarise()	: create summary statistics on grouped data
arrange()		: sort results
count()		: count discrete values
group_by()	: allows for group operations in the “split-apply-combine” concept

Note: %>%: the “pipe” operator is used to connect multiple verb actions together into a pipeline

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*rename(): It is often necessary to rename variables to make them more meaningful.

library(dplyr)
Data <- data.frame (
    Training = c("Strength","Stamina","Other"),
    Pulse = c(100, 150, 120),
    Duration = c(60, 30, 45)
  )

Data
dplyr::rename(Data,PULSE1=Pulse,DURATION1=Duration)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*select(): The select() function is used to pick specific variables or features of a DataFrame or tibble. 
It selects columns based on provided conditions like contains, matches, starts with, ends with, and so on.
This function returns an object of the same type as data.

Syntax: select(data,col1,col2,…) 



library(dplyr)
Data <- data.frame (
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45)
)

dplyr::select(Data,Training)
dplyr::select(Data,Pulse,Training)

*Select column list either by name or index number

Data <- data.frame (
    Training = c("Strength", "Stamina", "Other"),
    Pulse = c(100, 150, 120),
    Duration = c(60, 30, 45)
    )

dplyr::select(Data,1,3)
dplyr::select(Data,1:3)

#Some additional options to select columns based on a specific criteria include
      ends_with() = Select columns that end with a character string
      contains() = Select columns that contain a character string
      matches() = Select columns that match a regular expression
      one_of() = Select columns names that are from a group of names
Example:
  select(Data, starts_with(“Mo"))

d <- data.frame(   
    name=c("Abhi", "Bhavesh","Chaman", "Dimri"),
		age=c(7, 5, 9, 16),
		ht=c(46, NA, NA, 69),
		school=c("yes", "yes", "no", "no")
		)

select(d, starts_with("sc"))           # startswith() function to print only ht data

select(d, -starts_with("ht"))          # -startswith() function to print everything except ht data

select(d, 2: 4)                       # Printing column 2 to 4

select(d, contains("a"))              # Printing data of column heading containing 'a'
 
select(d, matches("na"))             # Printing data of column heading which matches 'na'

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#filter():

*The filter() function is used to produce a subset of the data frame, retaining all rows that satisfy the specified conditions. 
*The filter() method in R programming language can be applied to both grouped and ungrouped data. 
*The expressions include comparison operators (==, >, >= ) , logical operators (&, |, !, xor()) , range operators (between(), near()) as well as NA value check against the column values. 

Syntax: filter(df , condition)
df:The data frame object
condition:filtering based upon this condition

library(dplyr)
df=data.frame(
       x=c(12,31,4,66,78),
       y=c(22.1,44.5,6.1,43.1,99),
       z=c(TRUE,TRUE,FALSE,TRUE,TRUE)
    )
df
dplyr::filter(df, x<50 & z==TRUE)

d <- data.frame(name = c("Abhi", "Bhavesh", "Chaman", "Dimri"),
		  age = c(7, 5, 9, 16),
		  ht = c(46, NA, NA, 69),
		  school = c("yes", "no", "yes", "no"))
print(d)

rows_with_na <- d %>% filter(is.na(ht))     #is.na(ht) checks which rows have NA in the column ht.filter() keeps only those rows.%>% means “take d and pass it into filter()”.
print(rows_with_na)


rows_without_na <- d %>% filter(!is.na(ht))     # !is.na(ht) means “not NA” → only keeps rows where height is present. So it filters out rows that have NA in ht.
print(rows_without_na)

d %>% filter(age == 9, school == "yes")


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
mutate(): mutate() function in R Programming Language is used to add new variables in a data frame which are formed by performing operations on existing variables.
       
       Syntax: mutate(x, expr)
       
In R there are five types of main function for mutate that are discribe as below. we will use dplyr package in R for all mutate functions.
mutate() 
transmute() 
mutate_all() - to apply a transformation to all variables in a data frame simultaneously.
mutate_at() 
mutate_if() - to apply a transformation to variables in a data frame based on a specific condition.


library(dplyr) 

data <- data.frame( 
name = c("Abhi", "Bhavesh", "Chaman", "Dimri"), 
  age = c(7, 5, 9, 16), 
  ht = c(46, NA, NA, 69), 
 school = c("yes", "yes", "no", "no")
   ) 
   
data
dplyr::mutate(d, x3 = ht + age)

transmute() Example: 

# Use transmute to create a new variable 'age_in_months' and drop the 'age' variable

data <- data.frame( 
    name = c("Abhi", "Bhavesh", "Chaman", "Dimri"), 
    age = c(7, 5, 9, 16), 
    ht = c(46, NA, NA, 69), 
    school = c("yes", "yes", "no", "no")
  ) 

result <- transmute(data,
    name = name,
	  age_in_months = age * 12,
    ht,
   school)   
print(result)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

summarise_all(): 
The summarise_all method in R is used to affect every column of the data frame. 
The output data frame returns all the columns of the data frame where the specified function is applied over every column.

Syntax: summarise_all(data, function) 
data – The data frame to summarise the columns of
function – The function to apply on all the data frame columns.


df <- data.frame(col1=c(1:10),col2=c(11:20)) 
print("original dataframe") 

print(df) 

print("summarised dataframe") 

dplyr::summarise_all(df, mean)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
arrange(): 
        arrange() function in R Language is used for reordering of table rows with the help of column names as expression passed to the function.
       
       Syntax: arrange(x, expr) 
           x: data set to be reordered 
          expr: logical expression with column name


d <- data.frame( 
  name = c("Abhi", "Bhavesh", "Chaman", "Dimri"),   
  age = c(7, 5, 9, 16) 
  rollno = c(23,45,67,32))  

d2<- dplyr::arrange(d, age)  
print(d2)



#To arrange in a descending order:
arrange(d, desc(age))

#To arrange in order using col1 and then by col2:
arrange(d, age,rollno)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Group_by(): 
Group_by() function belongs to the dplyr package in the R programming language, which groups the data frames. 
Group_by() function alone will not give any output. It should be followed by summarise() function with an appropriate action to perform. It works similar to GROUP BY in SQL and pivot table in excel.


	
library(dplyr)

df = read.csv("Sample_Superstore.csv")
df_grp_region = df %>% group_by(Region) %>%
summarise(total_sales = sum(Sales), 
total_profits = sum(Profit),.groups = 'drop')



data <- data.frame(
    Department = c("HR", "IT", "IT", "HR", "Finance"),
    Salary = c(50000, 70000, 75000, 55000, 60000))
    grouped_summary <- data %>%
     group_by(Department) %>%
     summarize(Avg_Salary = mean(Salary), Count = n()
      )
     print(grouped_summary)                             
 
#Consider the previous example dataframe, find the average salary for each department, but only for employees earning more than $55,000, and sort results in descending order
  
result <- data %>%
   filter(Salary > 55000) %>%
   group_by(Department) %>%
   summarize(Avg_Salary = mean(Salary)) %>%
    arrange(desc(Avg_Salary))
     
print(result)
     
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
  library(dplyr)
library(writexl)

# Step 1: Create the employee dataset
employee_data <- data.frame(
  Employee_ID = c("E001", "E002", "E003", "E004", "E005"),
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Department = c("IT", "HR", "IT", "Sales", "HR"),
  Salary = c(7000, 5000, 8000, 6000, 5500),
  Experience = c(6, 4, 8, 5, 3)
)

# Step 2–5: Process the data
filtered_employees <- employee_data %>%
  filter(Experience >= 5) %>%                         # Filter employees with at least 5 years of experience
  mutate(Annual_Salary = Salary * 12) %>%             # Create new Annual_Salary column
  group_by(Department) %>%                            # Group by Department
  summarize(Average_Annual_Salary = mean(Annual_Salary)) %>%  # Calculate average annual salary
  arrange(desc(Average_Annual_Salary))                # Sort departments in descending order

# Step 6: Save the processed data
write_xlsx(filtered_employees, "filtered_employee_data.xlsx")

# Step 7: Print results
cat("Original Employee Data:\n")
print(employee_data)
cat("\nFiltered and Processed Data:\n")
print(filtered_employees)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
#Create the following sales dataset (employee_data.xlsx)
  
  # Dataset:
  # Employee_ID | Name     | Department | Salary | Experience
  # ----------------------------------------------------------
# E001         | Alice    | IT         | 7000   | 6
# E002         | Bob      | HR         | 5000   | 4
# E003         | Charlie  | IT         | 8000   | 8
# E004         | David    | Sales      | 6000   | 5
# E005         | Eva      | HR         | 5500   | 3

# ------------------------------------------------------------
# i)   Import the dataset (employee_data.xlsx) into R.
# ii)  Filter employees with at least 5 years of experience.
# iii) Create a new column named "Annual_Salary" by multiplying Salary by 12.
# iv)  Group by Department and calculate the average annual salary.
# v)   Arrange the departments in descending order of average annual salary.
# vi)  Save the final processed dataset as filtered_employee_data.xlsx
# ------------------------------------------------------------

# Load required libraries
library(dplyr)
library(writexl)

# Step 1: Create the dataset manually (as per the question)
employee_data <- data.frame(
  Employee_ID = c("E001", "E002", "E003", "E004", "E005"),
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Department = c("IT", "HR", "IT", "Sales", "HR"),
  Salary = c(7000, 5000, 8000, 6000, 5500),
  Experience = c(6, 4, 8, 5, 3)
)

# Step 2–5: Filter, compute, group, and sort
filtered_employees <- employee_data %>%
  filter(Experience >= 5) %>%                         # Employees with >= 5 years
  mutate(Annual_Salary = Salary * 12) %>%             # Annual Salary column
  group_by(Department) %>%                            # Group by Department
  summarize(Average_Annual_Salary = mean(Annual_Salary)) %>%  # Average per dept
  arrange(desc(Average_Annual_Salary))                # Descending order

# Step 6: Save final processed data
write_xlsx(filtered_employees, "filtered_employee_data.xlsx")

# ------------------------------------------------------------
# Answers / Output
# ------------------------------------------------------------

cat("Original Employee Data:\n")
print(employee_data)

cat("\nFiltered & Processed Data (Answer):\n")
print(filtered_employees)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    