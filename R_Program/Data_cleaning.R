#DATA CLEANING
   Data Cleaning in R is the process to transform raw data into consistent data that can be easily analysed. 
   It is aimed at filtering the content of statistical statements based on the data as well as their reliability. 

#Purpose of Data Cleaning:
The following are the various purposes of data cleaning in R
   *Eliminate Errors                    *Delivery Accuracy
   *Eliminate Redundancy                *Ensure Consistency
   *Increase Data Reliability           *Assure Completeness
   *Standardize your approach

#For better understanding let us discuss with one example 
1)Creation of Example Data (Data Frame)
2)Modify Column Names
3)Format Missing Values
4)Remove Empty Rows & Columns
5)Remove Rows with Missing Values
6)Remove Duplicates
7)Modify Classes of Columns
8)Detect & Remove Outliers
9)Remove Spaces in Character Strings
   
--------------------------------------------------------------------------------------------------------------------------------------------------------------
1)Creation of Example Data: 
     
data <- data.frame(
       x1 = c(1:4, 99999, 1, NA, 1, 1, NA),   
       x1 = c(1:5, 1, "NA", 1, 1, "NA"),
       x1 = c(letters[c(1:3)], "x  x",  "x", "   y    y y", "x", "a", "a", NA),
       x4 = " ",
       x5 = NA
)
data

--------------------------------------------------------------------------------------------------------------------------------------------------------------
2)Modify Column Names: 
     
data <- data.frame(
     x1 = c(1:4, 99999, 1, NA, 1, 1, NA),  
     x1 = c(1:5, 1, "NA", 1, 1, "NA"),
     x1 = c(letters[c(1:3)], "x  x",  "x", "   y    y y", "x", "a", "a", NA),
     x4 = "", 
     x5 = NA
    )
data
colnames(data)                  #"x1"   "x1.1" "x1.2" "x4"   "x5"  
ncol(data)                      #5
    
#*The colnames() function returns or sets the names of the columns in a data frame.
#*ncol() function in R Language is used to return the number of columns of the object.

colnames(data) <- paste0("col", 1:ncol(data))   # Modify all column names	 #col1 col2 col3 col4
data  

Let’s assume that we want to change these column names to a consecutive range with the prefix “col”. 
Then, we can apply the colnames, paste0, and ncol functions as shown below.
 

--------------------------------------------------------------------------------------------------------------------------------------------------------------
3)Format Missing Values: 
  
     *In the R programming language, missing values are usually represented by NA. For that reason, it is useful to convert all missing values to this NA format.
     *In our specific example data frame, we have the problem that some missing values are represented by blank character strings.
     *If we want to assign NA values to those blank cells, we can use the following syntax

data <- data.frame(
     x1 = c(1:4, 99999, 1, NA, 1, 1, NA),  
     x1 = c(1:5, 1, "NA", 1, 1, "NA"),
     x1 = c(letters[c(1:3)], "x  x",  "x", "   y    y y", "x", "a", "a", NA),
     x4 = "", 
     x5 = NA
)

data

data[data == ""] <- NA 
data[data == "NA"] <- NA   
data

--------------------------------------------------------------------------------------------------------------------------------------------------------------
4)Remove Empty Rows & Columns: 

The syntax below demonstrates how to use the rowSums, is.na, and ncol functions to remove only-NA rows.
   
data <- data.frame(
       x1 = c(1:4, 99999, 1, NA, 1, 1, NA),  
       x1 = c(1:5, 1, "NA", 1, 1, "NA"),
       x1 = c(letters[c(1:3)], "x  x",  "x", "   y    y y", "x", "a", "a", NA),
       x4 = "", 
       x5 = NA
    )
     
data
data <- data[rowSums(is.na(data)) != ncol(data), ]     #Drop empty rows.	
data
   
 
data <- data.frame(
       x1 = c(1:4, 99999, 1, NA, 1, 1, NA),  
       x1 = c(1:5, 1, "NA", 1, 1, "NA"),
       x1 = c(letters[c(1:3)], "x  x",  "x", "   y    y y", "x", "a", "a", NA),
       x4 = "", 
       x5 = NA
    )
data

#Similar to that, we can also exclude columns that contain only NA values.
   
data <- data[ , colSums(is.na(data)) != nrow(data), ]            # Drop empty cols
data  

--------------------------------------------------------------------------------------------------------------------------------------------------------------
5)Remove Rows with Missing Values: 
 
     However, in case you have decided to remove all rows with one or more NA values, you may use the na.omit function as shown below.
   
data <- data.frame(
       x1 = c(1:4, 99999, 1, NA, 1, 1, NA),  
       x1 = c(1:5, 1, "NA", 1, 1, "NA"),
       x1 = c(letters[c(1:3)], "x  x",  "x", "   y    y y", "x", "a", "a", NA),
       x4 = "", 
       x5 = NA
)
data


data <- na.omit(data)        # Drop rows with missing vals
data   

--------------------------------------------------------------------------------------------------------------------------------------------------------------
6)Remove Duplicates: 

