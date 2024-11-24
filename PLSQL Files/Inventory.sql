-- 7

CREATE TABLE Inventory (
    InventoryID NUMBER PRIMARY KEY,
    ProductID NUMBER NOT NULL, 
    StockLevel NUMBER, 
    StaffID NUMBER NOT NULL,
    
    CONSTRAINT fk_inventory_product FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    CONSTRAINT fk_inventory_staff FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
    
);


INSERT INTO Inventory (InventoryID, ProductID, StockLevel, StaffID) 
VALUES (1, 1, 100, 9);

INSERT INTO Inventory (InventoryID, ProductID, StockLevel, StaffID) 
VALUES (2, 2, 150, 10);

INSERT INTO Inventory (InventoryID, ProductID, StockLevel, StaffID)  
VALUES (3, 3, 80, 11);

INSERT INTO Inventory (InventoryID, ProductID, StockLevel, StaffID) 
VALUES (4, 4, 60, 11);

INSERT INTO Inventory (InventoryID, ProductID, StockLevel, StaffID) 
VALUES (5, 5, 200, 10);

INSERT INTO Inventory (InventoryID, ProductID, StockLevel, StaffID)  
VALUES (6, 6, 300, 9);

INSERT INTO Inventory (InventoryID, ProductID, StockLevel, StaffID) 
VALUES (7, 7, 250, 9);

INSERT INTO Inventory (InventoryID, ProductID, StockLevel, StaffID) 
VALUES (8, 8, 100, 10);

INSERT INTO Inventory (InventoryID, ProductID, StockLevel, StaffID) 
VALUES (9, 9, 150, 11);

INSERT INTO Inventory (InventoryID, ProductID, StockLevel, StaffID) 
VALUES (10, 10, 180, 9);



select * from inventory;