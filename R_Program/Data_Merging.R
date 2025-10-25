#DATA MERGING

*The merge function in R is a powerful tool that allows you to combine two or more datasets based on shared variables. 
*In R there are various ways to merge data frames, using the ‘merge()’ function from base R, using the ‘dplyr’ package, and the ‘data.table’ package. 


USING merge() from base R;

*The merge() function in base R helps us to combine two or more data frames based on common columns. 
*It performs various types of joins such as inner join, left join, right join, and full join

SYNTAX:merged_df<-merge(x,y,by = "common_column",..)
*x and y are the data frames that we want to merge.
*'by' specifies the common columnon which the merge will be performed.
*Additional arguments like 'all.x' , 'all.y' and 'all' control the type of join that is to be performed.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
example : 
  
df1<- data.frame(
  ID = c(1, 2, 3, 4),
  Name = c("A", "B", "C", "D"),
  Age = c(25, 30, 35, 40)
)

df2 <- data.frame(
      ID = c(2, 3, 4, 5),
      Occupation = c("Engineer", "Teacher", "Doctor", "Lawyer"),
      Salary = c(5000, 4000, 6000, 7000)
)
df1
df2

#1.Inner join(default behaviour)

inner_join<-merge(df1,df2,by="ID")
print(inner_join)

#The resulting ‘inner_join’ dataframe will only include the common rows where ‘ID’is present in both ‘df1’ and ‘df2’.


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
example : 
  
  df1<- data.frame(
    ID = c(1, 2, 3, 4),
    Name = c("A", "B", "C", "D"),
    Age = c(25, 30, 35, 40)
  )

df2 <- data.frame(
  ID = c(2, 3, 4, 5),
  Occupation = c("Engineer", "Teacher", "Doctor", "Lawyer"),
  Salary = c(5000, 4000, 6000, 7000)
)
df1
df2

#2.Left join(all.x=TRUE):

left_join<-merge(df1,df2,by="ID",all.x=TRUE)
print(left_join)

#The resulting ‘left_join’ data frame will include all rows from ‘df1’ and the matching rows from ‘df2’. Non-matching rows from ‘df2’ will have an ‘NA’ value

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  
df1<- data.frame(
    ID = c(1, 2, 3, 4),
    Name = c("A", "B", "C", "D"),
    Age = c(25, 30, 35, 40)
  )

df2 <- data.frame(
  ID = c(2, 3, 4, 5),
  Occupation = c("Engineer", "Teacher", "Doctor", "Lawyer"),
  Salary = c(5000, 4000, 6000, 7000)
)
df1
df2


#3.Right join(all.y=TRUE):

join<-merge(df1,df2,by="ID",all.y=TRUE)
print(join)

#The resulting ‘right_join’ data frame will include all rows from ‘df2’ and the matching rows from ‘df1’. Non-matching rows from ‘df1’ will have ‘NA’ values.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
df1<- data.frame(
    ID = c(1, 2, 3, 4),
    Name = c("A", "B", "C", "D"),
    Age = c(25, 30, 35, 40)
  )

df2 <- data.frame(
  ID = c(2, 3, 4, 5),
  Occupation = c("Engineer", "Teacher", "Doctor", "Lawyer"),
  Salary = c(5000, 4000, 6000, 7000)
)
df1
df2

#4.Full outer join(all=TRUE):

join<-merge(df1,df2,by="ID",all=TRUE)
print(join) 

#The resulting ‘full_join’ data frame will include all rows from both ‘df1’ and ‘df2’.Non-matching values will have ‘NA’ values.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
df1<- data.frame(
    ID = c(1, 2, 3, 4),
    Name = c("A", "B", "C", "D"),
    Age = c(25, 30, 35, 40)
  )

df2 <- data.frame(
  ID = c(2, 3, 4, 5),
  Occupation = c("Engineer", "Teacher", "Doctor", "Lawyer"),
  Salary = c(5000, 4000, 6000, 7000)
)
df1
df2

