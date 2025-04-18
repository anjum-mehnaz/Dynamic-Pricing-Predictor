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
