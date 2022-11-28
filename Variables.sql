-- User Defined Functions in MySQL
DELIMITER $$
CREATE FUNCTION function_name(parameter data_type) RETURNS data_type
DECLARE variable_name data_type
BEGIN        
SELECT …
RETURN variable_name
END$$
DELIMITER ;
 /* here you have OUT parameters to  define between the parentheses after the object’s name
 all parameters are IN, and since this is well known, you need not explicitly indicate it with the word, ‘IN’
 indicate it with the word, ‘IN’ parameters, there is a ‘return value’, it is obtained after running the 
 query contained in the body of the function