CREATE DATABASE IF NOT EXISTS hr_db;
USE hr_db;
SELECT COUNT(*) AS total_rows FROM hr_attrition;

-- QUERY 1 — Overall Attrition Summary
SELECT
    COUNT(*)                                            AS total_employees,
    SUM(Attrition_Flag)                                 AS employees_left,
    COUNT(*) - SUM(Attrition_Flag)                      AS employees_stayed,
    ROUND(SUM(Attrition_Flag) / COUNT(*) * 100, 2)      AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0)                        AS avg_monthly_income,
    ROUND(AVG(Age), 1)                                  AS avg_age,
    ROUND(AVG(YearsAtCompany), 1)                       AS avg_tenure_years
FROM hr_attrition;
-- INSIGHT: Above industry average of 10-15% — company has a retention problem

-- QUERY 2 — Attrition by Department
SELECT
    Department,
    COUNT(*)                                            AS total_employees,
    SUM(Attrition_Flag)                                 AS employees_left,
    ROUND(SUM(Attrition_Flag) / COUNT(*) * 100, 2)      AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0)                        AS avg_salary,
    ROUND(AVG(JobSatisfaction), 2)                      AS avg_satisfaction
FROM hr_attrition
GROUP BY Department
ORDER BY attrition_rate_pct DESC;
-- INSIGHT: Sales team faces highest pressure — needs immediate attention

-- QUERY 3 — OverTime Impact (KEY QUERY)
SELECT
    OverTime,
    COUNT(*)                                            AS total_employees,
    SUM(Attrition_Flag)                                 AS employees_left,
    ROUND(SUM(Attrition_Flag) / COUNT(*) * 100, 2)      AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0)                        AS avg_salary,
    ROUND(AVG(JobSatisfaction), 2)                      AS avg_satisfaction,
    ROUND(AVG(WorkLifeBalance), 2)                      AS avg_worklife_balance
FROM hr_attrition
GROUP BY OverTime
ORDER BY attrition_rate_pct DESC;
-- INSIGHT:
--   "Overtime employees leave 2.9x more. This single finding
--    drives our entire recommendation to cap mandatory overtime."

-- QUERY 4 — Income Bracket Analysis
SELECT
    CASE
        WHEN MonthlyIncome < 3000              THEN '1. Low (0-3K)'
        WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN '2. Medium (3K-6K)'
        WHEN MonthlyIncome BETWEEN 6001 AND 10000 THEN '3. High (6K-10K)'
        ELSE                                        '4. Very High (10K+)'
    END                                             AS income_bracket,
    COUNT(*)                                        AS total_employees,
    SUM(Attrition_Flag)                             AS employees_left,
    ROUND(SUM(Attrition_Flag) / COUNT(*) * 100, 2)  AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0)                    AS avg_income
FROM hr_attrition
GROUP BY income_bracket
ORDER BY income_bracket;
-- INSIGHT: Salary is inversely related to attrition — pay more, lose less

-- QUERY 5 — Job Satisfaction Analysis
SELECT
    CASE JobSatisfaction
        WHEN 1 THEN '1 - Low'
        WHEN 2 THEN '2 - Medium'
        WHEN 3 THEN '3 - High'
        WHEN 4 THEN '4 - Very High'
    END                                             AS satisfaction_level,
    COUNT(*)                                        AS total_employees,
    SUM(Attrition_Flag)                             AS employees_left,
    ROUND(SUM(Attrition_Flag) / COUNT(*) * 100, 2)  AS attrition_rate_pct
FROM hr_attrition
GROUP BY JobSatisfaction, satisfaction_level
ORDER BY JobSatisfaction;
-- INSIGHT: Direct relationship between satisfaction and retention

