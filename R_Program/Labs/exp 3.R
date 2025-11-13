# Customer transactions dataset
transactions <- data.frame(
  Customer_ID = c(201, 202, 204, 206),
  Transaction_Type = c("Deposit", "Withdrawal", "Deposit", "Transfer"),
  Amount = c(2000, 1000, 3000, 500)
)

# Customer details dataset
customers <- data.frame(
  Customer_ID = c(201, 202, 203, 204, 205),
  Name = c("John", "Alice", "Robert", "Emma", "David"),
  Account_Balance = c(5000, 12000, 8000, 15000, 9500)
)

merged_data <- merge(customers, transactions, by = "Customer_ID", all.x = TRUE)
print(merged_data)

merged_data$Transaction_Type[is.na(merged_data$Transaction_Type)] <- "No Transaction"
merged_data$Amount[is.na(merged_data$Amount)] <- 0


merged_data$Customer_Status <- ifelse(merged_data$Account_Balance > 10000, "VIP", "Regular")


merged_data$Risk_Flag <- ifelse(
  merged_data$Customer_Status == "VIP" & merged_data$Transaction_Type == "Withdrawal",
  "High Attention", "Normal"
)

merged_data$Account_Flag <- ifelse(
  merged_data$Transaction_Type == "No Transaction" & merged_data$Account_Balance < 7000,
  "Dormant", "Active"
)

print(merged_data)



hospital <- data.frame(
  Patient_ID = c(101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 101),
  Name = c("Alice", "Bob", "M", "David", "Eve", "Frank", "Grace", NA, "Henry", "Ivy", "Alice"),
  Age = c(25, 30, 200, 45, NA, 33, 27, 29, 150, 40, 25),
  Gender = c("F", "M", "M", "M", "F", "M", "F", "F", "M", "F", "F"),
  Disease = c("Diabetes", "Hypertension", "Asthma", "Heart Disease", "Heart Disease", "Cancer", "Flu", NA, "Covid-19", "Stroke", "Diabetes"),
  Bill_Amount = c(500, 1200, 300, -50, 2000, NA, 400, 750, 1000000, 950, 500)
)

hospital <- hospital[!duplicated(hospital$Patient_ID), ]


hospital[hospital == ""] <- "Unknown"

# Replace NA in Age with mean Age
hospital$Age[is.na(hospital$Age)] <- mean(hospital$Age, na.rm = TRUE)

# Replace NA in Bill_Amount with mean Bill_Amount
hospital$Bill_Amount[is.na(hospital$Bill_Amount)] <- mean(hospital$Bill_Amount, na.rm = TRUE)

# Replace NA in Name/Disease with "Unknown"
hospital$Name[is.na(hospital$Name)] <- "Unknown"
hospital$Disease[is.na(hospital$Disease)] <- "Unknown"


hospital[hospital == ""] <- "Unknown"

# Replace NA in Age with mean Age
hospital$Age[is.na(hospital$Age)] <- mean(hospital$Age, na.rm = TRUE)

# Replace NA in Bill_Amount with mean Bill_Amount
hospital$Bill_Amount[is.na(hospital$Bill_Amount)] <- mean(hospital$Bill_Amount, na.rm = TRUE)

# Replace NA in Name/Disease with "Unknown"
hospital$Name[is.na(hospital$Name)] <- "Unknown"
hospital$Disease[is.na(hospital$Disease)] <- "Unknown"


median_age <- median(hospital$Age, na.rm = TRUE)
hospital$Age[hospital$Age > 120 | hospital$Age < 0] <- median_age

median_bill <- median(hospital$Bill_Amount, na.rm = TRUE)
hospital$Bill_Amount[hospital$Bill_Amount > 50000 | hospital$Bill_Amount < 0] <- median_bill


hospital$Age_Group <- ifelse(hospital$Age < 30, "Young",
                             ifelse(hospital$Age <= 60, "Middle-Aged", "Senior"))


hospital$Bill_Category <- ifelse(hospital$Bill_Amount < 500, "Low",
                                 ifelse(hospital$Bill_Amount < 5000, "Medium", "High"))

high_40 <- subset(hospital, Bill_Category == "High" & Age > 40)
print(high_40)


specific_patients <- subset(hospital, Disease %in% c("Diabetes", "Hypertension") & Bill_Amount > 1000)
print(specific_patients)


summary_data <- aggregate(
  cbind(Bill_Amount, Age) ~ Bill_Category,
  data = hospital,
  FUN = mean
)

# Add a count column
count_data <- aggregate(Patient_ID ~ Bill_Category, data = hospital, FUN = length)

# Merge both summaries
summary_data <- merge(summary_data, count_data, by = "Bill_Category")

# Rename columns for clarity
colnames(summary_data) <- c("Bill_Category", "Avg_Bill", "Avg_Age", "Count")

print(summary_data)


print(summary_data)


