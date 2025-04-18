# Create new engineered features using existing columns
df$Ride_Density <- df$Number_of_Riders / df$Number_of_Drivers
df$Surge_Indicator <- ifelse(df$Number_of_Riders > 1.5 * df$Number_of_Drivers, 1, 0)

# Create Peak_Hours_Flag based on the ordered `Time_of_Booking` (1=Morning, 2=Afternoon, 3=Evening)
df$Peak_Hours_Flag <- ifelse(df$Time_of_Booking %in% c(1, 2, 3), 1, 0)  # Morning, Afternoon, Evening

# Now perform correlation analysis on all columns
correlation_matrix <- cor(df[, c(
  "Number_of_Riders", "Number_of_Drivers", "Location_Category",
  "Customer_Loyalty_Status", "Number_of_Past_Rides", "Average_Ratings",
  "Time_of_Booking", "Vehicle_Type", "Expected_Ride_Duration",
  "Historical_Cost_of_Ride", "Ride_Density", "Surge_Indicator",
  "Peak_Hours_Flag"
)], use = "complete.obs")

# Print the correlation matrix
print(correlation_matrix)

# Plot the correlation matrix using corrplot
library(corrplot)
corrplot(correlation_matrix, method = "color", type = "upper", tl.cex = 0.8)
