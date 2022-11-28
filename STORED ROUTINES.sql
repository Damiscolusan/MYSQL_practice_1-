USE EMPLOYEES;
DROP procedure IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
SELECT * FROM employees
LIMIT 1000;
END$$
DELIMITER ;
/*
USE employees;
DROP procedure IF EXISTS select_employees;
DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
SELECT * FROM employees
LIMIT 1000;
END$$
DELIMITER ;
*/
-- WE STORE TO RETRIVE A PARTICULAR OUTPUT AT ANYTIME
call employees.select_employees;
call select_employees();  -- SAME THING AS ABOVE

-- LECTURE: Another Way to Create a Procedure in MySQL
-- You can Create a stored procedure using the wrench when hover on it
-- Choose create procedure
DROP PROCEDURE select_employees;
-- LECTURE: Stored Procedures with an Input Parameter
/* cREATE STORED PROCEDURE THAT HAS THE 
1ST NAME, LASTNAME,SALARY,FROM-DATE, TO-DATE*/
USE employees;
DROP procedure IF EXISTS emp_salary;
DELIMITER $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
SELECT
e.first_name, e.last_name, s.salary, s.from_date, s.to_date
FROM
employees e
JOIN
salaries s ON e.emp_no = s.emp_no
WHERE
e.emp_no = p_emp_no;
END$$
DELIMITER ;
CALL EMP_SALARY(11300);

-- emp_avg_salary with
DROP procedure IF EXISTS emp_avg_salary;
DELIMITER $$
CREATE PROCEDURE emp_avg_salary (in p_emp_no integer)
BEGIN
SELECT
e.first_name, e.last_name, avg(s.salary)
FROM
employees e
JOIN
salaries s ON e.emp_no = s.emp_no
WHERE
e.emp_no = p_emp_no;
END$$
DELIMITER ;
CALL emp_avg_salary(11300);

-- LECTURE: Stored Procedures with an Output Parameter
DROP procedure IF EXISTS emp_avg_salary_out;
DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(in p_emp_no integer, out p_avg_salary decimal(10,2))
BEGIN
SELECT
AVG(s.salary)
INTO p_avg_salary FROM
employees e
JOIN
salaries s ON e.emp_no = s.emp_no
WHERE
e.emp_no = p_emp_no;
END$$
DELIMITER ;


-- LECTURE: Variables
set @v_avg_salary = 0;
call employees.emp_avg_salary_out(11300, @v_avg_salary);
SELECT @v_avg_salary;

-- LECTURE: User-Defined Functions in MySQL
USE employees;
DROP FUNCTION IF EXISTS f_emp_avg_salary; -- f FOR FUNCTION CODING STYLE
DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL
BEGIN
DECLARE v_avg_salary DECIMAL(10,2);
SELECT
AVG(s.salary)
INTO v_avg_salary FROM
employees e
JOIN
salaries s ON e.emp_no = s.emp_no
WHERE
e.emp_no = p_emp_no;
RETURN v_avg_salary;
END$$
DELIMITER ;
SELECT F_EMP_AVG_SALARY(11300); -- YOU DON'T CALL A FUNCTION, YOU SELECT A FUNCTION

-- LECTURE: Stored Routines - Conclusion
SET @v_emp_no = 11300;-- @ means set a variable
SELECT 
    emp_no,
    first_name,
    last_name,
    F_EMP_AVG_SALARY(@v_emp_no) AS avg_salary
FROM
    employees
WHERE
    emp_no = @v_emp_no;

-- TRIGGERS
-- LECTURE: MySQL Triggers
USE employees;
COMMIT;-- SAVES THE INITIAL DATABASE AS IT IS
-- BEFORE INSERT
DELIMITER $$
CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN
IF NEW.salary < 0 THEN
SET NEW.salary = 0;
END IF;
END $$
DELIMITER ;

SELECT 
    *
FROM
    salaries;
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001';
INSERT INTO salaries VALUES('10001', -92891, '2010-06-22', '9999-01-01');
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001';

-- BEFORE UPDATE
DELIMITER $$
CREATE TRIGGER trig_upd_salary
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN
IF NEW.salary < 0 THEN
SET NEW.salary = OLD.salary;
END IF;
END $$
DELIMITER ;
UPDATE salaries 
SET 
    salary = 98765
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
UPDATE salaries 
SET 
    salary = - 50000
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';

SELECT SYSDATE();
SELECT DATE_FORMAT(SYSDATE(), '%Y-%m-%d') AS today;
-- AFTER INSERT
DELIMITER $$
CREATE TRIGGER trig_ins_dept_mng
AFTER INSERT ON dept_manager
FOR EACH ROW
BEGIN
DECLARE v_curr_salary int;
SELECT
MAX(salary)
INTO v_curr_salary FROM
salaries
WHERE
emp_no = NEW.emp_no;
IF v_curr_salary IS NOT NULL THEN
UPDATE salaries
SET
to_date = SYSDATE() -- SET START DATE AS THE CURRENT DATE
WHERE
emp_no = NEW.emp_no and to_date = NEW.to_date;  -- WHICH IS TODAYS DATE OR CURRENT DATE
INSERT INTO salaries
VALUES (NEW.emp_no, v_curr_salary + 20000, NEW.from_date, NEW.to_date);
END IF;
END $$
DELIMITER ;
INSERT INTO dept_manager VALUES ('111534', 'd009', date_format(sysdate(), '%Y-%m-%d'), '9999-01-01');
							-- SYS STUFF IS NEW.FROM_DATE, THE N THE INFINITY DATE IS TO_DATE
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no = 111534;
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = 111534;
ROLLBACK;