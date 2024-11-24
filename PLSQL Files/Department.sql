-- 2

CREATE TABLE Department (
    DepartmentID NUMBER PRIMARY KEY,
    DepartmentName VARCHAR2(100) NOT NULL
);


INSERT INTO Department (DepartmentID, DepartmentName) VALUES 
(1, 'Sales');

INSERT INTO Department (DepartmentID, DepartmentName) 
VALUES (2, 'Marketing');

INSERT INTO Department (DepartmentID, DepartmentName) 
VALUES (3, 'Inventory Management');

INSERT INTO Department (DepartmentID, DepartmentName) 
VALUES (4, 'Customer Service');

INSERT INTO Department (DepartmentID, DepartmentName) 
VALUES (5, 'Logistics and Supply Chain');

SELECT * FROM department;
