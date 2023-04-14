library(dplyr)
# Read the CSV file into a dataframe
df <- read.csv('diabetes.csv')

# Check for missing values in each column
missing_values <- colSums(is.na(df))

# Print the missing values count for each column
cat("Missing Values Count:\n")
print(missing_values)
#As there are no missing values, we can say that the data provided is already clean