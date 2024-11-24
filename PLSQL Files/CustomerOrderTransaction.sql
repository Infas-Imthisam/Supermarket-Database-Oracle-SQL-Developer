-- 8

CREATE TABLE CustomerOrderTransaction (
    CustomerOrderTransactionID NUMBER PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    StaffID NUMBER NOT NULL,
    CustomerTransactionDate DATE NOT NULL,
    CustomerTransactionTime VARCHAR2(8) NOT NULL CHECK (REGEXP_LIKE(CustomerTransactionTime, '^\d{2}:\d{2}:\d{2}$')),
    CustomerTransactionMethod VARCHAR2(50) NOT NULL,
    
    CONSTRAINT fk_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fk_staff FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);


INSERT INTO CustomerOrderTransaction (CustomerOrderTransactionID, CustomerID, StaffID, CustomerTransactionDate, CustomerTransactionTime, CustomerTransactionMethod) 
VALUES (1, 2, 4, TO_DATE('2024-09-01', 'YYYY-MM-DD'), '12:30:45', 'Cash');

INSERT INTO CustomerOrderTransaction (CustomerOrderTransactionID, CustomerID, StaffID, CustomerTransactionDate, CustomerTransactionTime, CustomerTransactionMethod) 
VALUES (2, 4, 3, TO_DATE('2024-09-02', 'YYYY-MM-DD'), '11:31:48', 'Debit Card');

INSERT INTO CustomerOrderTransaction (CustomerOrderTransactionID, CustomerID, StaffID, CustomerTransactionDate, CustomerTransactionTime, CustomerTransactionMethod) 
VALUES (3, 6, 2, TO_DATE('2024-09-03', 'YYYY-MM-DD'), '12:40:55', 'Mobile Payment');

INSERT INTO CustomerOrderTransaction (CustomerOrderTransactionID, CustomerID, StaffID, CustomerTransactionDate, CustomerTransactionTime, CustomerTransactionMethod) 
VALUES (4, 8, 1, TO_DATE('2024-09-04', 'YYYY-MM-DD'), '13:20:55', 'Mobile Payment');

INSERT INTO CustomerOrderTransaction (CustomerOrderTransactionID, CustomerID, StaffID, CustomerTransactionDate, CustomerTransactionTime, CustomerTransactionMethod) 
VALUES (5, 10, 13, TO_DATE('2024-09-05', 'YYYY-MM-DD'), '14:30:35', 'Debit Card');

INSERT INTO CustomerOrderTransaction (CustomerOrderTransactionID, CustomerID, StaffID, CustomerTransactionDate, CustomerTransactionTime, CustomerTransactionMethod) 
VALUES (6, 1, 14, TO_DATE('2024-09-06', 'YYYY-MM-DD'), '15:20:25', 'Debit Card');

INSERT INTO CustomerOrderTransaction (CustomerOrderTransactionID, CustomerID, StaffID, CustomerTransactionDate, CustomerTransactionTime, CustomerTransactionMethod) 
VALUES (7, 3, 15, TO_DATE('2024-09-07', 'YYYY-MM-DD'), '15:20:22', 'Credit Card');

INSERT INTO CustomerOrderTransaction (CustomerOrderTransactionID, CustomerID, StaffID, CustomerTransactionDate, CustomerTransactionTime, CustomerTransactionMethod) 
VALUES (8, 5, 16, TO_DATE('2024-09-08', 'YYYY-MM-DD'), '16:40:25', 'Credit Card');

INSERT INTO CustomerOrderTransaction (CustomerOrderTransactionID, CustomerID, StaffID, CustomerTransactionDate, CustomerTransactionTime, CustomerTransactionMethod) 
VALUES (9, 7, 1, TO_DATE('2024-09-09', 'YYYY-MM-DD'), '17:28:29', 'Cash');

INSERT INTO CustomerOrderTransaction (CustomerOrderTransactionID, CustomerID, StaffID, CustomerTransactionDate, CustomerTransactionTime, CustomerTransactionMethod) 
VALUES (10, 9, 3, TO_DATE('2024-09-10', 'YYYY-MM-DD'), '18:30:55', 'Cash');

INSERT INTO CustomerOrderTransaction (CustomerOrderTransactionID, CustomerID, StaffID, CustomerTransactionDate, CustomerTransactionTime, CustomerTransactionMethod) 
VALUES (11, 11, 2, TO_DATE('2024-09-11', 'YYYY-MM-DD'), '19:10:45', 'Credit Card');

INSERT INTO CustomerOrderTransaction (CustomerOrderTransactionID, CustomerID, StaffID, CustomerTransactionDate, CustomerTransactionTime, CustomerTransactionMethod) 
VALUES (12, 13, 4, TO_DATE('2024-09-12', 'YYYY-MM-DD'), '20:10:25', 'Cash');

INSERT INTO CustomerOrderTransaction (CustomerOrderTransactionID, CustomerID, StaffID, CustomerTransactionDate, CustomerTransactionTime, CustomerTransactionMethod) 
VALUES (13, 15, 15, TO_DATE('2024-09-13', 'YYYY-MM-DD'), '21:00:05', 'Cash');

select * from customerordertransaction;
