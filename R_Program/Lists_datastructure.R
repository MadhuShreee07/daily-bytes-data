#LISTS - A list is a collection of elements of different types (numeric, character, logical, vectors, even other lists).

**Creating Lists

a) Simple list

lst1 <- list(1, 2, 3)

b)Named list

lst2 <- list(num=10, text="R Programming", flag=TRUE)
lst2
                          # $num   10     $text  "R Programming"     $flag  TRUE

c) Nested list (list inside list)

lst3 <- list(a=1:3, b=list(x=10, y=20))
lst3

-------------------------------------------------------------------------------------------------------------------------------------
Accessing List Elements:
  
a) By position using [[ ]]

my_list <- list(10, "Hello", TRUE)
my_list[[1]]                                           # 10
my_list[[2]]                                          # "Hello"

b) By name using $
  
lst2$num                                             # 10
lst2$text                                        # "R Programming"

c) Single [ ]-returns a sublist vs Double [[ ]]-returns the actual element

lst2[1]   # returns a list with one element
lst2[[1]] # returns the value 10

d)Nested Lists Access

lst3 <- list(a=1:3, b=list(x=10, y=20))

lst3$b          # returns sub-list: $x 10, $y 20
lst3$b$x        # 10
lst3[["b"]][["y"]]  # 20

---------------------------------------------------------------------------------------------------------------------------
4. Modifying Lists

a) Adding elements

lst2$new_element <- "New"
lst2

b) Changing elements

lst2$num <- 100
lst2$num  # 100


c) Removing elements

lst2$text <- NULL
lst2

d)To add an item to the end of the list, use the append() function.

thislist <- list("apple","banana","cherry")
append(thislist,"orange")
   

e)To add an item to the right of a specified index, add "after=index number" in the append() function 

thislist <- list("apple","banana","cherry")
append(thislist,"orange", after =2)                    	#"apple“ "banana“  “orange” "cherry"


----------------------------------------------------------------------------------------------------------------------------
  | Function | Description                                        | Example                       |
  | -------- | -------------------------------------------------- | ----------------------------- |
  | length() | Number of elements in the list                     | length(lst2)                  |
  | names()  | Get or set names of elements                       | names(lst2) <- c("a","b","c") |
  | unlist() | Convert list to vector                             | unlist(lst3)                  |
  | lapply() | Apply function to each element (returns list)      | lapply(lst1, sqrt)            |
  | sapply() | Apply function to each element (simplified output) | sapply(lst1, sqrt)            |

  
----------------------------------------------------------------------------------------------------------------------------
**Combining Lists

a) Using c()

l1 <- list(1,2)
l2 <- list("A", "B")
l3 <- c(l1, l2)
l3


b) Using append()

l4 <- append(l1, l2)
l4

c)You can join two loops using c() function.

  list1 <- list("a","b","c")
  list2 <- list(1,2,3)
  list3 <-c(list1,list2)
  list3


---------------------------------------------------------------------------------------------------------------------------
a) Lists can hold vectors, matrices, other lists

lst <- list(vec=c(1,2,3), mat=matrix(1:4,2,2), lst2=list(a=10,b=20))


b) lapply() vs sapply() difference

lapply() always returns a list

sapply() tries to simplify to vector/matrix if possible

nums <- list(1,4,9)
lapply(nums, sqrt)  # list of sqrt values
sapply(nums, sqrt)  # vector of sqrt values

-----------------------------------------------------------------------------------------------------------------------------