# HR Attrition Insights Report

## 1. Introduction

This report presents an analysis of employee attrition within a company using a Power BI dashboard. The analysis is aimed at identifying trends in attrition based on various demographic and employment attributes.

## 2. Summary of Dashboard Pages

### Page 1: General Overview
- Displays total employees (1480) and attrition count (238).
- Gender distribution: 60% Male, 40% Female.
- Major employee groups: 26-35 age group and Life Sciences/Medical education.

### Page 2: Workforce Demographics
- Attrition rate: 16%.
- Average employee age: 37.
- Average salary: $6.5K/month.
- Highest attrition in Life Sciences and among ages 26-35.
- Work-life satisfaction level 3 has highest attrition count.

### Page 3: Job Roles, Salary & Tenure
- Research Scientists show the highest attrition.
- Salary bracket "Up to $5K" has highest attrition.
- Most attrition occurs in the first 2 years at the company.

## 3. Data Preparation

Transformations applied in Power Query:
- **Normalization**: Applied to `BusinessTravel` and `Gender` to standardize values.
- **Data Cleaning**:
  - Replaced `"None"` with numeric `0` in `YearsAtCompany` and `YearsInCurrentRole`.
  - Replaced blanks with `0` in the last 5 numerical columns to avoid NA issues.

## 4. DAX Measures

To support KPI tracking and custom calculations, the following DAX measure was created:
- **Attrition Rate** = `DIVIDE(SUM(FactHR_Data[Attrition_Count]), SUM(FactHR_Data[EmployeeCount]))`

This measure dynamically calculates the attrition rate across all visual filters, providing a responsive metric for trend analysis.

## 5. Key Insights
- Newer employees (0–2 years) are at higher risk of attrition.
- Males have a higher attrition count.
- Employees with lower work-life balance satisfaction or lower salaries are more likely to leave.
- Certain roles, like Research Scientist, experience significantly higher turnover.

## 6. Recommendations
- Improve onboarding and support for new hires.
- Investigate causes of dissatisfaction in key roles.
- Consider targeted retention strategies for employees in low salary brackets.

## 7. Conclusion

This dashboard provides actionable insights into attrition patterns that can guide 
HR and management teams in refining employee retention strategies.
