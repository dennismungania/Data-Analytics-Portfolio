# 📝 World Life Expectancy SQL Project Report

## 🔍 Project Overview

This SQL project involves cleaning and analyzing the **World Life Expectancy** dataset using MySQL. It includes data quality checks, missing value imputation, and exploratory data analysis (EDA) to uncover trends and relationships, particularly with GDP and development status.

---

## 🧹 PART 1: Data Cleaning Summary

### ✅ 1. Duplicate Records
- Used `ROW_NUMBER()` with `PARTITION BY Country, Year` to identify duplicates.
- Deleted entries where `Row_Num > 1`.

### ✅ 2. Missing `Status`
- Populated missing values using peer country entries:
  - If other rows for the same country were labeled "Developing", the blank was set to "Developing".
  - The same logic was applied for "Developed".

### ✅ 3. Missing `Life Expectancy`
- Imputed values by averaging the life expectancy of the **previous and next year** for the same country.

---

## 📊 PART 2: Exploratory Data Analysis (EDA)

### 🔹 1. Countries with Greatest Increase in Life Expectancy
- Query compared min and max life expectancy per country.
- Found which countries improved most from earliest to latest year.
- **Insight**: Some countries saw over 30 years of improvement.

### 🔹 2. Average Life Expectancy Over Time
- Yearly trend using:
  ```sql
  SELECT Year, ROUND(AVG(`Life Expectancy`),2)
  ```
- **Insight**: Steady global increase over the years, reflecting improved healthcare and development.

### 🔹 3. GDP vs Life Expectancy by Country
- Average GDP and life expectancy per country were compared.
- **Insight**: Strong positive correlation found — countries with higher GDPs tend to have higher life expectancies.

### 🔹 4. High vs Low GDP Impact
- Countries split into two groups: GDP ≥ 1500 and GDP < 1500.
- Calculated average life expectancy for both.
- **Insight**:
  - High GDP Countries: Significantly higher average life expectancy.
  - Low GDP Countries: Lower, consistent with economic-health outcomes linkage.

### 🔹 5. Developed vs Developing Countries
- Grouped countries by `Status`:
  ```sql
  SELECT Status, COUNT(DISTINCT Country), AVG(`Life Expectancy`)
  ```
- **Insight**:
  - Developed countries had higher average life expectancy.
  - Fewer developing countries reached the highest life spans.

---

## ✅ Summary of Insights

| Insight Category             | Key Takeaway                                                  |
|-----------------------------|---------------------------------------------------------------|
| Life Expectancy Improvement | Some countries improved by 20+ years over the dataset period. |
| Global Trend                | Average life expectancy is increasing globally.               |
| GDP Correlation             | Strong positive correlation between GDP and life expectancy.  |
| Economic Divide             | High GDP countries live longer than low GDP counterparts.     |
| Development Divide          | Developed countries have better life outcomes.                |


