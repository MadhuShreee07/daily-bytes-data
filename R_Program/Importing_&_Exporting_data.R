#IMPORTING DATA IN R SCRIPT

"
*We can read external datasets and operate with them in our R environment by importing data into an R script. 
*First, let’s consider a data set that we can use for the demonstration. For this demonstration, we will use two examples of a single dataset, one in .csv form and another .txt  "
 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
**Reading a Comma-Separated Value(CSV) File:

#Method 1: Using read.csv() Function Read CSV Files into R

      Syntax: read.csv(file.choose(), header)

The function read.csv() has two parameters:
        file.choose(): It opens a menu to choose a CSV file from the desktop.
        header: It is to indicate whether the first row of the dataset is a variable name or not. Apply T/True if the variable name is present else put F/False.


data1 <- read.csv(file.choose(), header=T)
data1     


#Method 2: Using read.table() Function

      Syntax: read.table(file.choose(), header, sep=“ , ”)
      
This function specifies how the dataset is separated, in this case we take sep=”, “ as an argument. 


data2 <- read.table(file.choose(), header=T, sep=“,”)      # import and store the dataset in data2
data2                                                       #display the data

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
**Reading a Tab-Delimited(txt) File in R Programming Language:
  
#Method 1: Using read.delim() Function

      Syntax: read.delim(file.choose(), header)

The function has read.delim() two parameters:
    file.choose(): It opens a menu to choose a CSV file from the desktop.
   header: It is to indicate whether the first row of the dataset is a variable name or not. Apply T/True if the variable name is present else put F/False.

data3 <- read.delim(file.choose(), header=T)               # import and store the dataset in data3
data3                                                     #display the data


#Method 2: Using read.table() Function

       Syntax: read. table(file.choose(), header, sep=“ \t ”)

This function specifies how the dataset is separated, in this case we take sep=”\t“ as an argument.


data4 <- read.table(file.choose(), header=T, sep=“\t”)               # import and store the dataset in data2
data4                                                                      # display the data

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  **Reading a excel File in R Programming Language:
  
#Method 1: Using read_excel() from readxl

read_excel() function is basically used to import/read an Excel file and it can only be accessed after importing the readxl library in R language.

         Syntax: read_excel(path)
         
The read_excel() method extracts the data from the Excel file and returns it as an R data frame.

library(readxl)
Data_gfg <- read_excel("Data_gfg.xlsx") 
Data_gfg


#Method 2: Using read.xlsx() from xlsx

read.xlsx() function is imported from the xlsx library of R language and used to read/import an excel file in R language.
    
          Syntax: read.xlsx(path)
          
The read_excel() method extracts the data from the Excel file and returns it as an R data frame.

Data_gfg <-read.xlsx('Data_gfg.xlsx’)
Data_gfg

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Here we are going to import data through R studio with the following steps:

1.From the Environment tab click on the Import Dataset Menu
2. Select the file extension from the option.
3. In the third step, a pop-up box will appear, either enter the file name or browse the desktop.
4. The selected file will be displayed on a new window with its dimensions.
5. In order to see the output on the console, type the filename.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#EXPORTING DATA FROM R SCRIPTS

*When a program is terminated, the entire data is lost. 
*Storing in a file will preserve one’s data even if the program terminates. 
*If one has to enter a large number of data, it will take a lot of time to enter them all. However, if one has a file containing all the data, he/she can easily access the contents of the file using a few commands in R.

Exporting data to a text file:
One of the important formats to store a file is in a text file. R provides various methods that one can export data to a text file.

write.table():
*The R base function write.table() can be used to export a data frame or a matrix to a text file.
*In This section of R studio we get the data saved as the name that we gave in the code. and when we select that files we get this type of output.	

      Syntax: write.table(x, file,sep = ” “, dec = “.”, row.names = TRUE, col.names = TRUE)
 
Parameters: 
x: a matrix or a data frame to be written. 
file: a character specifying the name of the result file. 
sep: the field separator string, e.g., sep = “\t” (for tab-separated value). 
dec: the string to be used as decimal separator. Default is “.” 
row.names: either a logical value indicating whether the row names of x are to be written along with x, or a character vector of row names to be written. 
col.names: either a logical value indicating whether the column names of x are to be written along with x, or a character vector of column names to be written.

# R program to illustrate Exporting data from R

df = data.frame( "Name" = c("Amiya", "Raj", "Asish"), 
		          "Language" = c("R", "Python", "Java"),                # Creating a dataframe 
                              "Age" = c(22, 25, 45)) 
write.table(df, 	file = "myDataFrame.txt",
            		sep = "\t",
            		row.names = TRUE,                                 # Export a data frame to a text file using write.table()
            		col.names = NA)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
write_tsv():

*This write_tsv() method is also used for to export data to a tab separated (“\t”) values by using the help of readr package.
         
         Syntax: write_tsv(file, path)

Parameters: 
     file: a data frame to be written 
      path: the path to the result file
      
      
Example:

# R program to illustrate Exporting data from R


library(readr)                                                    # Importing readr library
df = data.frame( "Name" = c("Amiya", "Raj", "Asish"),                 # Creating a dataframe 
		"Language" = c("R", "Python", "Java"), 
		"Age" = c(22, 25, 45) ) 
write_tsv(df, path = "MyDataFrame.txt")                              # Export a data frame using write_tsv() 
  
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
write.csv():
This write.csv() method is recommendable for exporting data to a csv file. It uses “.” for the decimal point and a comma (“, ”) for the separator. 
 
      Syntax: write.csv(file, path)
      
Parameters: 
      file: a data frame to be written 
      path: the path to the result file
      

library(readr)                                                     # Importing readr library
df = data.frame( "Name" = c("Amiya", "Raj", "Asish"),              # Creating a dataframe 
		"Language" = c("R", "Python", "Java"),   
		"Age" = c(22, 25, 45) ) 
write.csv(df, path = "My_Data.csv")                                # Export a data frame using write.csv()


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

write.csv2():

This method is much similar as write.csv() but it uses a comma (“, ”) for the decimal point and a semicolon (“;”) for the separator.

           Syntax: write.csv2(file, path)
           
Parameters: 
          file: a data frame to be written 
          path: the path to the result file


library(readr)
df = data.frame( "Name" = c("Amiya", "Raj", "Asish"), 
		"Language" = c("R", "Python", "Java"), 
		"Age" = c(22, 25, 45) ) 
write.csv2(df, file = "My_Data.csv")


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------












