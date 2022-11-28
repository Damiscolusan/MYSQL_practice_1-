use employees;
select*
from employees
where first_name like("mar%"); -- like operator --
select*
from employees
where first_name like("mar_"); -- like operator giving us just a four letter word character --
-- underscore gives just a single character after where you put it
select*
from employees
where first_name like("_ar_");
select*
from employees
where first_name like("%ar%");
select*
from employees
where first_name like("%ar%");
select*
from employees
where first_name not like("mar%");
select*
from employees
where hire_date like ("%2000%"); -- where the hire_date starts from 2000" ;
select*
from employees
where emp_no like("1000_");-- 5 characters starting from 1000 --
select *
from titles 
where title="Engineer" ;
select *
from titles
where title like("%Engineer%");
select * -- select all employees ordered by hire date in descending order --
from employees
order by hire_date desc;