# Create the data frame
employees <- data.frame(
  EmployeeID = c(101, 102, 103, 104, 105, 106, 107, 101, 108),
  Name = c("Alice", "Bob", "Charlie", "David", "Emma", "Frank", "Grace", "Alice", "Henry"),
  Age = c(25, 45, 55, 17, 70, 38, 29, 25, 50),
  Department = c("HR", "IT", "Finance", NA, "IT", "Finance", "HR", "HR", "Finance"),
  Salary = c(28000, 95000, 150000, 500, 250000, 60000, NA, 28000, 110000)
)

### a) Remove duplicate rows (keep one per EmployeeID)
employees <- employees[!duplicated(employees$EmployeeID), ]

### b) Replace missing Department and Salary
# Replace NA Department with "Unknown"
employees$Department[is.na(employees$Department)] <- "Unknown"

# Replace NA Salary with mean Salary
employees$Salary[is.na(employees$Salary)] <- mean(employees$Salary, na.rm = TRUE)

### c) Replace outliers
median_age <- median(employees$Age, na.rm = TRUE)
median_salary <- median(employees$Salary, na.rm = TRUE)

# Replace Age < 18 or > 65
employees$Age[employees$Age < 18 | employees$Age > 65] <- median_age

# Replace Salary < 1000 or > 200000
employees$Salary[employees$Salary < 1000 | employees$Salary > 200000] <- median_salary

### d) Create Age_Group column
employees$Age_Group <- ifelse(employees$Age < 30, "Junior",
                              ifelse(employees$Age < 50, "Mid-level", "Senior"))

### e) Create Salary_Band column
employees$Salary_Band <- ifelse(employees$Salary < 30000, "Low",
                                ifelse(employees$Salary < 100000, "Medium", "High"))

### f) Find "High" salary employees above 40 years old
high_salary_over40 <- employees[employees$Salary_Band == "High" & employees$Age > 40, ]
print("High salary employees over 40:")
print(high_salary_over40)

### g) Find employees in "IT" or "Finance" earning more than 80000
it_finance_high <- employees[(employees$Department %in% c("IT", "Finance")) & employees$Salary > 80000, ]
print("Employees in IT or Finance earning > 80000:")
print(it_finance_high)

### h) Summarize employees grouped by Salary_Band (base R)
summary_table <- aggregate(cbind(Age, Salary) ~ Salary_Band, data = employees, 
                           FUN = function(x) c(Mean = mean(x), Count = length(x)))

print("Summary by Salary Band:")
print(summary_table)