we can apply the unique function to our data frame to remove duplicates.
   
data <- data.frame(
       x1 = c(1:4, 99999, 1, NA, 1, 1, NA),  
       x1 = c(1:5, 1, "NA", 1, 1, "NA"),
       x1 = c(letters[c(1:3)], "x  x",  "x", "   y    y y", "x", "a", "a", NA),
       x4 = "", 
       x5 = NA
)
     
data  


data <- unique(data)   # delete duplicate rows
data

--------------------------------------------------------------------------------------------------------------------------------------------------------------
7)Modify Classes of Columns: 
     
#The class of the columns of a data frame is another critical topic when it comes to data cleaning.
#Let’s first check the current classes of our data frame columns.

data <- data.frame(
       x1 = c(1:4, 99999, 1, NA, 1, 1, NA),  
       x1 = c(1:5, 1, "NA", 1, 1, "NA"),
       x1 = c(letters[c(1:3)], "x  x",  "x", "   y    y y", "x", "a", "a", NA),
       x4 = "", 
       x5 = NA
)
     
data    
sapply(data, class)                       # Print classes of all columns
   #       col1             col2              col3 
   #   "numeric"          "character"      "character“

#We can now use the type.convert function to change the column classes whenever it is appropriate

data <- type.convert(data, as.is = TRUE)
   sapply(data, class)   
   
--------------------------------------------------------------------------------------------------------------------------------------------------------------
8)Detect & Remove Outliers: 
 
data <- data.frame(
       x1 = c(1:4, 99999, 1, NA, 1, 1, NA),  
       x1 = c(1:5, 1, "NA", 1, 1, "NA"),
       x1 = c(letters[c(1:3)], "x  x",  "x", "   y    y y", "x", "a", "a", NA),
       x4 = "", 
       x5 = NA
)
     
data   

#*One method to detect outliers is provided by the boxplot.stats function. The following R code demonstrates how to test for outliers in our data frame column col1
   
     # Identify outliers in column
data$col1[data$col1 %in% boxplot.stats(data$col1)$out]
   #[1] 99999 #This value is obviously much higher than the other values in this column.
  
# Let’s assume that we have confirmed theoretically that the observation containing this outlier should be removed. Then, we can apply the R code below
   # Remove rows with outliers
   data <- data[! data$col1 %in% boxplot.stats(data$col1)$out, ]
   data

-------------------------------------------------------------------------------------------------------------------------------------------------------------
9)Remove Spaces in Character Strings: 
     
#The manipulation of character strings is another important aspect of the data cleaning process.
#This example demonstrates how to avoid blank spaces in the character strings of a certain variable.
   
     #For this task, we can use the gsub function as demonstrated below:
     # Delete white space in character strings

data <- data.frame(
       x1 = c(1:4, 99999, 1, NA, 1, 1, NA),  
       x1 = c(1:5, 1, "NA", 1, 1, "NA"),
       x11 = c(letters[c(1:3)], "x  x",  "x", "   y    y y", "x", "a", "a", NA),
       x4 = "", 
       x5 = NA
)
     
data        
data$col3 <- gsub(" ", "", data$x11)
data

*gsub(" ", "", data$col3)
*gsub() = global substitution (replaces all matches of a pattern).
*First argument " " → the pattern to find, here it’s a space " ".
*Second argument "" → the replacement string, here it’s empty (so spaces are removed).
*Third argument data$col3 → the text/vector where substitution is applied.
*Effect: removes all spaces inside the strings of col3.

   
-------------------------------------------------------------------------------------------------------------------------------------------------------------
EXAMPLE WITH ALL CASES;
Create example data frame with unique column names

data <- data.frame(
     x1 = c(1:4, 99999, 1, NA, 1, 1, NA),
     x2 = c(1:5, 1, "NA", 1, 1, "NA"),
     x3 = c(letters[c(1:3)], "x  x", "x", "   y    y y", "x", "a", "a", NA),
     x4 = "",                                 # Empty column
     x5 = NA                                  # Column with only NA
)
   
   print("Original Data:")
   print(data)
   
   # Rename columns dynamically
   colnames(data) <- paste0("col", 1:ncol(data))
   
   print("After Renaming Columns:")
   print(data)
   
   # Convert empty strings and "NA" strings to NA
   data[data == ""] <- NA
   data[data == "NA"] <- NA
   
   print("After Converting Empty Strings to NA:")
   print(data)
   
   # Remove rows where all values are NA
   data <- data[rowSums(is.na(data)) != ncol(data), ]
   
   print("After Removing Fully NA Rows:")
   print(data)
   
   # Remove columns where all values are NA
   data <- data[, colSums(is.na(data)) != nrow(data)]
   
   print("After Removing Fully NA Columns:")
   print(data)
   
   # Drop rows with any missing values
   data <- na.omit(data)
   
   print("After Dropping Rows with Missing Values:")
   print(data)
   
   # Remove duplicate rows
   data <- unique(data)
   
   print("After Removing Duplicate Rows:")
   print(data)
   
   # Convert data types automatically
   data <- type.convert(data, as.is = TRUE)
   
   print("After Converting Data Types:")
   print(sapply(data, class))
   
   # Detect and remove outliers in col1 using boxplot statistics
   outliers <- data$col1[data$col1 %in% boxplot.stats(data$col1)$out]
   print("Outliers in col1:")
   print(outliers)
   
   data <- data[!data$col1 %in% boxplot.stats(data$col1)$out, ]
   
   print("After Removing Outliers in col1:")
   print(data)
   
   # Remove spaces from col3
   data$col3 <- gsub(" ", "", data$col3)
   
   print("After Removing Spaces in col3:")
   print(data)

