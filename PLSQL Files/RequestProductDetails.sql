-- 11

CREATE TABLE RequestProductDetails (
    OrderRequestID NUMBER NOT NULL,
    ProductID NUMBER NOT NULL,
    RequestQuantity NUMBER NOT NULL CHECK (RequestQuantity > 0),
    RequestDate DATE NOT NULL,
    
    CONSTRAINT fk_order_request FOREIGN KEY (OrderRequestID) REFERENCES OrderRequest(OrderRequestID),
    CONSTRAINT fk_product FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

INSERT INTO RequestProductDetails (OrderRequestID, ProductID, RequestQuantity, RequestDate) 
VALUES (1, 1, 50, TO_DATE('2023-09-15', 'YYYY-MM-DD'));

INSERT INTO RequestProductDetails (OrderRequestID, ProductID, RequestQuantity, RequestDate) 
VALUES (1, 3, 30, TO_DATE('2023-09-17', 'YYYY-MM-DD'));

INSERT INTO RequestProductDetails (OrderRequestID, ProductID, RequestQuantity, RequestDate) 
VALUES (2, 6, 100, TO_DATE('2023-09-19', 'YYYY-MM-DD'));

INSERT INTO RequestProductDetails (OrderRequestID, ProductID, RequestQuantity, RequestDate) 
VALUES (2, 5, 25, TO_DATE('2023-09-20', 'YYYY-MM-DD'));

INSERT INTO RequestProductDetails (OrderRequestID, ProductID, RequestQuantity, RequestDate) 
VALUES (3, 2, 40, TO_DATE('2023-09-22', 'YYYY-MM-DD'));

INSERT INTO RequestProductDetails (OrderRequestID, ProductID, RequestQuantity, RequestDate) 
VALUES (4, 11, 60, TO_DATE('2023-09-24', 'YYYY-MM-DD'));

INSERT INTO RequestProductDetails (OrderRequestID, ProductID, RequestQuantity, RequestDate) 
VALUES (5, 2, 75, TO_DATE('2023-09-26', 'YYYY-MM-DD'));

INSERT INTO RequestProductDetails (OrderRequestID, ProductID, RequestQuantity, RequestDate) 
VALUES (6, 4, 35, TO_DATE('2023-09-27', 'YYYY-MM-DD'));

INSERT INTO RequestProductDetails (OrderRequestID, ProductID, RequestQuantity, RequestDate) 
VALUES (7, 10, 20, TO_DATE('2023-09-28', 'YYYY-MM-DD'));

INSERT INTO RequestProductDetails (OrderRequestID, ProductID, RequestQuantity, RequestDate) 
VALUES (8, 10, 45, TO_DATE('2023-09-29', 'YYYY-MM-DD'));

INSERT INTO RequestProductDetails (OrderRequestID, ProductID, RequestQuantity, RequestDate) 
VALUES (9, 11, 45, TO_DATE('2023-09-30', 'YYYY-MM-DD'));

INSERT INTO RequestProductDetails (OrderRequestID, ProductID, RequestQuantity, RequestDate) 
VALUES (10, 3, 45, TO_DATE('2023-10-01', 'YYYY-MM-DD'));


select * from requestproductdetails;

-- Subtotal of Requested Quantities by OrderRequestID
SELECT OrderRequestID, 
       SUM(RequestQuantity) AS SubTotalRequestQuantity
FROM RequestProductDetails
GROUP BY OrderRequestID;
