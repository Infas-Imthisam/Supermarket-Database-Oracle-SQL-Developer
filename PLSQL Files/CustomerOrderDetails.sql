-- 9

CREATE TABLE CustomerOrderDetails (
    CustomerOrderTransactionID NUMBER NOT NULL,
    ProductID NUMBER NOT NULL,
    UnitPrice NUMBER(10, 2) NOT NULL CHECK (UnitPrice > 0),
    TotalQuantity NUMBER NOT NULL CHECK (TotalQuantity > 0),
    TotalPrice NUMBER(10, 2) GENERATED ALWAYS AS (UnitPrice * TotalQuantity),
    
    CONSTRAINT fk_cust_order_trans_id FOREIGN KEY (CustomerOrderTransactionID) REFERENCES CustomerOrderTransaction(CustomerOrderTransactionID),
    CONSTRAINT fk_prod_id FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Getting prduct price for unitprice
CREATE OR REPLACE TRIGGER trg_set_unit_price
BEFORE INSERT OR UPDATE ON CustomerOrderDetails
FOR EACH ROW
BEGIN

    SELECT ProductPrice
    INTO :NEW.UnitPrice
    FROM Product
    WHERE Product.ProductID = :NEW.ProductID;
END;
/


INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (1, 1, 2);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (2, 2, 5);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (3, 1, 6);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (4, 3, 10);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (5, 4, 8);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (6, 5, 5);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (7, 8, 2);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (8, 9, 4);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (8, 4, 3);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (9, 10, 4);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (9, 3, 2);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (9, 2, 1);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (10, 3, 3);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (11, 4, 3);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (11, 5, 4);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (12, 2, 3);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (12, 4, 2);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (13, 6, 3);  

INSERT INTO CustomerOrderDetails (CustomerOrderTransactionID, ProductID, TotalQuantity)
VALUES (13, 5, 4);  


select * from CustomerOrderDetails;


--- Get SubTotal for each transaction
SELECT CustomerOrderTransactionID, 
       SUM(TotalPrice) AS SubTotal
FROM CustomerOrderDetails
GROUP BY CustomerOrderTransactionID;