------------------------------------------------------------------------------------------------------------------------------------------------------------- 
shipments <- data.frame(
     ShipmentID = c(101, 102, 103, 104, 105, 106, 107, 107, 108, NA),
     Sender = c(" Amazon ", "Flipkart", "NA", "Myntra", "Amazon", "  Meesho", "AJIO", "AJIO", " ", "Nykaa"),
     Receiver = c("Rahul", " Sneha ", "Ravi", "NA", "Priya", "Kumar", "Ravi", "Ravi", "", "Diya"),
     Weight = c(2.5, 3.2, NA, 5.6, 100, 2.0, 3.1, 3.1, 4.5, 2.5),
     ShipmentDate = c("2025-01-01", "2025-01-03", "2025-01-04", "2025-01-06", "2025-01-08", "", "2025-01-10", "2025-01-10", "2025-01-12", "NA"),
     DeliveryDate = c("2025-01-05", "2025-01-07", "2025-01-09", "2025-01-11", "2025-02-20", "", "2025-01-15", "2025-01-15", "2025-01-20", "NA"),
     Status = c("Delivered", "Pending ", "Delivered", "NA", "Returned", "Delivered", "Delivered", "Delivered", "Returned", ""),
     Cost = c(250, 400, 300, 10000, 200, 250, 270, 270, 350, NA)
   )
   
   print("Original Data:")
   print(shipments)
   
   
   # ------------------ Rename Columns ------------------
   colnames(shipments) <- c("S_ID", "Sender_Name", "Receiver_Name", "Weight_Kg",
                            "Ship_Date", "Del_Date", "Delivery_Status", "Shipping_Cost")
   
   print("After Renaming Columns:")
   print(shipments)
   
   
   # ------------------ Replace Empty Strings and 'NA' Strings with Actual NA ------------------
   shipments[shipments == ""] <- NA
   shipments[shipments == "NA"] <- NA
   
   print("After Converting Empty Strings and 'NA' to NA:")
   print(shipments)
   
   
   # ------------------ Remove Rows and Columns Fully NA ------------------
   shipments <- shipments[rowSums(is.na(shipments)) != ncol(shipments), ]
   print("After Removing Fully NA Rows:")
   print(shipments)
   
   shipments <- shipments[, colSums(is.na(shipments)) != nrow(shipments)]
   print("After Removing Fully NA Columns:")
   print(shipments)
   
   
   # ------------------ Drop Rows with Any Missing Values ------------------
   shipments <- na.omit(shipments)
   print("After Dropping Rows with Missing Values:")
   print(shipments)
   
   
   # ------------------ Remove Duplicate Rows ------------------
   shipments <- unique(shipments)
   print("After Removing Duplicate Rows:")
   print(shipments)
   
   
   # ------------------ Convert Data Types ------------------
   shipments$S_ID <- as.integer(shipments$S_ID)
   shipments$Ship_Date <- as.Date(shipments$Ship_Date)
   shipments$Del_Date <- as.Date(shipments$Del_Date)
   shipments$Shipping_Cost <- as.numeric(shipments$Shipping_Cost)
   
   print("After Converting Data Types:")
   print(sapply(shipments, class))
   
   
   # ------------------ Detect and Remove Outliers ------------------
   # Outliers in Weight_Kg
   outliers_weight <- shipments$Weight_Kg[shipments$Weight_Kg %in% boxplot.stats(shipments$Weight_Kg)$out]
   print("Outliers in Weight_Kg:")
   print(outliers_weight)
   shipments <- shipments[!shipments$Weight_Kg %in% outliers_weight, ]
   
   # Outliers in Shipping_Cost
   outliers_cost <- shipments$Shipping_Cost[shipments$Shipping_Cost %in% boxplot.stats(shipments$Shipping_Cost)$out]
   print("Outliers in Shipping_Cost:")
   print(outliers_cost)
   shipments <- shipments[!shipments$Shipping_Cost %in% outliers_cost, ]
   
   print("After Removing Outliers:")
   print(shipments)
   
   
   # ------------------ Remove Extra Spaces from Text Columns ------------------
   shipments$Sender_Name <- trimws(shipments$Sender_Name)
   shipments$Receiver_Name <- trimws(shipments$Receiver_Name)
   shipments$Delivery_Status <- trimws(shipments$Delivery_Status)
   
   print("After Removing Extra Spaces in Text Columns:")
   print(shipments)
   