--  *********1. EMPLOYEE INSIGHTS*************
-- ********************************************--
-- 1. How many unique employees are currently in the system?
SELECT DISTINCT -- getting dictint employee ID as it is a primary key that is uniquie to each employee
    count(emp_ID) AS no_of_employees -- using aggrigate func to get count of total employees
FROM
    employee;
-- --------------------------------------------------------
-- 2.Which departments have the highest number of employees?
SELECT 
    j.jobdept AS Department, 
    COUNT(emp_ID) AS no_of_Employees
FROM
    employee AS e
INNER JOIN
    jobdepartment AS j 
ON 
	e.Job_ID = j.Job_ID
GROUP BY 
	j.jobdept
ORDER BY 
	No_of_Employees DESC
LIMIT 1;
-- -----------------------------------------
-- 3.What is the average salary per department? (ANNUAL)
SELECT 
	j.jobdept AS Department,
	ROUND(avg(s.annual),2) AS Average_Annual_Salary
FROM 
	jobdepartment AS j 
INNER JOIN
	salarybonus AS s
ON 
	s.Job_ID=j.Job_ID
GROUP BY 
	j.jobdept
ORDER BY
	Average_Annual_Salary DESC;
-- -------------------------------------------
-- 4.Who are the top 5 highest-paid employees?
SELECT Emp_id,First_Name,Last_Name,Salary,_RANK FROM
(SELECT 
	e.emp_ID AS Emp_ID,
    e.firstname AS First_Name,
    e.lastname AS Last_Name,
    s.amount AS Salary,
    DENSE_RANK() OVER(ORDER BY s.amount DESC) AS _RANK
FROM
	employee AS e 
INNER JOIN 
	salarybonus AS s
ON
	e.Job_ID=s.Job_ID) AS SUB
WHERE 
	_RANK<=5;
    
-- 5.What is the total salary expenditure across the company?
SELECT 
	ROUND(SUM(annual+bonus),0) AS Annual_Salary_Expenditure_of_Compnay
FROM 
	salarybonus;
-- -------------------------------------------
select * FROM salarybonus;