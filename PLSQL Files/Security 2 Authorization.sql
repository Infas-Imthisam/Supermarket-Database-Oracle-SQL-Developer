-- Creating Roles
CREATE ROLE C##_Supermarket_DB_Admin;
CREATE ROLE C##_Sales_Manager;
CREATE ROLE C##_Human_Resource_Manager;
CREATE ROLE C##_Inventory_Manager;
CREATE ROLE C##_Accountant;

--------------------------------------------------------------------------------
-- Grant roles to users
GRANT C##_Inventory_Manager TO C##_Infas;        
GRANT C##_Sales_Manager TO C##_Navodh;
GRANT C##_Human_Resource_Manager TO C##_Pasindu; 
GRANT C##_Accountant TO C##_Chiran;
GRANT C##_Supermarket_DB_Admin TO C##_Executive_Manager; 

--------------------------------------------------------------------------------

GRANT ALL PRIVILEGES TO C##_Supermarket_DB_Admin;

-- Granting privileges to the Inventory Manager role based on specific Table
GRANT SELECT, INSERT, UPDATE, DELETE ON Product TO C##_Inventory_Manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Category TO C##_Inventory_Manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Inventory TO C##_Inventory_Manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON OrderRequest TO C##_Inventory_Manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON RequestProductDetails TO C##_Inventory_Manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON ReceivedOrder TO C##_Inventory_Manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON ReceivedProductDetails TO C##_Inventory_Manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON CustomerOrderDetails TO C##_Inventory_Manager;

-- Granting privileges to the Sales Manager role based on specific Table
GRANT SELECT, INSERT, UPDATE, DELETE ON Supplier TO C##_Sales_Manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Customer TO C##_Sales_Manager;

-- Granting privileges to the Human Resource Manager role based on specific Table
GRANT SELECT, INSERT, UPDATE, DELETE ON Department TO C##_Human_Resource_Manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Staff TO C##_Human_Resource_Manager;

-- Granting privileges to the Accountant role based on specific Table
GRANT SELECT, INSERT, UPDATE, DELETE ON CustomerOrderTransaction TO C##_Accountant;
GRANT SELECT, INSERT, UPDATE, DELETE ON ReceivedOrderPayment TO C##_Accountant;

--------------------------------------------------------------------------------
-- View All Roles
SELECT role FROM dba_roles;


-- View Users and Their Roles
SELECT grantee, granted_role 
FROM dba_role_privs;


-- all the table privileges that have been granted to the role
SELECT *
FROM DBA_TAB_PRIVS
WHERE GRANTEE = 'C##_ACCOUNTANT';


-- all the SYSTEM privileges that have been granted to the C##_SUPERMARKET_DB_ADMIN
SELECT *
FROM DBA_SYS_PRIVS
WHERE GRANTEE = 'C##_SUPERMARKET_DB_ADMIN';


-- View All Privileges on a Specific Table with the role
SELECT grantee, privilege 
FROM dba_tab_privs 
WHERE table_name = 'INVENTORY'; 


--------------------------------------------------------------------------------

SELECT * FROM SYSTEM.INVENTORY;
SELECT * FROM SYSTEM.Customer;
SELECT * FROM SYSTEM.staff;
SELECT * FROM SYSTEM.CustomerOrderTransaction;


INSERT INTO SYSTEM.Category (CategoryID, CategoryName, CategoryDescription) VALUES (11, 'test', 'test and test.');
UPDATE SYSTEM.Category SET CategoryDescription = 'newcat.' WHERE CategoryID = 11;
DELETE FROM SYSTEM.Category WHERE CategoryID = 11;


-------------------------------------------------------------------------------

CONNECT C##_INFAS/2003
CONNECT C##_Executive_Manager/2000


