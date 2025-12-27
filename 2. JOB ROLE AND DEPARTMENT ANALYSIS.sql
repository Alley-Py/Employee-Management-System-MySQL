-- ***************2. JOB ROLE AND DEPARTMENT ANALYSIS**************************
-- ----------------------------------------------------------------------------
-- 1.How many different job roles exist in each department?
SELECT 
	jobdept AS Department,
    COUNT(DISTINCT(name)) AS Different_Job_Roles
FROM
    jobdepartment
GROUP BY
	jobdept
ORDER BY Different_Job_Roles DESC;
-- --------------------------------------------------
-- 2.What is the average salary range per department?
SELECT 
    j.jobdept AS Department,
    ROUND(AVG(s.amount), 2) AS Average_Salary
FROM
    jobdepartment AS j
INNER JOIN
    salarybonus AS s 
ON 
	j.Job_ID = s.Job_ID
GROUP BY 
	Department
ORDER BY 
	Average_Salary DESC;
-- ---------------------------------------------------
-- 3. Which job roles offer the highest salary? 
SELECT 
    j.name AS Job_Role,
    MAX(s.amount) AS Salary
FROM
    jobdepartment AS j
INNER JOIN
    salarybonus AS s 
ON 
	j.Job_ID = s.Job_ID
GROUP BY 
	Job_Role
ORDER BY 
	Salary DESC
LIMIT 1; -- addiing limit 1 to get the highest salary as it is ordered on descending

-- -----------------------------------------------------------
-- 4.Which departments have the highest total salary allocation?
SELECT 
	j.jobdept AS Department,
    SUM(s.annual+s.bonus) AS Total_Salary
FROM 
	jobdepartment AS j 
INNER JOIN
	salarybonus AS s 
ON
	j.Job_ID=s.Job_ID
GROUP BY 
	Department
ORDER BY 
	Total_Salary DESC
LIMIT 5;
    
SELECT * FROM jobdepartment;