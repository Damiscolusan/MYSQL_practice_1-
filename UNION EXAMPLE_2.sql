SELECT EMPLOYEEID, FIRSTNAME,AGE
FROM EMPLOYEE_DEMOGRAPHICS
UNION
SELECT EMPLOYEEID, JOBTITLE,SALARY
FROM EMPLOYEE_SALARY
ORDER BY EMPLOYEEID;
-- IT COMBINES TABLES HORIZONTALLY THAT HAVE THE SAME NUMBERS OF COLUMNS AND OF THE SAME DATATYPE