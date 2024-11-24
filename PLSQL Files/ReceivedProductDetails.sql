-- 13

CREATE TABLE ReceivedProductDetails (
    ReceivedOrderID NUMBER NOT NULL,
    ProductID NUMBER NOT NULL,
    ReceivedQuantity NUMBER NOT NULL CHECK (ReceivedQuantity > 0),
    ReceivedDate DATE NOT NULL,
    TotalPrice NUMBER(10, 2), 

    CONSTRAINT fk_received_order FOREIGN KEY (ReceivedOrderID) REFERENCES ReceivedOrder(ReceivedOrderID),
    CONSTRAINT fk_received_product FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


--Trigger for Totalprice of Received Quantities by ProductID price
CREATE OR REPLACE TRIGGER trg_calculate_total_price
BEFORE INSERT ON ReceivedProductDetails
FOR EACH ROW
DECLARE
    v_product_price NUMBER(10, 2);
BEGIN
    
    SELECT ProductPrice
    INTO v_product_price
    FROM Product
    WHERE ProductID = :NEW.ProductID;

    
    :NEW.TotalPrice := v_product_price * :NEW.ReceivedQuantity;
END;





INSERT INTO ReceivedProductDetails (ReceivedOrderID, ProductID, ReceivedQuantity, ReceivedDate)
VALUES (1, 1, 50, TO_DATE('2024-09-17', 'YYYY-MM-DD'));  

INSERT INTO ReceivedProductDetails (ReceivedOrderID, ProductID, ReceivedQuantity, ReceivedDate)
VALUES (1, 3, 30, TO_DATE('2024-09-19', 'YYYY-MM-DD'));  

INSERT INTO ReceivedProductDetails (ReceivedOrderID, ProductID, ReceivedQuantity, ReceivedDate)
VALUES (2, 6, 100, TO_DATE('2024-09-21', 'YYYY-MM-DD')); 

INSERT INTO ReceivedProductDetails (ReceivedOrderID, ProductID, ReceivedQuantity, ReceivedDate)
VALUES (2, 5, 25, TO_DATE('2024-09-23', 'YYYY-MM-DD'));  

INSERT INTO ReceivedProductDetails (ReceivedOrderID, ProductID, ReceivedQuantity, ReceivedDate)
VALUES (3, 2, 40, TO_DATE('2024-09-25', 'YYYY-MM-DD'));  

INSERT INTO ReceivedProductDetails (ReceivedOrderID, ProductID, ReceivedQuantity, ReceivedDate)
VALUES (4, 11, 60, TO_DATE('2024-09-27', 'YYYY-MM-DD'));  

INSERT INTO ReceivedProductDetails (ReceivedOrderID, ProductID, ReceivedQuantity, ReceivedDate)
VALUES (5, 2, 75, TO_DATE('2024-09-29', 'YYYY-MM-DD'));  

INSERT INTO ReceivedProductDetails (ReceivedOrderID, ProductID, ReceivedQuantity, ReceivedDate)
VALUES (6, 4, 35, TO_DATE('2024-09-30', 'YYYY-MM-DD'));  

INSERT INTO ReceivedProductDetails (ReceivedOrderID, ProductID, ReceivedQuantity, ReceivedDate)
VALUES (7, 10, 20, TO_DATE('2024-09-30', 'YYYY-MM-DD'));  

INSERT INTO ReceivedProductDetails (ReceivedOrderID, ProductID, ReceivedQuantity, ReceivedDate)
VALUES (8, 10, 45, TO_DATE('2024-09-30', 'YYYY-MM-DD'));  


select * from ReceivedProductDetails;



-- Calculate Subtotal Price by ReceivedOrderID
SELECT 
    ReceivedOrderID, 
    SUM(TotalPrice) AS SubtotalPrice
FROM 
    ReceivedProductDetails
GROUP BY 
    ReceivedOrderID;



--Subtotal of Received Quantities by ReceivedOrderID
SELECT ReceivedOrderID, 
       SUM(ReceivedQuantity) AS SubTotalReceivedQuantities
FROM ReceivedProductDetails
GROUP BY ReceivedOrderID;