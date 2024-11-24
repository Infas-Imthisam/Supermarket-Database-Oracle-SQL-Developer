-- 14

CREATE TABLE ReceivedOrderPayment (
    ReceivedOrderPaymentID NUMBER PRIMARY KEY,
    ReceivedOrderID NUMBER NOT NULL,
    StaffID NUMBER NOT NULL,
    OrderPaymentDate DATE NOT NULL,
    OrderPaymentTime VARCHAR2(8) NOT NULL,
    OrderPaymentMethod VARCHAR2(50) NOT NULL,
    TotalAmountDue NUMBER(10, 2) NOT NULL CHECK (TotalAmountDue >= 0),
    PayedTotalPrice NUMBER(10, 2) NOT NULL CHECK (PayedTotalPrice >= 0),
    BalanceAmount NUMBER(10, 2) AS (TotalAmountDue - PayedTotalPrice) VIRTUAL,

    CONSTRAINT fk_received_order_payment FOREIGN KEY (ReceivedOrderID) REFERENCES ReceivedOrder(ReceivedOrderID),
    CONSTRAINT fk_staff_payment FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);




-- Trigger for Calculate TotalAmountDue
CREATE OR REPLACE TRIGGER trg_calculate_total_amount_due
BEFORE INSERT ON ReceivedOrderPayment
FOR EACH ROW
DECLARE
    v_total_due NUMBER(10, 2);
BEGIN

    SELECT SUM(TotalPrice)
    INTO v_total_due
    FROM ReceivedProductDetails
    WHERE ReceivedOrderID = :NEW.ReceivedOrderID;

    
    :NEW.TotalAmountDue := NVL(v_total_due, 0);
END;


INSERT INTO ReceivedOrderPayment (ReceivedOrderPaymentID, ReceivedOrderID, StaffID, OrderPaymentDate, OrderPaymentTime, OrderPaymentMethod, PayedTotalPrice)
VALUES (1, 1, 9, TO_DATE('2024-09-18', 'YYYY-MM-DD'), '08:15:45', 'Credit Card', 7500.00);

INSERT INTO ReceivedOrderPayment (ReceivedOrderPaymentID, ReceivedOrderID, StaffID, OrderPaymentDate, OrderPaymentTime, OrderPaymentMethod, PayedTotalPrice)
VALUES (2, 2, 9, TO_DATE('2024-09-22', 'YYYY-MM-DD'), '09:30:00', 'Cash', 5400.00);  

INSERT INTO ReceivedOrderPayment (ReceivedOrderPaymentID, ReceivedOrderID, StaffID, OrderPaymentDate, OrderPaymentTime, OrderPaymentMethod, PayedTotalPrice)
VALUES (3, 3, 10, TO_DATE('2024-09-24', 'YYYY-MM-DD'), '10:45:30', 'Online Transfer', 4800.00);

INSERT INTO ReceivedOrderPayment (ReceivedOrderPaymentID, ReceivedOrderID, StaffID, OrderPaymentDate, OrderPaymentTime, OrderPaymentMethod, PayedTotalPrice)
VALUES (4, 4, 10, TO_DATE('2024-09-26', 'YYYY-MM-DD'), '11:20:15', 'Credit Card', 6000.00);

INSERT INTO ReceivedOrderPayment (ReceivedOrderPaymentID, ReceivedOrderID, StaffID, OrderPaymentDate, OrderPaymentTime, OrderPaymentMethod, PayedTotalPrice)
VALUES (5, 5, 11, TO_DATE('2024-09-28', 'YYYY-MM-DD'), '12:10:50', 'Cash', 9000.00);

INSERT INTO ReceivedOrderPayment (ReceivedOrderPaymentID, ReceivedOrderID, StaffID, OrderPaymentDate, OrderPaymentTime, OrderPaymentMethod, PayedTotalPrice)
VALUES (6, 6, 12, TO_DATE('2024-09-29', 'YYYY-MM-DD'), '13:05:00', 'Online Transfer', 1500.00);  

INSERT INTO ReceivedOrderPayment (ReceivedOrderPaymentID, ReceivedOrderID, StaffID, OrderPaymentDate, OrderPaymentTime, OrderPaymentMethod, PayedTotalPrice)
VALUES (7, 7, 9, TO_DATE('2024-09-30', 'YYYY-MM-DD'), '14:30:45', 'Cash', 3000.00);

INSERT INTO ReceivedOrderPayment (ReceivedOrderPaymentID, ReceivedOrderID, StaffID, OrderPaymentDate, OrderPaymentTime, OrderPaymentMethod, PayedTotalPrice)
VALUES (8, 8, 10, TO_DATE('2024-09-30', 'YYYY-MM-DD'), '15:25:10', 'Credit Card', 6750.00);

select * from receivedorderpayment;