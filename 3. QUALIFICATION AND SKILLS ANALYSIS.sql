-- **************************3. QUALIFICATION AND SKILLS ANALYSIS*******************************
-- ---------------------------------------------------------------------------------------------
-- 1.How many employees have at least one qualification listed?
SELECT
	COUNT(*) AS "Employees with atleast one qualification" 
FROM
	(SELECT 
		e.emp_id AS Emp_ID,
		COUNT(QualID) AS Qualifications
	FROM 
		employee AS e 
	INNER JOIN 
		qualification AS q
	ON 
		e.emp_ID=q.Emp_ID
	GROUP BY 
		e.emp_ID
	HAVING 
		Qualifications>=1) AS SUB;
-- ---------------------------------------------------------------
-- 1. How many employees have at least one qualification listed?
SELECT 
    COUNT(DISTINCT Emp_ID) AS "Employees with atleast one qualification" 
FROM 
    qualification;
-- ----------------------------------------------------------------------
    
-- 2.Which positions require the most qualifications?
SELECT 
	Position,
    COUNT(QualID) AS No_of_Qualifications
FROM 
	qualification
GROUP BY 
	Position
ORDER BY 
	No_of_Qualifications DESC
LIMIT 5;
-- ----------------------------------------------------------------

-- 3. Which employees have the highest number of qualifications?
SELECT 
	e.emp_id AS Emp_ID,
	e.firstname AS FirstName,
    e.lastname AS LastName,
	COUNT(QualID) AS No_of_Qualifications
FROM 
	employee AS e 
INNER JOIN 
	qualification AS q
ON 
	e.emp_ID=q.Emp_ID
GROUP BY 
	e.emp_ID
ORDER BY 
	No_of_Qualifications DESC
LIMIT 5;

