# Load manager data set 
managers_data <- read.csv("managers.csv", na = "")
str(managers_data)
managers_data

# Dealing with missing data


# Listwise deletion
new_data <- na.omit(managers_data)
new_data

# Doesnt work with char needs to be converted

managers_data$Q4 <- as.integer(managers_data$Q4)
managers_data$Q5 <- as.integer(managers_data$Q5)
str(managers_data)
managers_data

new_data <- na.omit(managers_data)
new_data

# Use complete.case to show where data 
# Rows are complete 
complete_data <- complete.cases(managers_data)
complete_data
sum(complete_data)

# List the rows where data isnt missing 
complete_data <- managers_data[complete.cases(managers_data),]
complete_data
str(managers_data)

# Age column is still an issue
# so need to convert it to int 
managers_data$Age <- as.integer(managers_data$Age)

# We can use '!' as to negate the action of any function 
complete_data <- managers_data[!complete.cases(managers_data),]
complete_data

# Find the sum of missing data
sum(!is.na(managers_data$Age))

mean(is.na(managers_data))

# Installing a package
install.packages("mice")
library(mice)
md.pattern(managers_data) 

# Use VIM package to show missing value

install.packages("VIM")
library(VIM)
missing_value <- aggr(managers_data, prop = TRUE,numbers = FALSE)
summary(missing_value)

# Pra merging data 
# Loading data

new_manager_data <- read.csv("MoreData.csv", na = "")

# Structure of loaded data

str(new_manager_data)

# Exporting data of interest 

new_manager_data_cleaned <- subset(new_manager_data, select = c(Age,Country,Date,Gender,Q1,Q2,Q3,Q4,Q5))
new_manager_data_cleaned

# Creating Agecat
new_manager_data_cleaned$AgeCat[new_manager_data_cleaned$Age >= 45] <- "Elder"
new_manager_data_cleaned$AgeCat[new_manager_data_cleaned$Age >= 26 & new_manager_data_cleaned$Age <= 44] <- "Middle Aged"
new_manager_data_cleaned$AgeCat[new_manager_data_cleaned$Age <= 25] <- "Young"
new_manager_data_cleaned$AgeCat[is.na(new_manager_data_cleaned$Age)] <- "Elder"
AgeCat <- factor(new_manager_data_cleaned$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))
new_manager_data_cleaned$AgeCat <- AgeCat
str(new_manager_data_cleaned)
#creating x column

new_manager_data_cleaned$X <- NA
# Merging cleaned to manager data
#final_manager_data <- merge.data.frame(new_manager_data_cleaned, managers_data, all.x = FALSE,)

final_manager_data <- rbind(new_manager_data_cleaned,managers_data)
final_manager_data
