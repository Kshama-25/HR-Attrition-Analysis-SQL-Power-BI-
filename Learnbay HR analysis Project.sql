USE Learn_bay_March;

SELECT * FROM [HR Data];

--Q-1: What is the overall attrition rate in the company?

SELECT COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS Attrition_Rate
FROM [HR Data];

--Explaination: The result shows the attrition rate as a percentage, helping us understand what proportion of employees have left the company.--

--Q-2: Is there a significant difference in attrition rates between different age bands or departments?

SELECT  Age, COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM [HR Data]
GROUP BY Age
ORDER BY Age;

--The output shows Age, Total Employees in that age, and how many of them left the company.--

--Q3: Does the presence of overtime have any correlation with attrition?

SELECT  [Over Time], COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100) / COUNT(*) AS Attrition_Rate
FROM [HR Data]
GROUP BY [Over Time];

--Q-4: What is the gender distribution among employees?

SELECT Gender,
COUNT(*) AS Total_Employees
FROM [HR Data]
GROUP BY Gender;

--“I grouped employees by gender and counted the total number in each category.”

--Q-5: Are there any differences in attrition rates based on education fields or levels?

SELECT Education,
COUNT(*) AS Total,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition
FROM [HR Data]
GROUP BY Education;

--I grouped employees by education field and level, then counted how many employees left to compare attrition.

--Q-6: Is there a relationship between performance ratings and attrition rates?

SELECT [Performance Rating],
COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM [HR Data]
GROUP BY [Performance Rating];

--I grouped employees by performance rating and counted how many employees left in each group.

--Q-7:How does employee satisfaction (environment satisfaction, job satisfaction, relationship satisfaction) impact attrition?

----Environment Satisfaction vs Attrition---
SELECT [Environment Satisfaction],
COUNT(*) AS Total,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Left_Employees
FROM [HR Data]
GROUP BY [Environment Satisfaction]
ORDER BY [Environment Satisfaction];

-----Job Satisfaction vs Attrition----
SELECT [Job Satisfaction],
COUNT(*) AS Total,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Left_Employees
FROM [HR Data]
GROUP BY [Job Satisfaction]
ORDER BY [Job Satisfaction];

----Relationship Satisfaction vs Attrition-----
SELECT [Relationship Satisfaction],
COUNT(*) AS Total,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Left_Employees
FROM [HR Data]
GROUP BY [Relationship Satisfaction]
ORDER BY [Relationship Satisfaction];

--I grouped employees by satisfaction levels and counted how many employees left in each group.

--Q-8: Does work-life balance impact the number of years an employee stays with the company? 

SELECT [Work Life Balance],
AVG(CAST([Years At Company] AS INT)) AS Avg_Years
FROM [HR Data]
GROUP BY [Work Life Balance]
ORDER BY [Work Life Balance];

--I grouped employees by work-life balance and calculated the average number of years they stay in the company.

--Q-9: Is there any correlation between the total working years and attrition rates?

SELECT [Total Working Years],
COUNT(*) AS Total,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Left_Employees
FROM [HR Data]
GROUP BY [Total Working Years]
ORDER BY [Total Working Years];

--I grouped employees by total working years and counted how many employees left in each group.--

--Q-10: Are employees who stay longer with the company more likely to get promotions?

SELECT [Years At Company],
AVG(CAST([Years Since Last Promotion] AS INT)) AS Avg_Promotion_Time
FROM [HR Data]
GROUP BY [Years At Company]
ORDER BY [Years At Company];

--I grouped employees by years at the company and calculated the average time since their last promotion.


--Q-11: Does the number of years in the current role affect attrition rates?

SELECT [Years In Current Role],
COUNT(*) AS Total,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition
FROM [HR Data]
GROUP BY [Years In Current Role]
ORDER BY [Years In Current Role];

--I grouped employees by years in their current role and checked how many employees left in each group.

--Q-12: Do employees with higher levels of education perform better or have higher job satisfaction?

SELECT Education,
AVG(CAST([Performance Rating] AS INT)) AS Avg_Performance,
AVG(CAST([Job Satisfaction] AS INT)) AS Avg_Satisfaction
FROM [HR Data]
GROUP BY Education;

--I grouped employees by education level and calculated average performance and job satisfaction.

--Q-13: How does the education level affect the number of companies an employee has worked for?

SELECT Education,
AVG(CAST([Num Companies Worked] AS INT)) AS Avg_Companies
FROM [HR Data]
GROUP BY Education;

--I grouped employees by education level and calculated the average number of companies they have worked for.

 