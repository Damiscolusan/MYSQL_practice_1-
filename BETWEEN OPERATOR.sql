select*
from employees
where hire_date between ("1990-01-01") and ("2000-01-01");
select*
from employees
where hire_date between "1990-01-01" and "2000-01-01";-- they are all inclusive --
select*
from employees
where hire_date not between ("1990-01-01") and ("2000-01-01");
select*
from employees
where hire_date not between ("1990-01-01") and ("2000-01-01");

select*
from employees
where hire_date between ("1990-01-01") and ("2000-01-01");

select dept_name -- columns-- 
from departments  -- tables--
where dept_no between ("d003") and ("d006");  -- filter --;
select dept_name -- columns-- 
from departments  -- tables--
where dept_no between ("d003") and ("d006");  -- filter --

select *
from salaries
where salary between ("66000") and("70000");
