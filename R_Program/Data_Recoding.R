#DATA RECODING

Recoding allows you to create new variables and to replace existing values of a variables based on a criterion.


df <- data.frame(
  player = c('P1','P2','P3','P4'),
  points = c(124, 229, 313, 415),
  result = c('Win','Loss','Win','Loss')
)

df


To recode, The easiest way is to use revalue() or mapvalues() from the plyr package. 
These are defined in plyr package.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

df <- data.frame(
    player = c('P1','P2','P3','P4'),
    points = c(124, 229, 313, 415),
    result = c('Win','Loss','Win','Loss')
  )

df
df$scode <- plyr::revalue(df$result, c("Win"="1", "Loss"="2"))  #Creaing new Variable
df

df$result <- plyr::mapvalues(df$result, from = c("Win","Loss"), to = c("1", "0")) #Modify the existing variable
df                                  


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#It is also possible to recode using ifelse.

  df <- data.frame(
    player = c('P1','P2','P3','P4'),
    points = c(124, 229, 313, 415),
    result = c('Win','Loss','Win','Loss')
  )

df
df$scode <- ifelse(df$result=="Win",1,2)		 #Creaing new Variable
df		    


df$result <- ifelse(df$result=="Win",1,0)    #   #Modify the existing variable
df                                   
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
