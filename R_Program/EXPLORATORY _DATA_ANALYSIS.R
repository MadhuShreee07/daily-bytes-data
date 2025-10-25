#EXPLORATORY DATA ANALYSIS

"
*Exploratory Data Analysis or EDA is a statistical approach or technique for analysing data sets in order to summarize their important and main characteristics generally by using some visual aids.
*The EDA approach can be used to gather knowledge about the following aspects of data:
         * Main characteristics or features of the data.
         * The variables and their relationships
         * Finding out the important variables that can be used in our problem.
          
#In R Language, we are going to perform EDA under two broad classifications:
       * Descriptive Statistics, which includes mean, median, mode, inter-quartile range, and so on.
       *  Graphical Methods, which includes Box plot, Histogram, Pie graph, Line chart, Barplot, Scatter Plot and so on.
   "       
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#HISTOGRAMS

"
*A histogram contains a rectangular area to display the statistical information which is proportional to the frequency of a variable and its width in successive numerical intervals. 
*We can create histograms in R Programming Language using the hist() function.

Syntax: hist(v, main, xlab, xlim, ylim, breaks, col, border)
        v: This parameter contains numerical values used in histogram.
        main: This parameter main is the title of the chart.
        col: This parameter is used to set color of the bars.
        xlab: This parameter is the label for horizontal axis.
        border: This parameter is used to set border color of each bar.
        xlim: This parameter is used for plotting values of x-axis.
        ylim: This parameter is used for plotting values of y-axis.
        breaks: This parameter is used as width of each bar      "
        
v <- c(19, 23, 11, 5, 16, 21, 32, 14, 19, 27, 39)
hist   (
  v, 
  xlab = "No.of Articles ",
  col = "green", 
  border = "black"
  )
        
v <- c(19, 23, 11, 5, 16, 21, 32, 14, 19, 27, 39)
hist(v,
     xlab = "No of Articles",
     col = "yellow",
     border = "black",
     xlim = c(0, 50),
     ylim = c(0, 5),
     breaks = 5
     )

#The range of v = max - min = 39 - 5 = 34
#R tries to split this into 5 bins → width ≈ 34 / 5 = 6.8

scores <- c(55, 78, 62, 90, 85, 70, 95, 88, 60, 72, 80)

hist(scores,
     xlab = "Exam Scores",
     main = "Distribution of Student Scores",
     col = "lightblue",
     border = "darkblue",
     xlim = c(50, 100),
     ylim = c(0, 4),
     breaks = 5
     )
      
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#PIE GRAPH        
        
#A pie chart is a circular statistical graphic, which is divided into slices to illustrate numerical proportions. 
#It depicts a special chart that uses “pie slices”, where each sector shows the relative sizes of data.
#A circular chart cuts in the form of radii into segments describing relative frequencies or magnitude also known as a circle graph. 
         
    "     Syntax: pie(x, labels, main, col, clockwise)
               x: This parameter is a vector that contains the numeric values which are used in the pie chart.
              labels: This parameter gives the description to the slices in pie chart.
              main: This parameter is representing title of the pie chart.
              clockwise: This parameter contains the logical value which indicates whether the slices are drawn clockwise or in anti-clockwise direction.
              col: This parameter give colours to the pie in the graph.    "

     
Temp<- c(23, 36, 50, 43)
Cities <- c("Banglore", "Pune", "Chennai", "Amaravati")
pie(
  Temp, 
  Cities,
  main = "City pie chart",
  col = rainbow(length(Temp)) )


x <- c(21, 62, 10,53)
labels <- c("London","New York","Singapore", "Mumbai")
piepercent<- round(100*x/sum(x), 1)

pie(
   x, 
   labels = piepercent, 
   main = "City pie chart",
   col = rainbow(length(x)))

   legend("topright", c("London","NewYork","Singapore","Mumbai"), 
    cex = 0.8,                                     # makes text slightly smaller
    fill = rainbow(length(x))
    )
   
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#BAR PLOT

#Bar charts are a popular and effective way to visually represent categorical data in a structured manner. 
#R uses the barplot() function to create bar charts. Here, both vertical and Horizontal bars can be drawn.

    " Syntax: barplot(H, xlab, ylab, main, names.arg, col) 
              H: This parameter is a vector or matrix containing numeric values which are used in bar chart.
              xlab: This parameter is the label for x axis in bar chart.
              ylab: This parameter is the label for y axis in bar chart.
              main: This parameter is the title of the bar chart.
              names.arg: This parameter is a vector of names appearing under each bar in bar chart.
              col: This parameter is used to give colors to the bars in the graph.  "


A <- c(17, 32, 8, 53, 1)
barplot(
  A, 
  xlab = "X-axis", 
  ylab = "Y-axis", 
  main ="Bar-Chart")


A <- c(17, 32, 8, 53, 1)
barplot(A, 
        horiz = TRUE, 
        xlab = "X-axis", 
        ylab = "Y-axis",
        main ="Horizontal Bar Chart" )


