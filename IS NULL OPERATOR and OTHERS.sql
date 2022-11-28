select *-- columns--
from employees -- tables --
where first_name is null;-- (filter) it has shown us that there are no missing values
select *
from employees
where first_name is not null;
select distinct hire_date -- to select different hire_date from the employees table --
from employees
where hire_date is not null;
select distinct gender -- just the basic employee gender --
from employees;
