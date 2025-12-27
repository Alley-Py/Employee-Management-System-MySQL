-- ************************4. LEAVE AND ABSENCE PATTERNS ************************
-- ------------------------------------------------------------------------------
-- 1.Which month had the most employees taking leaves?
SELECT 
	MONTHNAME(l.date) AS MONTH_, -- Getting month name from thr date colum
    COUNT(*) AS No_of_Leaves    -- Gettig all the number of leaves
FROM 
	leaves AS l  -- getting above info from the leaves table
GROUP BY 
	MONTH_  -- Grouped the leaves by monthname
ORDER BY 
	NO_of_Leaves DESC; -- arranged leaves in descending order
-- ----------------------------------------------------------------------------

-- 2.What is the average number of leave days taken by its employees per department?
SELECT 
	j.jobdept AS Department,
    ROUND(COUNT(l.leave_ID)/COUNT(DISTINCT e.emp_ID),0) AS AVG_no_of_Leaves
FROM 
	jobdepartment AS j 
INNER JOIN 
	employee AS e 
INNER JOIN 
	leaves AS l
ON 
	e.emp_ID=l.emp_ID 
AND 
	j.Job_ID=e.Job_ID
GROUP BY 
	Department;
-- ---------------------------------------------------------------

-- 3.Which employees have taken the most leaves?
SELECT 
	e.emp_ID AS Emp_ID,
    e.firstname AS FirstName,
    e.lastname AS LastName,
    COUNT(l.emp_ID) AS No_of_Leaves
FROM 
	leaves AS l
INNER JOIN 
	employee AS e 
ON 
	e.emp_ID=l.emp_ID 
GROUP BY 
	e.emp_ID
ORDER BY
	No_of_Leaves DESC
LIMIT 5;
-- ----------------------------------------------------------------------------

-- 4.What is the total number of leave days taken company-wide?
 SELECT 
	COUNT(leave_ID) AS Total_No_of_Leaves
FROM 
	leaves;
-- ----------------------------------------------------------

-- 5.How do leave days correlate with payroll amounts?
SELECT 
	p.leave_id,
    COUNT(l.date) AS leave_days,
    SUM(p.total_amount) AS total_payroll
FROM
	payroll as p
INNER JOIN
	leaves AS l
ON
	p.leave_ID=l.leave_ID
GROUP BY 
	p.leave_ID;