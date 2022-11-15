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

select E.first_name, E.last_name, E.hire_date, dm.from_date, d.dept_name

from
	Employees E
join 
	dept_manager dm ON E.emp_no= dm.emp_no
 -- first	and a relationship before adding another join   
join 
	departments d ON dm.dept_no=d.dept_no
order by E.emp_no;