students <- c(25, 30, 15, 20)                              # H: number of students
classes <- c("Class A", "Class B", "Class C", "Class D")   # names.arg: names for each bar
barplot(students,
        xlab = "Classes",                                # Label for X-axis
        ylab = "Number of Students",                     # Label for Y-axis
        main = "Number of Students in Each Class",       # Chart title
        names.arg = classes,                            # Names under each bar
        col = c("red", "blue", "green", "orange")          # Colors of bars
)


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#SCATTER PLOTS

#A "scatter plot" is a type of plot used to display the relationship between two numerical variables, and plots one dot for each observation.
#It needs two vectors of same length, one for the x-axis (horizontal) and one for the y-axis (vertical).
        
   " Syntax: plot(x, y, main, xlab, ylab, xlim, ylim, axes)
           x: This parameter sets the horizontal coordinates.
          y: This parameter sets the vertical coordinates.
           xlab: This parameter is the label for horizontal axis.
           ylab: This parameter is the label for vertical axis.
           main: This parameter main is the title of the chart.
           xlim: This parameter is used for plotting values of x.
           ylim: This parameter is used for plotting values of y.
           axes: This parameter indicates whether both axes should be drawn on the plot.  "



x <- 1:10
y <- c(2, 5, 3, 8, 7, 12, 9, 15, 11, 18)

plot(x, y,
     main = "scatter plots",   # Title of the plot
     xlab = "X-Axis Label",                      # Label for X-axis
     ylab = "Y-Axis Label",                      # Label for Y-axis
     xlim = c(0, 12),                            # Limit for X-axis
     ylim = c(0, 20),                            # Limit for Y-axis
     axes = TRUE                                 # Draw both axes
)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#LINE GRAPHS

#A line graph is a chart that is used to display information in the form of a series of data points. 
#It utilizes points and lines to represent change over time. 
#Line graphs are drawn by plotting different points on their X coordinates and Y coordinates, then by joining them together through a line from beginning to end.
      " Syntax: plot(v, type, col, xlab, ylab)
           v: This parameter is a contains only the numeric values
          type: This parameter has the following value: 
           “p” : This value is used to draw only the points.
           “l” : This value is used to draw only the lines.
           “o”: This value is used to draw both points and lines
           xlab: This parameter is the label for x axis in the chart.
           ylab: This parameter is the label for y axis in the chart.
          main: This parameter main is the title of the chart.
          col: This parameter is used to give colors to both the points and lines.  "

v <- c(17, 25, 38, 13, 41)
plot(v, type = "o")


months <- 1:6
sales <- c(150, 200, 180, 220, 190, 250)

plot(
  sales,                # v: numeric values
  type = "o",           # type: 'o' → points + lines
  col = "blue",         # col: color of points and lines
  xlab = "Month",       # xlab: x-axis label
  ylab = "Sales (in units)", # ylab: y-axis label
  main = "Monthly Sales Trend" # main: chart title
)


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#BOXPLOTS

#A box graph is a chart that is used to display information in the form of distribution by drawing boxplots for each of them. 
#This distribution of data is based on five sets (minimum, first quartile, median, third quartile, and maximum).
         
         " Syntax: boxplot(x, data, notch, varwidth, names, main)
              x: This parameter sets as a vector or a formula.
              data: This parameter sets the data frame.
              notch: Draws a notch around the median — helps compare medians between groups.
             varwidth: Logical (TRUE/FALSE): Makes box width proportional to sample size.
              main: This parameter is the title of the chart.
             names: This parameter are the group labels that will be showed under each boxplot.   "
"
|---------|       whisker (maximum)
|         ●       outlier (if any)
|---------|-----  box (25th–75th percentile)
|         |
|---------|       whisker (minimum)  

Minimum: The smallest value in the dataset.
First Quartile (Q1): The value below which 25% of the data lies. (in 25% the median value)
Median (Q2): The middle value that divides the data into two equal halves.
Third Quartile (Q3): The value below which 75% of the data lies.   (in 75% the median value)
Maximum: The largest value in the dataset." 

# use head() to load first six rows of mtcars dataset
head(mtcars)
boxplot(mtcars$mpg)              
boxplot(mtcars$mpg,
  	main="Mileage Data Boxplot",
  	ylab="Miles Per Gallon(mpg)",
  	xlab="No. of Cylinders",
  	col="orange")



boxplot(mpg ~ cyl, data = mtcars,
        notch = TRUE,
        varwidth = TRUE,
        names = c("4 Cyl", "6 Cyl", "8 Cyl"),
        main = "MPG by Number of Cylinders")


data <- data.frame(
  Group1 = c(5, 7, 8, 6, 9, 10),
  Group2 = c(3, 4, 2, 5, 4, 6),
  Group3 = c(8, 9, 7, 10, 11, 9)
)
boxplot(
  data,                                          # Data frame
  notch = TRUE,                                  # Draw notches
  varwidth = TRUE,                               # Box width proportional to sample size
  names = c("A", "B", "C"),                      # Group labels
  main = "Example Boxplot with All Parameters"  # Title
)



