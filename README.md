# Dynamic-Pricing-Predictor
## Dynamic Pricing Strategy for Ride Optimization
### Project Overview
This project leverages machine learning in R to predict optimal ride fares based on real-time demand, supply, and customer attributes. The goal is to support dynamic pricing strategies for ride-sharing platforms while ensuring fairness, affordability, and profitability.

## Table of Contents
1. Environment Setup
2. Loading Data
3. Data Pre-processing
4. Exploratory Data Analysis (EDA)
5. Feature Engineering
6. Model Training
7. Model Evaluation & Optimization
8. Results and Insights
9. Technologies Used
10. Authors
---------------------------------------------------

### 1. Environment Setup
Created an R environment using Ubuntu in Google Colab to simplify package installation. Key libraries used:
- library(tidyverse)
- library(ggplot2)
- library(dplyr)
- library(readr)
- library(lubridate)
- library(corrplot)
- library(randomForest)
- library(xgboost)
- library(caret)
- library(ranger)
- library("car")

### 2. Loading Data
- Imported the dynamic pricing dataset from - https://www.kaggle.com/datasets/arashnic/dynamic-pricing-dataset/data.
- Rows: 1,000, Columns: 10
- Dataset includes features like:
  - Number of Riders / Drivers
  - Location Category
  - Customer Loyalty Status
  - Number of Past Rides
  - Average Ratings
  - Time of Booking
  - Vehicle Type
  - Expected Ride Duration
  - Historical Cost of Ride (Target Variable)

### 3. Data Pre-processing
- Checked for null values (none found) and duplicates
- Performed encoding for categorical columns:
  - One-Hot Encoding for Location_Category, Time_of_Booking
  - Label Encoding for Customer_Loyalty_Status, Vehicle_Type
- Capped outliers using IQR
- Visualized distributions using histograms and boxplots
- Saved the cleaned dataset to CSV for reuse

### 4. Exploratory Data Analysis (EDA)
- Explored relationships using scatter plots and histograms
- Built a correlation matrix to examine inter-feature dependencies
- Observed strong correlation between ride duration and ride cost

### 5. Feature Engineering
- Introduced new meaningful features to improve model predictions:
  - Ride Density: Indicates the level of demand relative to driver availability, helping to understand ride demand intensity.
  - Surge_Indicator: Indicates whether there is a surge in demand for rides, based on the ratio of riders to drivers.
  - Peak_Hours_Flag: Indicates whether the ride was booked during peak times of the day, such as morning, afternoon, or evening.

### 6. Model Training
- Implemented regression models in R, including:
  - Random Forest Regressor
  - Gradient Boosting Regressor
- Further tuned hyperparameters using cross-validation techniques for both the regressors and compared the results for the best model.

### 7. Model Evaluation & Optimization
- Evaluated models using Mean Absolute Error (MAE) & R-squared (R²)
----
#### 📊 Initial Performance

| Model          | MAE    | R²     |
|----------------|--------|--------|
| Random Forest  | 55.93  | 0.8756 |
| XGBoost        | 57.23  | 0.8515 |


#### 🔧 After Tuning (Grid Search + 5-fold CV)

| Model           | MAE    | R²     |
|-----------------|--------|--------|
| Tuned RF        | 51.79  | 0.8793 |
| Tuned XGBoost   | 51.78  | 0.8846 |
---
✅ Conclusion: Tuned XGBoost performed the best with the lowest MAE and highest R².

### 8. Results and Insights
- 🔑 Feature Importance (XGBoost):
  - Expected_Ride_Duration – Most important, high gain & frequency
  - Vehicle_Type – Moderate impact
  - Average_Ratings, Ride_Density, Number_of_Riders – Moderate influence
  - Customer_Loyalty_Status, Number_of_Past_Rides – Low impact
  - Time_of_Booking, Location_Category – Minimal contribution
- 📊 Key Takeaways:
  - Ride duration is the strongest predictor of cost.
  - Tuning significantly improves model accuracy.
  - Categorical features like time of booking have lesser influence than numerical drivers.

### 9. Technologies Used
- Dataset: Kaggle dataset (Dynamic Pricing)
- Programming Language: R
- IDE: Google Colab + Ubuntu
- Libraries: randomForest, xgboost, caret, ggplot2, dplyr, corrplot, ranger
- Techniques: Grid search, cross-validation, outlier capping, feature importance analysis

### 10. Authors
- Anjum Mehnaz Akumalla
  - Final semester Data Science student at UTA | Dynamic pricing & ML enthusiast
