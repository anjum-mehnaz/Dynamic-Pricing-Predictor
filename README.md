# Dynamic-Pricing-Predictor
## Dynamic Pricing Strategy for Ride Optimization
### Project Overview
This project leverages machine learning in R to predict optimal ride fares based on real-time demand, supply, and customer attributes. The goal is to support dynamic pricing strategies for ride-sharing platforms while ensuring fairness, affordability, and profitability.

## Table of Contents
1. Loading Data
2. Data Pre-processing
3. Exploratory Data Analysis (EDA)
4. Feature Engineering
5. Model Training
6. Model Evaluation
7. Results and Insights
8. Technologies Used
9. Authors

### 1. Loading Data
Imported the dynamic pricing dataset from - https://www.kaggle.com/datasets/arashnic/dynamic-pricing-dataset/data.
Inspected structure, data types, and missing values.

2. Data Pre-processing
Handled missing data and removed outliers.
Converted categorical variables to factors.
Normalized numerical features to improve model performance.

3. Exploratory Data Analysis (EDA)
Used pair plots, scatter plots, and box plots to explore relationships between features.
Identified correlations and patterns influencing ride costs.

4. Feature Engineering
Created new features from existing variables such as time of day, location category, and customer loyalty.
Analyzed feature importance using Random Forest and Gradient Boosting models.

5. Model Training
Implemented regression models in R, including:
Random Forest Regressor
Gradient Boosting Regressor
Tuned hyperparameters using cross-validation techniques.

6. Model Evaluation
Evaluated models using:
Mean Absolute Error (MAE)
R-squared (R²)
Compared model performance to select the best predictor.

7. Results and Insights
Identified key factors influencing ride pricing such as ride duration, vehicle type, and driver availability.
Provided insights to support data-driven pricing decisions.

8. Technologies Used
R Language
ggplot2, dplyr, randomForest, gbm
RStudio
Kaggle dataset (Dynamic Pricing)

9. Authors
Anjum Mehnaz Akumalla
