create database trig;
use trig;
CREATE TABLE employee(
    id INT,
    name VARCHAR(30),
    salary INT
);
CREATE TABLE log_table(
    message VARCHAR(100)
);
DELIMITER //

CREATE TRIGGER before_insert_employee
BEFORE INSERT
ON employee
FOR EACH ROW
BEGIN
    INSERT INTO log_table
    VALUES ('A new employee is being inserted');
END//

DELIMITER ;

INSERT INTO employee
VALUES (1,'Rahul',50000);

SELECT * FROM log_table;

select * from employee;

DELIMITER //

CREATE TRIGGER after_insert_employee
AFTER INSERT
ON employee
FOR EACH ROW
BEGIN
    INSERT INTO log_table
    VALUES ('Employee inserted successfully');
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_salary
BEFORE UPDATE
ON employee
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SET NEW.salary = 0;
    END IF;
END//

DELIMITER ;

UPDATE employee
SET salary = 5000
WHERE id = 1;

ALTER TABLE employee
ADD PRIMARY KEY (id);

UPDATE employee
SET salary = 5000
WHERE id = 1;

select * from employee;