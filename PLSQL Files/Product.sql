-- 6

CREATE TABLE Product (
    ProductID NUMBER PRIMARY KEY,
    SupplierID NUMBER NOT NULL,
    CategoryID NUMBER NOT NULL,
    ProductName VARCHAR2(100) NOT NULL,
    ProductPrice NUMBER(10, 2) NOT NULL CHECK (ProductPrice > 0),
    ProductExpiaryDate DATE NOT NULL,

    CONSTRAINT fk_supplier FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    CONSTRAINT fk_category FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);



INSERT INTO Product (ProductID, SupplierID, CategoryID, ProductName, ProductPrice, ProductExpiaryDate) 
VALUES (1, 2, 1,'Banana (1 packed)', 150.00, TO_DATE('2024-12-31', 'YYYY-MM-DD'));

INSERT INTO Product (ProductID, SupplierID, CategoryID, ProductName, ProductPrice, ProductExpiaryDate) 
VALUES (2, 2, 1,'Apple (1 packed)', 120.00, TO_DATE('2024-12-30', 'YYYY-MM-DD'));

INSERT INTO Product (ProductID, SupplierID, CategoryID, ProductName, ProductPrice, ProductExpiaryDate) 
VALUES (3, 2, 1,'Mango (1 packed)', 180.00, TO_DATE('2024-12-15', 'YYYY-MM-DD'));


INSERT INTO Product (ProductID, SupplierID, CategoryID, ProductName, ProductPrice, ProductExpiaryDate) 
VALUES (4, 4, 2,'Carrot (1kg packed)', 80.00, TO_DATE('2024-11-15', 'YYYY-MM-DD'));

INSERT INTO Product (ProductID, SupplierID, CategoryID, ProductName, ProductPrice, ProductExpiaryDate) 
VALUES (5, 4, 2,'Tomato (1kg packed)', 90.00, TO_DATE('2024-11-25', 'YYYY-MM-DD'));

INSERT INTO Product (ProductID, SupplierID, CategoryID, ProductName, ProductPrice, ProductExpiaryDate) 
VALUES (6, 4, 2,'Cabbage (1 piece)', 50.00, TO_DATE('2024-11-10', 'YYYY-MM-DD'));


INSERT INTO Product (ProductID, SupplierID, CategoryID, ProductName, ProductPrice, ProductExpiaryDate) 
VALUES (7, 6, 3,'Milk (1 liter)', 90.00, TO_DATE('2024-12-01', 'YYYY-MM-DD'));

INSERT INTO Product (ProductID, SupplierID, CategoryID, ProductName, ProductPrice, ProductExpiaryDate) 
VALUES (8, 6, 3,'Butter (200g)', 300.00, TO_DATE('2024-12-05', 'YYYY-MM-DD'));

INSERT INTO Product (ProductID, SupplierID, CategoryID, ProductName, ProductPrice, ProductExpiaryDate) 
VALUES (9, 6, 3,'Cheese (200g)', 350.00, TO_DATE('2024-12-10', 'YYYY-MM-DD'));


INSERT INTO Product (ProductID, SupplierID, CategoryID, ProductName, ProductPrice, ProductExpiaryDate) 
VALUES (10, 3, 4,'Cinnamon (100g)', 150.00, TO_DATE('2024-12-12', 'YYYY-MM-DD'));

INSERT INTO Product (ProductID, SupplierID, CategoryID, ProductName, ProductPrice, ProductExpiaryDate) 
VALUES (11, 1, 5,'Ceylon King Coconut Water (1 Bottle)', 180.00, TO_DATE('2024-12-13', 'YYYY-MM-DD'));


SELECT * FROM Product;

