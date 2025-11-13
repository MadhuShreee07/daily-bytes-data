100+100
100-50
100*2
100/2
100%%2  #use double %

34+46/2    
(34+46)/2        #follows order of precendece

10>20 & 10<20
10>20 | 10<20
!(10==3)
10==3


#R uses the print() function to display the variables

x<- 10
x            #auto printing
print(x)     #explicit printing

x<-10:30

#R uses the paste() and pasteO() function to fromat strings
#and variables together for printing in a few diff ways

print(paste('hello','world'))

print(paste('hello','world',sep='-'))

paste0('hello','world')

paste0('welcome','to','R')