"--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"

sales <- data.frame(
  Employee_ID = c(101, 102, 103, 104, 105, 106, 107, 108, 109, 110),
  Department  = c("IT", "HR", "Sales", "IT", "HR", "Sales", "IT", "HR", "Sales", "IT"),
  Salary      = c(75000, 52000, 60000, 80000, 48000, 72000, 90000, 55000, 72000, 85000),
  Experience  = c(5, 2, 4, 6, 3, 5, 7, 4, 6, 6)
)

# View dataset
print(sales)

# ----------------------------
# i) Histogram of Salary
# ----------------------------
sales <- data.frame(
  Employee_ID = c(101, 102, 103, 104, 105, 106, 107, 108, 109, 110),
  Department  = c("IT", "HR", "Sales", "IT", "HR", "Sales", "IT", "HR", "Sales", "IT"),
  Salary      = c(75000, 52000, 60000, 80000, 48000, 72000, 90000, 55000, 72000, 85000),
  Experience  = c(5, 2, 4, 6, 3, 5, 7, 4, 6, 6)
)

hist(sales$Salary,
     col = "lightblue",
     border = "black",
     main = "Salary Distribution of Employees",
     xlab = "Salary",
     ylab = "Frequency")

# ----------------------------
# ii) Pie Chart of Departments
# ----------------------------

sales <- data.frame(
  Employee_ID = c(101, 102, 103, 104, 105, 106, 107, 108, 109, 110),
  Department  = c("IT", "HR", "Sales", "IT", "HR", "Sales", "IT", "HR", "Sales", "IT"),
  Salary      = c(75000, 52000, 60000, 80000, 48000, 72000, 90000, 55000, 72000, 85000),
  Experience  = c(5, 2, 4, 6, 3, 5, 7, 4, 6, 6)
)

dept_counts <- table(sales$Department)
pie(dept_counts,
    main = "Proportion of Employees by Department",
    col = c("lightcoral", "lightgreen", "lightblue"))
print(dept_counts)        # To identify which department has the most employees


#table() to convert the character vector into counts

# ----------------------------
# iii) Scatter Plot (Experience vs Salary)
# ----------------------------
sales <- data.frame(
  Employee_ID = c(101, 102, 103, 104, 105, 106, 107, 108, 109, 110),
  Department  = c("IT", "HR", "Sales", "IT", "HR", "Sales", "IT", "HR", "Sales", "IT"),
  Salary      = c(75000, 52000, 60000, 80000, 48000, 72000, 90000, 55000, 72000, 85000),
  Experience  = c(5, 2, 4, 6, 3, 5, 7, 4, 6, 6)
)

plot(sales$Experience, sales$Salary,
     col = "purple",
     pch = 19,
     main = "Experience vs Salary",
     xlab = "Experience (Years)",
     ylab = "Salary")
abline(lm(Salary ~ Experience, data = sales), col = "red", lwd = 2)

# ----------------------------
# iv) Bar Chart - Average Salary per Department
# ----------------------------
sales <- data.frame(
  Employee_ID = c(101, 102, 103, 104, 105, 106, 107, 108, 109, 110),
  Department  = c("IT", "HR", "Sales", "IT", "HR", "Sales", "IT", "HR", "Sales", "IT"),
  Salary      = c(75000, 52000, 60000, 80000, 48000, 72000, 90000, 55000, 72000, 85000),
  Experience  = c(5, 2, 4, 6, 3, 5, 7, 4, 6, 6)
)

avg_salary <- aggregate(Salary ~ Department, data = sales, mean)
barplot(avg_salary$Salary,
        names.arg = avg_salary$Department,
        col = c("orange", "skyblue", "lightgreen"),
        main = "Average Salary by Department",
        xlab = "Department",
        ylab = "Average Salary")
print(avg_salary)  # To identify highest average salary

# ----------------------------
# v) Box Plot - Salary Distribution by Department
# ----------------------------

sales <- data.frame(
  Employee_ID = c(101, 102, 103, 104, 105, 106, 107, 108, 109, 110),
  Department  = c("IT", "HR", "Sales", "IT", "HR", "Sales", "IT", "HR", "Sales", "IT"),
  Salary      = c(75000, 52000, 60000, 80000, 48000, 72000, 90000, 55000, 72000, 85000),
  Experience  = c(5, 2, 4, 6, 3, 5, 7, 4, 6, 6)
)

boxplot(Salary ~ Department, 
        data = sales,
        col = c("pink", "lightblue", "lightgreen"),
        main = "Salary Distribution by Department",
        xlab = "Department",
        ylab = "Salary")

#Take the Salary column from sales, and create separate box plots for each unique value of Department.”



