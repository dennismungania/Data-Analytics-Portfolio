# HR-Attrition-Insights-Dashboard
This Power BI project delivers a data-driven exploration of employee attrition, uncovering patterns across key factors such as age, gender, job role, salary, education level, and work-life balance satisfaction. 
The primary objective is to identify the underlying drivers of employee turnover and equip HR and leadership teams with actionable insights. 
By visualizing attrition trends through an interactive dashboard, the project supports informed decision-making aimed at reducing attrition and strengthening employee retention strategies.

## Project Overview

The dashboard consists of three key pages:
1. **General Overview** – Summary of employee distribution and basic attrition figures.
2. **Workforce Demographics** – Insights into attrition by age, gender, education, and satisfaction.
3. **Job Roles, Salary & Tenure Analysis** – Breakdown of attrition by job role, salary bands, and years at the company.

## Power Query Transformations

The following preprocessing steps were done in Power Query:
- Normalized the `BusinessTravel` and `Gender` columns.
- Replaced `"None"` values with numeric `0` in `YearsAtCompany` and `YearsInCurrentRole` columns.
- Filled blanks with `0` in the last 5 numerical columns.

## Tools Used
- Power BI
- Power Query (for data transformation)

## How to Use
1. Download this repository.
2. Open the Power BI report file (`HR_Attrition.pbix`) in Power BI Desktop.
3. Explore the three interactive dashboard pages for insights on employee attrition.
4. For a detailed explanation of findings and methodology, refer to the accompanying HR_Attrition_Analysis_Report.md file.

## Folder Structure
```
HR_Attrition_Project/
├── HR_Attrition.pbix
├── README.md
├── HR_Attrition_Analysis_Report.md
├── screenshots/
│   ├── page1_overview.png
│   ├── page2_demographics.png
│   └── page3_roles_salary_tenure.png
```

## Author
Dennis Mungania – University of Louisville Graduate Student, MS in Business Analytics
