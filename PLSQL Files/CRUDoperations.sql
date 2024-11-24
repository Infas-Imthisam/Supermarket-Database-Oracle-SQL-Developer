-- Create Operation

-- Adding new Staff Member

CREATE OR REPLACE PROCEDURE AddStaff(
    p_StaffID IN NUMBER,
    p_DepartmentID IN NUMBER,
    p_StaffFullName IN VARCHAR2,
    p_JoinedDate IN DATE,
    p_StaffEmail IN VARCHAR2,
    p_StaffPhoneNumber IN VARCHAR2,
    p_StaffAddress IN VARCHAR2,
    p_StaffSalary IN NUMBER
) IS
BEGIN
    INSERT INTO Staff (StaffID, DepartmentID, StaffFullName, JoinedDate, StaffEmail, StaffPhoneNumber, StaffAddress, StaffSalary) 
    VALUES (p_StaffID, p_DepartmentID, p_StaffFullName, p_JoinedDate, p_StaffEmail, p_StaffPhoneNumber, p_StaffAddress, p_StaffSalary);

    COMMIT;  
    DBMS_OUTPUT.PUT_LINE('Staff member ' || p_StaffFullName || ' added successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END AddStaff;

--------------------------------------------------------------------------------
-- Adding a new Staff

BEGIN
    AddStaff(41, 1, 'Infas', TO_DATE('2024-10-10', 'YYYY-MM-DD'), 'infas.mim@gmail.com', '0770165379', '51, Galle St, Galle', 60000);
END;








------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Read Operation

-- Read Staff Information
CREATE OR REPLACE PROCEDURE GetStaff(
    p_StaffID IN NUMBER
) IS
    v_StaffFullName VARCHAR2(100);
    v_DepartmentID NUMBER;
    v_JoinedDate DATE;
    v_StaffEmail VARCHAR2(100);
    v_StaffPhoneNumber VARCHAR2(15);
    v_StaffAddress VARCHAR2(200);
    v_StaffSalary NUMBER(10, 2);
BEGIN
    SELECT StaffFullName, DepartmentID, JoinedDate, StaffEmail, StaffPhoneNumber, StaffAddress, StaffSalary
    INTO v_StaffFullName, v_DepartmentID, v_JoinedDate, v_StaffEmail, v_StaffPhoneNumber, v_StaffAddress, v_StaffSalary
    FROM Staff
    WHERE StaffID = p_StaffID;

    DBMS_OUTPUT.PUT_LINE('StaffID: ' || p_StaffID || 
                         ' | Name: ' || v_StaffFullName || 
                         ' | DepartmentID: ' || v_DepartmentID ||
                         ' | Joined Date: ' || TO_CHAR(v_JoinedDate, 'YYYY-MM-DD') || 
                         ' | Email: ' || v_StaffEmail || 
                         ' | Phone: ' || v_StaffPhoneNumber || 
                         ' | Address: ' || v_StaffAddress || 
                         ' | Salary: ' || v_StaffSalary);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No staff member found with StaffID: ' || p_StaffID);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END GetStaff;

--------------------------------------------------------------------------------
-- Read Staff Information
BEGIN
    GetStaff(41); 
END;







------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Update Opration

--Updating existing staff informations
CREATE OR REPLACE PROCEDURE UpdateStaff(
    p_StaffID IN NUMBER,
    p_DepartmentID IN NUMBER,
    p_StaffFullName IN VARCHAR2,
    p_JoinedDate IN DATE,
    p_StaffEmail IN VARCHAR2,
    p_StaffPhoneNumber IN VARCHAR2,
    p_StaffAddress IN VARCHAR2,
    p_StaffSalary IN NUMBER
) IS
    v_count NUMBER;
BEGIN
    
    SELECT COUNT(*)
    INTO v_count
    FROM Staff
    WHERE StaffID = p_StaffID;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No staff member found with StaffID: ' || p_StaffID);
    ELSE
        
        UPDATE Staff
        SET DepartmentID = p_DepartmentID,
            StaffFullName = p_StaffFullName,
            JoinedDate = p_JoinedDate,
            StaffEmail = p_StaffEmail,
            StaffPhoneNumber = p_StaffPhoneNumber,
            StaffAddress = p_StaffAddress,
            StaffSalary = p_StaffSalary
        WHERE StaffID = p_StaffID;

        COMMIT; -- Commit the transaction
        DBMS_OUTPUT.PUT_LINE('Staff member with StaffID: ' || p_StaffID || ' has been successfully updated.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END UpdateStaff;



--------------------------------------------------------------------------------
-- Updating existing staff information

BEGIN
    UpdateStaff(40, 1, 'Kavindu MIM', TO_DATE('2024-08-10', 'YYYY-MM-DD'), 'Kavindu@gmail.com', '0766307474', '56, New Street, Galle', 65000);
END;


SELECT * FROM Staff
WHERE StaffID = 41;





------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Delete Operation

-- Remove(Delete) a staff member.
CREATE OR REPLACE PROCEDURE RemoveStaff(p_StaffID IN NUMBER) IS
    v_count NUMBER;
BEGIN
    
    SELECT COUNT(*)
    INTO v_count
    FROM Staff
    WHERE StaffID = p_StaffID;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No staff member found with StaffID: ' || p_StaffID);
    ELSE
        -- Delete the staff member
        DELETE FROM Staff
        WHERE StaffID = p_StaffID;

        COMMIT; -- Commit the transaction
        DBMS_OUTPUT.PUT_LINE('Staff member with StaffID: ' || p_StaffID || ' has been successfully removed.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END RemoveStaff;


--------------------------------------------------------------------------------
--Removing Staff

BEGIN
    RemoveStaff(41); 
END;




----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Updating Stocklevel When Products Are Received (increasing)
CREATE OR REPLACE TRIGGER trg_increase_stock_level
AFTER INSERT ON ReceivedProductDetails
FOR EACH ROW
BEGIN
    
    UPDATE Inventory
    SET StockLevel = StockLevel + :NEW.ReceivedQuantity
    WHERE ProductID = :NEW.ProductID;
END;



-- Updating Stocklevel When Products Are Sold (Dicreasing)
CREATE OR REPLACE TRIGGER trg_decrease_stock_level
AFTER INSERT ON CustomerOrderDetails  
FOR EACH ROW
DECLARE
    v_stock_level NUMBER;
BEGIN
    
    SELECT StockLevel INTO v_stock_level
    FROM Inventory
    WHERE ProductID = :NEW.ProductID;


    IF v_stock_level >= :NEW.TotalQuantity THEN
        UPDATE Inventory
        SET StockLevel = StockLevel - :NEW.TotalQuantity 
        WHERE ProductID = :NEW.ProductID;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient stock for ProductID ' || :NEW.ProductID);
    END IF;
END;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


