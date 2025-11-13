# -------------------------------
# (a) Create dataframe
# -------------------------------

patients <- data.frame(
  PatientID = c(101, 102, 103, 104, 105, 102, 106, 107, 108, 109),
  Name = c("John Doe", "Jane Smith", "NA", "Chris Evans", "Emily Davis", 
           "Jane Smith", "Mike Ross", "Sarah Lee", "David Kim", "NA"),
  Age = c(25, 45, 60, 30, 50, 45, 70, 22, "NA", 40),
  Gender = c("M", "F", "M", "M", "F", "F", "M", "F", "M", "M"),
  Disease = c("Flu", "Diabetes", "Flu", "Cancer", "NA", "Diabetes",
              "Hypertension", "Asthma", "NA", "Covid-19"),
  AdmissionDate = c("2023-01-15", "2022-11-10", "2023-05-20", "2022-12-05", 
                    "2023-07-30", "2022-11-10", "2021-06-18", "2023-02-14", 
                    "2023-08-22", "2023-04-10"),
  TreatmentCost = c(1000, 2500, 1500, 5000, 3000, 2500, 7000, 4000, "NA", 1500),
  stringsAsFactors = FALSE
)

print("Initial Data:")
print(patients)

# -------------------------------
# (b) Sort by AdmissionDate (oldest → newest)
# -------------------------------
patients$AdmissionDate <- as.Date(patients$AdmissionDate)
patients <- patients[order(patients$AdmissionDate), ]
print("Sorted by Admission Date:")
print(patients)

# -------------------------------
# (c) Remove duplicate PatientIDs
# -------------------------------
patients <- patients[!duplicated(patients$PatientID), ]
print("After removing duplicates:")
print(patients)

# -------------------------------
# (d) Replace 'NA' (as text) with real NA values
# -------------------------------
patients[patients == "NA"] <- NA
print("After replacing text 'NA' with actual NA:")
print(patients)

# -------------------------------
# (e) Convert data types
# -------------------------------
patients$TreatmentCost <- as.numeric(patients$TreatmentCost)
patients$Age <- as.numeric(patients$Age)
print("After converting data types:")
str(patients)

# -------------------------------
# (f) Categorize Age
# -------------------------------
patients$AgeGroup <- cut(
  patients$Age,
  breaks = c(0, 30, 60, Inf),
  labels = c("Young", "Middle-aged", "Senior"),
  right = TRUE
)
print("Final Data with AgeGroup:")
print(patients)

