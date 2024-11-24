-- 12

CREATE TABLE ReceivedOrder (
    ReceivedOrderID NUMBER PRIMARY KEY,
    OrderRequestID NUMBER NOT NULL,
    StaffID NUMBER NOT NULL,

    
    CONSTRAINT fk_order_request FOREIGN KEY (OrderRequestID) REFERENCES OrderRequest(OrderRequestID),
    CONSTRAINT fk_staff_received FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);


INSERT INTO ReceivedOrder (ReceivedOrderID, OrderRequestID, StaffID) VALUES 
(1, 1, 9);  

INSERT INTO ReceivedOrder (ReceivedOrderID, OrderRequestID, StaffID) VALUES 
(2, 2, 9);  

INSERT INTO ReceivedOrder (ReceivedOrderID, OrderRequestID, StaffID) VALUES 
(3, 3, 10);  

INSERT INTO ReceivedOrder (ReceivedOrderID, OrderRequestID, StaffID) VALUES 
(4, 4, 10);  

INSERT INTO ReceivedOrder (ReceivedOrderID, OrderRequestID, StaffID) VALUES 
(5, 5, 11);  

INSERT INTO ReceivedOrder (ReceivedOrderID, OrderRequestID, StaffID) VALUES 
(6, 6, 12);  

INSERT INTO ReceivedOrder (ReceivedOrderID, OrderRequestID, StaffID) VALUES 
(7, 7, 9); 

INSERT INTO ReceivedOrder (ReceivedOrderID, OrderRequestID, StaffID) VALUES 
(8, 8, 10);  

select * from ReceivedOrder;