-- QUERY 6 — High Risk Employee Profile (Advanced Query)
SELECT
    EmployeeNumber,
    Age,
    Department,
    JobRole,
    MonthlyIncome,
    YearsAtCompany,
    JobSatisfaction,
    OverTime,
    WorkLifeBalance,
    CASE
        WHEN OverTime = 'Yes'
         AND JobSatisfaction <= 2
         AND YearsAtCompany <= 3      THEN 'CRITICAL RISK'
        WHEN OverTime = 'Yes'
         AND JobSatisfaction <= 2     THEN 'HIGH RISK'
        WHEN OverTime = 'Yes'
         OR  JobSatisfaction = 1      THEN 'MEDIUM RISK'
        ELSE                               'LOW RISK'
    END                                             AS risk_level
FROM hr_attrition
WHERE Attrition = 'No'
HAVING risk_level IN ('CRITICAL RISK', 'HIGH RISK')
ORDER BY risk_level, MonthlyIncome ASC
LIMIT 20;
-- INSIGHT:
--   "I built a risk scoring model in SQL that flags current employees
--    most likely to leave — so HR can act before it's too late."

-- QUERY 7 — Department + OverTime Combined Analysis
SELECT
    Department,
    OverTime,
    COUNT(*)                                            AS total_employees,
    SUM(Attrition_Flag)                                 AS employees_left,
    ROUND(SUM(Attrition_Flag) / COUNT(*) * 100, 2)      AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0)                        AS avg_salary
FROM hr_attrition
GROUP BY Department, OverTime
ORDER BY attrition_rate_pct DESC;
-- INSIGHT:
--   "Sales + OverTime combination has the highest attrition —
--    that specific group needs immediate salary review and overtime reduction."

-- QUERY 8 — Tenure Analysis (When Do Employees Leave?)
SELECT
    CASE
        WHEN YearsAtCompany <= 2   THEN '0-2 years (New)'
        WHEN YearsAtCompany <= 5   THEN '3-5 years (Early)'
        WHEN YearsAtCompany <= 10  THEN '6-10 years (Mid)'
        ELSE                            '10+ years (Senior)'
    END                                             AS tenure_group,
    COUNT(*)                                        AS total_employees,
    SUM(Attrition_Flag)                             AS employees_left,
    ROUND(SUM(Attrition_Flag) / COUNT(*) * 100, 2)  AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0)                    AS avg_salary
FROM hr_attrition
GROUP BY tenure_group
ORDER BY attrition_rate_pct DESC;
-- INSIGHT: Onboarding and early career support is critical

-- QUERY 9 — Age Group Analysis
SELECT
    CASE
        WHEN Age < 25              THEN '1. Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '2. Age 25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '3. Age 35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '4. Age 45-54'
        ELSE                            '5. Age 55+'
    END                                             AS age_group,
    COUNT(*)                                        AS total_employees,
    SUM(Attrition_Flag)                             AS employees_left,
    ROUND(SUM(Attrition_Flag) / COUNT(*) * 100, 2)  AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0)                    AS avg_salary
FROM hr_attrition
GROUP BY age_group
ORDER BY age_group;
-- INSIGHT:
-- Under 25 and 25-34 → highest attrition (young professionals job-hopping)
-- 45+ → lowest attrition (more stable, less likely to switch)

-- QUERY 10 — Full Risk Summary Dashboard Query
SELECT
    Department,
    OverTime,
    CASE JobSatisfaction
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
    END                                             AS satisfaction_level,
    COUNT(*)                                        AS total_employees,
    SUM(Attrition_Flag)                             AS employees_left,
    ROUND(SUM(Attrition_Flag) / COUNT(*) * 100, 2)  AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0)                    AS avg_salary
FROM hr_attrition
GROUP BY Department, OverTime, JobSatisfaction, satisfaction_level
HAVING SUM(Attrition_Flag) > 0
ORDER BY attrition_rate_pct DESC
LIMIT 15;
-- INSIGHT:
--   "This query combines 3 dimensions — department, overtime, and satisfaction —
--    to show exactly which combination of factors drives the highest attrition.
--    It gives management a prioritized action list in one query."
 