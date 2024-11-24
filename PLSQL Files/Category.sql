-- 5

CREATE TABLE Category (
    CategoryID NUMBER PRIMARY KEY,
    CategoryName VARCHAR2(100) NOT NULL,
    CategoryDescription VARCHAR2(500)
);

INSERT INTO Category (CategoryID, CategoryName, CategoryDescription) 
VALUES (1, 'Fruits', 'Fresh and seasonal fruits.');

INSERT INTO Category (CategoryID, CategoryName, CategoryDescription) 
VALUES (2, 'Vegetables', 'Organic and locally sourced vegetables.');

INSERT INTO Category (CategoryID, CategoryName, CategoryDescription) 
VALUES (3, 'Dairy', 'Fresh milk, cheese, and other dairy items.');

INSERT INTO Category (CategoryID, CategoryName, CategoryDescription) 
VALUES (4, 'Spices', 'A variety of spices for all culinary needs.');

INSERT INTO Category (CategoryID, CategoryName, CategoryDescription) 
VALUES (5, 'Beverages', 'Soft drinks, juices, and other beverages.');

INSERT INTO Category (CategoryID, CategoryName, CategoryDescription) 
VALUES (6, 'Snacks', 'Chips, crackers, and other snack items.');

INSERT INTO Category (CategoryID, CategoryName, CategoryDescription) 
VALUES (7, 'Bakery', 'Fresh bread, pastries, and baked goods.');

INSERT INTO Category (CategoryID, CategoryName, CategoryDescription) 
VALUES (8, 'Frozen', 'Frozen vegetables, fruits, and meals.');

INSERT INTO Category (CategoryID, CategoryName, CategoryDescription) 
VALUES (9, 'Canned', 'Canned vegetables, fruits, and ready meals.');

INSERT INTO Category (CategoryID, CategoryName, CategoryDescription) 
VALUES (10, 'Condiments', 'Sauces and spreads.');

SELECT * FROM Category;
