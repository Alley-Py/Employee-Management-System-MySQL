-- ***********************5. PAYROLL AND COMPENSATION ANALYSIS***********************
-- ----------------------------------------------------------------------------------
--  1. What is the total monthly payroll processed?
SELECT
	MONTH(date) AS Month,
    SUM(total_amount) AS Total_Payroll
FROM 
	payroll
GROUP BY 
	Month
ORDER BY 
	Total_Payroll;
-- -------------------------------------------------------
    
-- 2. What is the average bonus given per department?
SELECT 
	j.jobdept AS Department,
    ROUND(AVG(s.bonus),2) AS AVG_Bonus
FROM 
	jobdepartment AS j 
INNER JOIN
	salarybonus AS s 
ON
	j.Job_ID=s.Job_ID
GROUP BY 
	Department
ORDER BY 
	AVG_Bonus DESC;
-- ------------------------------------------------------

-- 3. Which department receives the highest total bonuses?
SELECT 
	j.jobdept AS Department,
    SUM(s.bonus) AS Total_Bonus
FROM 
	jobdepartment AS j 
INNER JOIN
	salarybonus AS s 
ON
	j.Job_ID=s.Job_ID
GROUP BY 
	Department
ORDER BY 
	Total_Bonus DESC
LIMIT 1;
-- ---------------------------------------------------------------------------------

-- 4. What is the average value of total_amount after considering leave deductions?
SELECT
	AVG(total_amount) AS "Average Payroll"
FROM
	payroll;
-- *******************************************************************************
