use employees;
select * -- select all employees ordered by hire date in descending order --
from employees
order by hire_date desc; -- order by columns --
select * -- select all employees ordered by hire date in descending order --
from employees
order by hire_date desc
limit 50;
select * -- select all employees ordered by hire date in descending order --
from employees
order by hire_date desc;
select *
FROM SALARIES
WHERE SALARY > 80000
GROUP BY salary -- group by column(It gives distinct values --
order by salary; -- order by coulmn --
-- select all employees whose avg salary is greater than 120000
select *, avg(salary) as avg_salary
from salaries
-- group by emp_no -- replace with group by
-- having salary>120000
order by emp_no desc;-- will give one value
-- Extract all the salaries of the employees and their respective avg salaries
select*, avg(salary) as avg_salary
from salaries
group by emp_no  /*gets all the emp_no's salaries and groups them distinctly
and finds the average*/
having salary> 120000;-- filtering the value it will give for the average
-- ORDER BY is just to arrange

select *, avg(salary) as Avg_salaries
from salaries
where salary > 120000
group by emp_no
order by emp_no;


select * from dept_emp;
select count(distinct dept_no) from dept_emp;


select count(dept_name) as No_of_dept
from departments;

select *,sum(salary) as total_salaries
from salaries
where from_date > ("1997-01-01");


select min(emp_no) as lowest_number  -- aliasing--
from employees;
select max(emp_no) as lowest_number  -- aliasing--
from employees;
select *,round(avg(salary),2) as total_salaries -- to round up or down to 2 d.p. --
from salaries
where from_date > ("1997-01-01");
