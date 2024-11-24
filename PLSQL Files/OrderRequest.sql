-- 10

CREATE TABLE OrderRequest (
    OrderRequestID NUMBER PRIMARY KEY,
    StaffID NUMBER NOT NULL,
    SupplierID NUMBER NOT NULL,

    
    CONSTRAINT fk_staff_order_request FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    CONSTRAINT fk_supplier_order_request FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);


INSERT INTO OrderRequest (OrderRequestID, StaffID, SupplierID) VALUES 
(1, 9, 2);  

INSERT INTO OrderRequest (OrderRequestID, StaffID, SupplierID) VALUES 
(2, 9, 4);  

INSERT INTO OrderRequest (OrderRequestID, StaffID, SupplierID) VALUES 
(3, 10, 3); 

INSERT INTO OrderRequest (OrderRequestID, StaffID, SupplierID) VALUES 
(4, 10, 1); 

INSERT INTO OrderRequest (OrderRequestID, StaffID, SupplierID) VALUES 
(5, 11, 2); 

INSERT INTO OrderRequest (OrderRequestID, StaffID, SupplierID) VALUES 
(6, 12, 4);

INSERT INTO OrderRequest (OrderRequestID, StaffID, SupplierID) VALUES 
(7, 9, 3);  

INSERT INTO OrderRequest (OrderRequestID, StaffID, SupplierID) VALUES 
(8, 10, 1); 

INSERT INTO OrderRequest (OrderRequestID, StaffID, SupplierID) VALUES 
(9, 11, 4);

INSERT INTO OrderRequest (OrderRequestID, StaffID, SupplierID) VALUES 
(10, 12, 2); 

select * from orderrequest;