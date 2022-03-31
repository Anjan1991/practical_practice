# Q1 
# Store the ufo data into a data frame called ufo_data.

# Reading csv file 
ufo_data <- read.csv("ufo.csv", na = "")
ufo_data
# Show the structure of the UFO
str(ufo_data)

# data frame as well as the first 15 rows of data within the data frame.
head(ufo_data, 15)

# Then count the number of rows within the UFO data frame to confirm 
# there are 89071 rows in it.
nrow(ufo_data) 

# Q2  
# The datetime field is currently set as a chr variable and needs to be converted to a date
# variable. The current date structure is represented in mm/dd/yyyy format. Using the
# relevant R command, convert the datetime variable to a date variable, and prove that
# the date variable has been converted to a date variable.

ufo_data$datetime <- as.Date(ufo_data$datetime, "%m/%d/%Y") # why is the structure changing ?
# Q3
# Update the UFO data frame with the new date structure. And prove that the date
# structure has now changed to a date variable by displaying the new structure of the
# UFO data frame.
str(ufo_data) 
# Q4
# The UFO data frame contains some headings that could cause future issues when
# referencing them
names(ufo_data)
names(ufo_data)[6]  <- "DurationSeconds"
names(ufo_data)[7]  <- "DurationHrsMins"
names(ufo_data)[9]  <- "DatePosted"
names(ufo_data)
# Q5
# The latitude variable is incorrectly defined as a chr variable when it should be a
# numerical variable
ufo_data$latitude <- as.integer(ufo_data$latitude)
str(ufo_data)

ufo_data$X <- NULL
ufo_data
# Q6
# Installing a package
install.packages("mice")
library(mice)
# Using mice
md.pattern(ufo_data)

install.packages("VIM")
library(VIM)
ufo_missing_value <- aggr(ufo_data, prop = TRUE, numbers = FALSE)
ufo_missing_value
summary(ufo_missing_value)
# Q7
new_ufo_data <- na.omit(ufo_data)
new_ufo_data
install.packages("VIM")
library(VIM)
ufo_updated_missing_value <- aggr(new_ufo_data, prop = TRUE, numbers = FALSE)
summary(ufo_updated_missing_value)
# Q8
# Sort the UFO data frame firstly by shape and then by city
attach(new_ufo_data)
ufo_data <- new_ufo_data[order(shape),]
ufo_data <- ufo_data[order(city),]
sorted_ufo_data <- subset(ufo_data, select = c(datetime, city, country, shape))
head(sorted_ufo_data, 15)
detach(new_ufo_data)
# Q9
ufo_gb_disk <- subset(ufo_data,country=="gb"&shape == "disk")
nrow(ufo_gb_disk)

#10
# Using the write.csv() 
write.csv(ufo_data,file = "modified_ufo.csv")
write.csv(ufo_gb_disk,file = "ufo_gb.csv")
write.csv(sorted_ufo_data,file = "sorted_ufo.csv")

