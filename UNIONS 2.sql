USE EMPLOYEEDEMOGRAPHICS;
select FirstName, LastName, Age
from employeedemographics
UNION -- doesn't include null values
select FirstName, LastName, Age
from warehouseemployeedemographics;

use employees;
select 
e.emp_no, e.first_name, e.last_name, NULL as dept_no, NULL as from_date
from employees_dup e
where e.emp_no= "10001"
UNION ALL -- includes the null values
select
dm.emp_no, NULL as first_name, NULL as last_name, dm.dept_no,dm.from_date
from dept_manager dm;

-- 2nd Ecercise 
select *
from
(Select e.emp_no, e.first_name, e.last_name, NULL as dept_no, NULL as from_date
From Employees e
where last_name= "Denis"
union all
select emp_no, NULL as first_name, NULL as last_name, dept_no, from_date
from dept_manager dm) as a
ORDER BY -a.emp_no DESC;
