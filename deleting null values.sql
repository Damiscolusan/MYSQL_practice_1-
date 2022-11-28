SELECT * FROM employees.departments_dup;
commit;
select * from departments_dup
where dept_name is null;
delete from departments_dup
where dept_name ="NULL";  -- to delete null values
rollback;