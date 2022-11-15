-- CROSS JOINS
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d;
  
  -- question to find average salary of genders in my database
SELECT 
    E.gender, AVG(salary) AS Avg_Salary
FROM
    salaries S
        JOIN
    employees E ON E.emp_no = S.emp_no
GROUP BY E.gender; -- good coding practice add both table and column

select E.emp_no, E.first_name, E.emp_no, E.last_name, E.hire_date, dm.from_date, d.dept_name
-- emp_no isn't supposed to be there
from
	Employees E
join 
	dept_manager dm ON E.emp_no= dm.emp_no
 -- first	and a relationship before adding another join   
join 
	departments d ON dm.dept_no=d.dept_no
order by E.emp_no;

SELECT
d.dept_name, AVG(salary)
FROM
departments d
JOIN dept_manager m ON d.dept_no = m.dept_no
JOIN
salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name;

DROP TABLE IF EXISTS employees_dup;
CREATE TABLE employees_dup (
emp_no int(11),
birth_date date,
first_name varchar(14),
last_name varchar(16),
gender enum('M','F'),
hire_date date
);
INSERT INTO employees_dup
SELECT
e.*            -- inserting from one table into another table
              -- inserting employees from employees table into the new employees_dup table
FROM
employees e
LIMIT 20;
-- Check
SELECT
*
FROM
employees_dup
;
INSERT INTO employees_dup VALUES
('10001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');
-- Check
SELECT
*
FROM
employees_dup;

-- UNION ALL
SELECT
e.emp_no,
e.first_name,
e.last_name,
NULL AS dept_no,  -- why null because the columns 1st and 2nd table from e.g. dept_manager and employee  has to be the same
NULL AS from_date
FROM
employees_dup e
WHERE
e.emp_no = 10001
UNION ALL SELECT -- brings out all including duplicates
NULL AS emp_no,
NULL AS first_name,  -- -- why null because the columns 1st and 2nd table from e.g. dept_manager and employee  has to be the same
NULL AS last_name,
m.dept_no,
m.from_date
FROM
dept_manager m;
-- UNION
SELECT
e.emp_no,
e.first_name,
e.last_name,
NULL AS dept_no,
NULL AS from_date
FROM
employees_dup e
WHERE

e.emp_no = 10001 -- this what is common between two of them 

UNION SELECT -- brings them out without duplicatese

NULL AS emp_no,
NULL AS first_name,
NULL AS last_name,
m.dept_no,
m.from_date
FROM
dept_manager m;
