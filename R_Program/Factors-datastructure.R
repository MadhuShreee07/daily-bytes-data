#FACTORS-A factor is used to represent categorical data in R.
#It stores levels (unique categories) and data values that point to those levels.

gender <- factor(c("Male","Female","Male","Female","Female"))
gender
                                          # [1] Male   Female Male   Female Female
                                         # Levels: Female Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Creating Factors

a) Basic factor

x <- c("low","medium","high","medium","low")
f <- factor(x)
f
levels(f)                                             # "high" "low" "medium"


b) Ordered factor-If the categories have a natural order, use ordered=TRUE

f_ordered <- factor(x, levels=c("low","medium","high"), ordered=TRUE)
f_ordered


c) Specifying levels manually

f2 <- factor(x, levels=c("low","medium","high"))
levels(f2)                                                # low medium high

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
3. Accessing Factor Information

levels(f)                                              # unique categories
nlevels(f)                                             # number of levels
as.numeric(f)                                          # numeric codes for levels


f                                                 # [1] low    medium high   medium low
as.numeric(f)                               # [1] 2 3 1 3 2   # numeric code assigned to each level

--------------------------------------------------------------------------------------------------------------------------------------------------
4. Modifying Factors

a) Adding a new level

f <- factor(c("A","B"))
levels(f) <- c("A","B","C")
f <- factor(f, levels=c("A","B","C"))


b) Renaming levels

levels(f) <- c("Group1","Group2","Group3")
f


c) Converting factor to character

as.character(f)


d) Converting factor to numeric

Important: first convert to character, then numeric to avoid wrong codes

f_num <- as.numeric(as.character(factor(c(1,2,3,2))))

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
5. Factors in Data Frames
df <- data.frame(Name=c("Alice","Bob"), Gender=c("F","M"))
df$Gender <- factor(df$Gender)
str(df)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
| Function         | Description                           | Example                |
  | ---------------- | ------------------------------------- | ---------------------- |
  | `factor()`       | Create a factor                       | factor(c("A","B","A")) |
  | `levels()`       | Get/set factor levels                 | levels(f)              |
  | `nlevels()`      | Number of levels                      | nlevels(f)             |
  | `as.numeric()`   | Convert factor to numeric (via codes) | as.numeric(f)          |
  | `as.character()` | Convert factor to character           | as.character(f)        |
  | `table()`        | Frequency of each level               | table(f)               |
  