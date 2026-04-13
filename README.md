📊 HR Attrition Analysis — Employee Retention Insights

🔍 Problem Statement
A company is facing employee attrition, leading to increased hiring costs, loss of productivity, and disruption in operations.

The goal of this project is to identify why employees are leaving and provide actionable insights to improve retention strategies.

Additionally, this project goes beyond analysis by building machine learning models to predict employee attrition risk.

"Employees don’t leave companies. They leave poor management, low pay, and bad work-life balance."

🛠️ Tools Used

Tool	Purpose
Python (Pandas, Matplotlib, Seaborn, Scikit-learn)	Data cleaning, EDA, ML modeling
MySQL	Business queries, structured data analysis
Power BI	Interactive dashboard, business presentation

📁 Project Structure

hr-attrition-analysis/
│
├── hr_attrition_phase1.ipynb # Python EDA
├── hr_attrition_phase2.ipynb # Machine Learning (Models & Predictions)
├── hr_attrition_queries.sql # SQL analysis
├── hr_attrition_dashboard.pbix # Power BI dashboard
│
├── chart1_attrition_overview.png
├── chart2_department_attrition.png
├── chart3_overtime_attrition.png
├── chart4_income_attrition.png
├── chart5_satisfaction_attrition.png
├── chart6_confusion_matrix.png # ML evaluation
├── chart7_roc_curve.png # Model comparison
├── chart8_feature_importance.png # Key drivers
├── chart9_risk_distribution.png # Risk segmentation
├── Dashboard Screenshot.png
│
└── README.md

📊 Dataset
Source: IBM HR Analytics Dataset (Kaggle)
Size: 1,470 employees | 35 columns

Key columns:
Age, MonthlyIncome, JobRole, Department, OverTime, JobSatisfaction

🔎 Key Findings

🎯 Overall Attrition
Employees Left: 237
Attrition Rate: 16.12%
🏢 Department Analysis
Sales → ~20.6% (Highest)
HR → ~19%
R&D → ~13.8% (Lowest)
⏱️ Overtime Impact
No → 10.4%
Yes → 30.5%

👉 Overtime increases attrition ~3x

💰 Salary Impact
Low (0–3K) → 28.6%
High (10K+) → 8.9%

👉 Low salary = major driver

😊 Job Satisfaction
Low → 22.8%
Very High → 11.3%

👉 Satisfaction strongly affects retention

🤖 Machine Learning Analysis

Models Used:

Logistic Regression
Random Forest

📊 Model Performance

Logistic Regression AUC: 0.804
Random Forest AUC: 0.784

👉 Logistic Regression performs slightly better overall

📉 Confusion Matrix Insights

Logistic Regression: Better balance
Random Forest: High accuracy but misses some attrition cases

🔥 Feature Importance (Top Drivers)

Monthly Income
Age
Total Working Years
Salary Per Experience
Years at Company

👉 Compensation + experience = strongest factors

⚠️ Risk Segmentation

Employees categorized into:

🔴 Critical Risk
🟠 High Risk
🟡 Medium Risk
🟢 Low Risk

👉 Enables proactive HR intervention

💡 Business Recommendations

Reduce excessive overtime
Increase salaries for low-income employees
Improve employee engagement
Focus on early-career employees
Monitor high-risk employees using ML predictions

---

## 📈 Dashboard Preview

### Full Dashboard

<img width="1350" height="746" alt="image" src="https://github.com/user-attachments/assets/2386c9c5-6302-4e3f-a77c-b683b9100c3d" />


### Department Attrition

![Department](chart2_department_attrition.png)

---

🐍 Python Analysis

Data cleaning & preprocessing
Feature engineering (salary slabs, age groups)
Exploratory Data Analysis
ML model building (Logistic + Random Forest)
Model evaluation (Confusion Matrix, ROC Curve)
Feature importance analysis
Risk scoring system

🗄️ SQL Analysis

Attrition rate calculation
Department-wise insights
Overtime impact
Salary segmentation
Job satisfaction analysis
Risk profiling

📊 Power BI Dashboard

KPI Cards (Attrition Rate, Total Employees)
Department Analysis
Job Role Insights
Gender & Age Group Analysis
Salary Analysis
Interactive slicers

---

🚀 How to Run

Python
pip install pandas matplotlib seaborn scikit-learn jupyter
jupyter notebook

SQL
Run hr_attrition_queries.sql in MySQL

Power BI
Open hr_attrition_dashboard.pbix

👤 About Me

Aspiring Data Analyst skilled in SQL, Python, Excel, and Power BI.

This project demonstrates:

Business problem solving
Data analysis
Dashboard creation
Machine learning for prediction

📧 Contact

Email: prekshashetty135@gmail.com
GitHub: https://github.com/PrekshaShetty13

⭐ If you found this useful, consider giving a star
