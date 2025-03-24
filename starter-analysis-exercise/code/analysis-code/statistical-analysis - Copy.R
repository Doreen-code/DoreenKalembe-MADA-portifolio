###############################
# analysis script
#
#this script loads the processed, cleaned data, does a simple analysis
#and saves the results to the results folder

#load needed packages. make sure they are installed.
library(ggplot2) #for plotting
library(broom) #for cleaning up output from lm()
library(here) #for data loading/saving

#path to data
#note the use of the here() package and not absolute paths
data_location2 <- here::here("starter-analysis-exercise","data","processed-data","processeddata2.rds")

#load data. 
mydata2 <- readRDS(data_location2)



######################################
#Data fitting/statistical analysis
######################################


############################
#### Second model fit
# fit linear model using height as outcome, and our new variables 
#waist size and eye color as the predictors
mydata2$eyecolor<-as.factor(mydata2$eyecolor)

lmfit3<- lm(Height ~ waistsize + eyecolor, data= mydata2)  

# place results from fit into a data frame with the tidy function
lmtable3 <- broom::tidy(lmfit3)

#look at fit results
print(lmtable3)

# save fit results table  
table_file3 = here("starter-analysis-exercise","results", "tables-files", "resulttable2.rds")
saveRDS(lmtable3, file = table_file3)



  