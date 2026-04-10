# 📊 Profit Leakage Analysis — Superstore Retail

## 🔍 Problem Statement
A retail company is generating strong sales numbers but struggling with low profits.
The goal of this project is to find **why profit is leaking** despite good sales —
and provide actionable business recommendations to fix it.

> *"Companies don't fail because of low sales. They fail because of poor profit margins."*

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| Python (Pandas, Matplotlib, Seaborn) | Data cleaning, EDA, visualizations |
| MySQL | Business queries, structured data analysis |
| Power BI | Interactive dashboard, business presentation |

---

## 📁 Project Structure

```
profit-leakage-analysis/
│
├── profit_leakage_analysis.ipynb      # Python EDA and analysis (Jupyter Notebook)
├── profit_leakage_queries.sql         # All 10 business SQL queries
├── Profit_Leakage_Dashboard.pbix      # Interactive Power BI dashboard
│
├── chart1_sales_vs_profit.png         # Sales vs Profit scatter plot
├── chart2_discount_vs_profit.png      # Discount impact on profit
├── chart3_profit_by_category.png      # Profit by category and sub-category
├── chart4_regional_performance.png    # Regional sales vs profit
├── chart5_loss_products.png           # Top 10 loss-making products
├── Dashboard Screenshort.png          # Full Power BI dashboard screenshot
│
└── README.md
```

---

## 📊 Dataset
- **Source:** Sample Superstore Dataset (Kaggle)
- **Size:** 9,994 orders | 21 columns
- **Period:** 2014 – 2017
- **Key columns:** Sales, Profit, Discount, Category, Sub-Category, Region

---

## 🔎 Key Findings

### 1. 🎯 Discount is Destroying Profit
Orders with **40%+ discounts generate negative profit** on average.
The company is selling products at a loss to offer heavy discounts.

| Discount Level | Avg Profit per Order |
|---------------|---------------------|
| No discount (0%) | Positive |
| Low (1–20%) | Positive |
| Medium (21–40%) | Low positive |
| High (41–80%) | **Negative (LOSS)** |

### 2. 🪑 Furniture Category is a Loss Maker
Despite having significant sales volume, the **Furniture category has the lowest profit margin**.
Sub-categories **Tables** and **Bookcases** consistently generate losses across all regions.

### 3. 🗺️ Central Region Underperforms
The **Central region** has the highest average discount rate and the lowest profit margin
among all four regions — West, East, Central, South.

### 4. 📦 Top Loss-Making Products
10 specific products account for a large portion of total losses.
Most of them have average discounts above 40% — confirming the discount problem.

---

## 💡 Business Recommendations

1. **Cap discounts at 20%** for all Furniture category products immediately
2. **Evaluate Tables and Bookcases** sub-categories — reprice or discontinue
3. **Audit Central region** sales incentive structure — reduce discount approvals
4. **Shift marketing focus** to Technology category which has the highest profit margin
5. **Set discount approval process** — any discount above 30% requires manager sign-off

---

## 📈 Dashboard Preview

### Full Dashboard
![Full Dashboard](Dashboard%20Screenshort.png)

### Loss-Making Products Table
![Loss Products](chart5_loss_products.png)

---

## 🐍 Python Analysis — What Was Done

- Loaded and cleaned 9,994 rows of retail data
- Fixed data types, removed duplicates, engineered new columns
- Performed 5 key analyses:
  - Sales vs Profit scatter (identified loss-making orders)
  - Discount bucket analysis (proved discount-profit relationship)
  - Category and Sub-category profit breakdown
  - Regional performance comparison
  - Top 10 loss-making products identification
- Generated 5 charts saved as PNG files

## 🗄️ SQL Analysis — Key Queries

- Overall business performance summary
- Profit by Category and Sub-Category
- Discount impact analysis using CASE statements
- Regional breakdown with profit margin %
- Top 10 loss products using HAVING clause
- Year-over-year trend analysis
- Combined Region + Sub-Category problem matrix (advanced query)

---

## 🚀 How to Run This Project

### Python
```bash
pip install pandas matplotlib seaborn jupyter
jupyter notebook
# Open profit_leakage_phase1.py and run each cell
```

### SQL
```sql
-- Open MySQL Workbench
-- Run profit_leakage_queries.sql
-- All queries work on superstore_db.superstore table
```

### Power BI
```
Open Profit_Leakage_Dashboard.pbix in Power BI Desktop
Use slicers to filter by Category, Region, and Year
```

---

## 👤 About Me
I am an aspiring Data Analyst skilled in Python, SQL, and Power BI.
This project was built to demonstrate real-world business analysis skills
using industry-standard tools.

📧 [Your Email]
💼 [Your LinkedIn URL]
🐙 [Your GitHub URL]

---

*This project uses the publicly available Sample Superstore dataset from Kaggle.*
