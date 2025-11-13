# Create a vector of ages
ages <- c(18, 25, 32, 40, 55, 65, 28, 75)

# Replace values below 30 with double the age
ages[ages < 30] <- ages[ages < 30] * 2

# Replace values above 30 with half the age
ages[ages > 30] <- ages[ages > 30] / 2

# Remove all values above 60
ages <- ages[ages <= 60]

print(ages)


employee_IDs <- c(101, 102, 103, 104)
employee_names <- c("John", "Priya", "Kiran", "Anita")
salaries <- c(45000, 52000, 61000, 40000)

# Logical vector for salary above ₹50,000
above_50k <- salaries > 50000

# Combine into a list
employee_list <- list(
  ID = employee_IDs,
  Name = employee_names,
  SalaryAbove50k = above_50k
)

print(employee_list)


# Create a 4x5 matrix (4 students × 5 subjects)
set.seed(1)
scores <- matrix(sample(50:100, 20, replace = TRUE), nrow = 4, ncol = 5)
colnames(scores) <- paste0("Sub", 1:5)

# Calculate row-wise average
avg_scores <- rowMeans(scores)

# Assign grades based on average
grades <- ifelse(avg_scores > 80, "A",
                 ifelse(avg_scores >= 60, "B", "C"))

# Combine matrix and grade column
student_data <- data.frame(scores, Grade = grades)

print(student_data)


sales_data <- data.frame(
  SaleID = 1:8,
  CustomerID = c(101, 102, 101, 103, 104, 105, 102, 106),
  ProductID = c("P1", "P2", "P3", "P1", "P2", "P4", "P4", "P3"),
  Quantity = c(10, 55, 20, 5, 80, 12, 95, 30),
  UnitPrice = c(100, 200, 150, 100, 200, 180, 180, 150),
  SaleDate = as.Date(c("2021-03-01", "2021-03-15", "2021-04-10", 
                       "2021-03-20", "2021-05-05", "2021-03-25", 
                       "2021-04-01", "2021-03-30"))
)

# Extract month
sales_data$Month <- format(sales_data$SaleDate, "%m")

# Calculate TotalSale
sales_data$TotalSale <- sales_data$Quantity * sales_data$UnitPrice

# Average TotalSale by Month
avg_sales <- aggregate(TotalSale ~ Month, data = sales_data, FUN = mean)

# Identify month with lowest average sale
lowest_month <- avg_sales$Month[which.min(avg_sales$TotalSale)]

print(avg_sales)
cat("Month with lowest average sale:", lowest_month, "\n")



employee_data <- data.frame(
  Employee_ID = c(201, 202, 203, 204, 205),
  Department = c("HR", "IT", "Finance", "Marketing", "IT"),
  Salary = c(45000, 60000, 70000, 50000, 80000),
  Years_of_Experience = c(3, 5, 10, 4, 8)
)

print(employee_data)
