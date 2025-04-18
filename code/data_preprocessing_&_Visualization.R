#  This will give you the count of NAs per column
colSums(is.na(df))  

# Check for duplicate rows in the dataframe
duplicates <- df[duplicated(df), ]

# Check if there are any missing values in the duplicated rows
any(is.na(duplicates))

# Encoding for Categorical columns-------------
# Label Encoding for Ordinal Variables
df <- df %>%
  mutate(Customer_Loyalty_Status = as.integer(factor(Customer_Loyalty_Status,
                 levels = c("Silver", "Regular", "Gold"), ordered = TRUE)),
         Vehicle_Type = as.integer(factor(Vehicle_Type,
                 levels = c("Economy", "Premium", "Luxury"), ordered = TRUE)))

# One-Hot Encoding for Nominal Variables
df <- df %>%
  mutate(Location_Category = factor(Location_Category),
         Time_of_Booking = factor(Time_of_Booking))
df <- df %>%
  mutate(
    # Encoding for Time_of_Booking
    Time_of_Booking = factor(Time_of_Booking, levels = c("Morning", "Afternoon", "Evening", "Night"), ordered = TRUE) %>%
      as.integer(),

    # Encoding for Location_Category
    Location_Category = factor(Location_Category, levels = c("Rural", "Suburban", "Urban"), ordered = TRUE) %>%
      as.integer()
  )
# View result
head(df)

# Capping Outliers------------------------------
# Function to cap outliers using IQR
cap_outliers <- function(x) {
  Q1 <- quantile(x, 0.25, na.rm = TRUE)
  Q3 <- quantile(x, 0.75, na.rm = TRUE)
  IQR_val <- Q3 - Q1
  lower_bound <- Q1 - 1.5 * IQR_val
  upper_bound <- Q3 + 1.5 * IQR_val
  x[x < lower_bound] <- lower_bound
  x[x > upper_bound] <- upper_bound
  return(x)
}

# Apply outlier capping to all numeric columns
df[sapply(df, is.numeric)] <- lapply(df[sapply(df, is.numeric)], cap_outliers)

summary(df)

# Data Visualization--------------------
library(ggplot2)
# Histograms
for (col in numeric_columns) {
  print(
    ggplot(df, aes_string(col)) +
      geom_histogram(fill = "skyblue", bins = 75, color = "black") +
      ggtitle(paste("Histogram of", col)) +
      theme_minimal()
  )
}
# Boxplots
for (col in numeric_columns) {
  print(
    ggplot(df, aes_string(x = "''", y = col)) +  # use empty string for x-axis label
      geom_boxplot(fill = "tomato") +
      ggtitle(paste("Boxplot of", col)) +
      xlab("") +
      theme_minimal()
  )
}

# Correlation matrix---------------------

library(corrplot)
options(repr.plot.width = 10, repr.plot.height = 10)  # Set width and height in inches
corrplot(cor(df, use = "complete.obs"), method = "color", type = "upper", tl.cex = 1.2)

# Storing the dataset for reuse
write.csv(df, "cleaned_rideshare_data.csv", row.names = FALSE)
