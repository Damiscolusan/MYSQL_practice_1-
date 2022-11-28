set @v_avg_salary = 0; -- initialize the procedure to 0 first
call employees.emp_avg_salary_out(11300, @v_avg_salary);-- 11300 is the input parameter set to @v_avg_salary
select @v_avg_salary;