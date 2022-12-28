#Import the dplyr library
library(dplyr)
library(tidyverse)
#Import and read the MechaCar_mpg.csv file as a dataframe
mecha_df <- read.csv('Resources/MechaCar_mpg.csv', check.names = F, 
                     stringsAsFactors = F)

#Perform linear regression using the lm() function. In the lm() function, 
#pass in all six variables (i.e., columns), and add the dataframe you created 
#in Step 4 as the data parameter.
linear_mecha <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
                     ground_clearance + AWD, data= mecha_df)

linear_mecha

#Using the summary() function, determine the p-value and the 
# r-squared value for the linear regression model.
summary(linear_mecha)

# checking linear regressions of variables that only impact mpg
mpg_mecha <- lm(mpg ~ vehicle_length + ground_clearance, data=mecha_df)

summary(mpg_mecha)

# import and read Suspension_Coil.csv file as a table
suspension_df <- read.csv('Resources/Suspension_Coil.csv', check.names = F, 
                          stringsAsFactors = F)

# Create a data frame using the summarize function to get the mean, median, 
# standard deviation and variance for PSI
total_summary <- suspension_df %>% summarize(Mean=mean(PSI),
                                             Median=median(PSI),
                                             Variance=var(PSI), 
                                             SD=sd(PSI))
total_summary

# create a data frame using group_by and summarize functions to group each 
# manufacturing lot by mean, median, variance, and standard deviation for 
# suspension coil's PSI column
lot_summary <- suspension_df %>% group_by(Manufacturing_Lot) %>% summarize(
                                             Mean=mean(PSI),
                                             Median=median(PSI),
                                             Variance=var(PSI),
                                             SD=sd(PSI),
                                             .groups='drop')
lot_summary

# use t.test function to determine if the PSI across all manufacturing lots is 
# statistically different from the population mean 1,500 points per square inch
t.test(suspension_df$PSI, mu=1500)

# write 3 more scripts using t.test and its subset() argument to determine if 
# the PSI for each manufacturer lot is statistically different from the population
# mean of 1,500 points per square inch

#lot 1
lot_1 <- subset(suspension_df, Manufacturing_Lot=="Lot1")
lot_1

#lot 2
lot_2 <- subset(suspension_df, Manufacturing_Lot=="Lot2")
lot_2

#lot 3
lot_3 <- subset(suspension_df, Manufacturing_Lot=="Lot3")
lot_3

# check the t.test of each lot
t.test(lot_1$PSI, mu=1500)
t.test(lot_2$PSI, mu=1500)
t.test(lot_3$PSI, mu=1500)
