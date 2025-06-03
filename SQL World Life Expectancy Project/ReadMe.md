# 🌍 World Life Expectancy - SQL Data Cleaning and EDA Project

This project involves cleaning and exploring the **World Life Expectancy** dataset using SQL. 
It includes data quality fixes (duplicates and missing values) and thorough exploratory data analysis to uncover key trends.

---

## 📌 Objectives

- Remove duplicate records using SQL window functions.
- Handle missing values in `Status` and `Life Expectancy` fields.
- Analyze life expectancy trends globally and across GDP groups.
- Compare health outcomes between developed and developing countries.

---

## 🧰 Tools Used

- MySQL / SQL
- SQL window functions: `ROW_NUMBER()`, `JOIN`, `CASE`
- Aggregations: `GROUP BY`, `HAVING`, `AVG`, `MIN`, `MAX`

---

## 📂 Dataset

The dataset is stored in a MySQL table: `world_life_expectancy`. Key fields:
- `Country`
- `Year`
- `Status` (Developed/Developing)
- `Life Expectancy`
- `GDP`
- `Row_ID` (unique identifier)

---

## 🧹 PART 1: Data Cleaning

### 🔸 1. Remove Duplicates
- Used `ROW_NUMBER()` to identify multiple rows with the same `Country + Year`.
- Deleted rows where the row number exceeded 1.

### 🔸 2. Handle Missing `Status`
- Used self joins to fill blanks with either 'Developing' or 'Developed' based on peer records for the same country.

### 🔸 3. Handle Missing `Life Expectancy`
- Imputed using the average life expectancy from the previous and next year for the same country.

---

## 📊 PART 2: Exploratory Data Analysis (EDA)

### 🔹 Countries with Most Improvement
- Measured increase in life expectancy over the time span per country.

### 🔹 Global Trend Over Time
- Tracked average global life expectancy per year.

### 🔹 GDP vs Life Expectancy
- Compared average GDP and life expectancy by country.

### 🔹 High vs Low GDP Groups
- Compared health outcomes for countries with GDP above and below 1500.

### 🔹 Developed vs Developing Nations
- Compared number of countries and average life expectancy by development status.

---

## 📁 Files Included

- `WorldLifeExpectancy.sql` - SQL Script To define the schema (structure) of the dataset in your database. 
- `World_Life_Expectancy_Full_Project.sql` – SQL scripts for cleaning and analysis
- `World_Life_Expectancy_Report.md` – EDA report and insights
- `README.md` – This project overview

---

## 👤 Author

**Dennis Mungania**  
Graduate Student | Business Analytics | University of Louisville  
[LinkedIn](www.linkedin.com/in/dennismungania) | [GitHub](https://github.com/dennismungania/Data-Analytics-Portfolio)

---