#5.Cross join(by=NULL):

join<-merge(df1,df2,by=NULL)
print(join) 

#A Cross Join also known as cartesian join results in every row of one data frame is being joined to every other row of another data frame.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Using dplyr package:
  The primary function for merging in ‘dplyr’ is ‘join()’, which supports various types of joins.

Syntax : 
  merged_df<- join(x,y,by="common_column",type="type_of_join")

  *‘x’ and ‘y’ are the data frames to be merged.
  *‘by’ specifies the common columns on which the merge is to be performed
  *‘type_of_join’ can be ‘inner’, ‘left’,’ right’ or ‘full’ to specify the type of join.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
df1 <- data.frame(
         ID = c(1, 2, 3, 4),
          Name = c("A", "B", "C", "D"),
         Age = c(25, 30, 35, 40)
     )

df2 <- data.frame(
         ID = c(2, 3, 4, 5),
         Occupation = c("Engineer", "Teacher", "Doctor", "Lawyer"),
         Salary = c(5000, 4000, 6000, 7000)
         )

#inner join:
inner_join <- dplyr::inner_join(df1, df2, by = "ID")
print(inner_join)


#Left join:
left_join <- dplyr::left_join(df1, df2, by = "ID")
print(left_join)

#Right join
right_join <- dplyr::right_join(df1, df2, by = "ID")
print(right_join)


#Full outer join
left_join <- dplyr::full_join(df1, df2, by = "ID")
print(full_join)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
patients <- data.frame(
  PatientID = c(1, 2, 3, 4, 5, 6),
  Name = c("Rahul", "Sneha", "Arjun", "Priya", "Kiran", "Diya"),
  Age = c(25, 30, 28, 40, 35, 50),
  Gender = c("Male", "Female", "Male", "Female", "Male", "Female"),
  Disease = c("Flu", "Cancer", "Diabetes", "Flu", "Cancer", "Asthma"),
  AdmissionDate = as.Date(c("2025-01-05", "2025-01-10", "2025-01-12", 
                            "2025-01-15", "2025-01-18", "2025-01-20"))
)

print("Patients Data Frame:")
print(patients)


# ------------------ Create Second Data Frame: treatments ------------------
treatments <- data.frame(
  PatientID = c(1, 2, 3, 5, 7),
  TreatmentType = c("Medication", "Chemotherapy", "Insulin", "Surgery", "Therapy"),
  Doctor = c("Dr. Rao", "Dr. Mehta", "Dr. Khan", "Dr. Iyer", "Dr. Patel"),
  Cost = c(500, 8000, 1500, 12000, 2000)
)

print("Treatments Data Frame:")
print(treatments)


# ------------------ Perform Inner Join ------------------
library(dplyr)

inner_join_df <- inner_join(patients, treatments, by = "PatientID")
print("Inner Join: Patients who received treatment")
print(inner_join_df)


# ------------------ Perform Left Join ------------------
left_join_df <- left_join(patients, treatments, by = "PatientID")
print("Left Join: All patients (including those without treatment)")
print(left_join_df)


# ------------------ Perform Right Join ------------------
right_join_df <- right_join(patients, treatments, by = "PatientID")
print("Right Join: All treatments (including missing patient details)")
print(right_join_df)


# ------------------ Perform Full Join ------------------
full_join_df <- full_join(patients, treatments, by = "PatientID")
print("Full Join: Combine all records from both tables")
print(full_join_df)


# ------------------ Filter: Treatment cost > 5000 ------------------
high_cost <- filter(full_join_df, Cost > 5000)
print("Patients with Treatment Cost > $5000")
print(high_cost)


# ------------------ Group by Disease and Calculate Total Cost ------------------
total_cost_per_disease <- full_join_df %>%
  group_by(Disease) %>%
  summarise(Total_Treatment_Cost = sum(Cost, na.rm = TRUE))

print("Total Treatment Cost per Disease:")
print(total_cost_per_disease)

  