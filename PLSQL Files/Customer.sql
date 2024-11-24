-- 1

CREATE TABLE Customer (
    CustomerID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    CphoneNumber VARCHAR2(15) NOT NULL CHECK (LENGTH(CphoneNumber) = 10),
    CEmail VARCHAR2(100) NOT NULL,
    CAddress VARCHAR2(200) NOT NULL,
    CustomerPersonalPhoneNumber RAW(200)
);

INSERT INTO Customer (CustomerID, FirstName, LastName, CphoneNumber, CEmail, CAddress, CustomerPersonalPhoneNumber) 
VALUES (1, 'Lakshan', 'Perera', '0701234567', 'lakshan.perera@gmail.com', '123, Galle Road, Colombo 3', '0910123456');

INSERT INTO Customer (CustomerID, FirstName, LastName, CphoneNumber, CEmail, CAddress, CustomerPersonalPhoneNumber) 
VALUES (2, 'Nimali', 'Silva', '0702345678', 'nimali.silva@yahoo.com', '456, Main Street, Kandy', '0112345678');

INSERT INTO Customer (CustomerID, FirstName, LastName, CphoneNumber, CEmail, CAddress, CustomerPersonalPhoneNumber)
VALUES (3, 'Anura', 'Rajapaksha', '0703456789', 'anura.rajapaksha@gmail.com', '789, Temple Road, Galle', '0123456789');

INSERT INTO Customer (CustomerID, FirstName, LastName, CphoneNumber, CEmail, CAddress, CustomerPersonalPhoneNumber)
VALUES (4, 'Dilani', 'Kumarasiri', '0704567890', 'dilani.kumarasiri@hotmail.com', '321, High Street, Nuwara Eliya', '0134567890');

INSERT INTO Customer (CustomerID, FirstName, LastName, CphoneNumber, CEmail, CAddress, CustomerPersonalPhoneNumber) 
VALUES (5, 'Kasun', 'Fernando', '0705678901', 'kasun.fernando@gmail.com', '654, Lake View Road, Negombo', '0145678901');

INSERT INTO Customer (CustomerID, FirstName, LastName, CphoneNumber, CEmail, CAddress, CustomerPersonalPhoneNumber)
VALUES (6, 'Tharushi', 'Mendis', '0706789012', 'tharushi.mendis@yahoo.com', '987, Sea View Avenue, Matara', '0156789012');

INSERT INTO Customer (CustomerID, FirstName, LastName, CphoneNumber, CEmail, CAddress, CustomerPersonalPhoneNumber)
VALUES (7, 'Sanjaya', 'Gunaratne', '0707890123', 'sanjaya.gunaratne@gmail.com', '135, Hilltop Road, Ratnapura', '0167890123');

INSERT INTO Customer (CustomerID, FirstName, LastName, CphoneNumber, CEmail, CAddress, CustomerPersonalPhoneNumber)
VALUES (8, 'Chathura', 'Bandara', '0708901234', 'chathura.bandara@hotmail.com', '246, Riverside Lane, Trincomalee', '0178901234');

INSERT INTO Customer (CustomerID, FirstName, LastName, CphoneNumber, CEmail, CAddress, CustomerPersonalPhoneNumber)
VALUES (9, 'Dulani', 'Wickramasinghe', '0709012345', 'dulani.wickramasinghe@gmail.com', '357, Park Road, Jaffna', '0189012345');

INSERT INTO Customer (CustomerID, FirstName, LastName, CphoneNumber, CEmail, CAddress, CustomerPersonalPhoneNumber)
VALUES (10, 'Kamal', 'Liyanage', '0700123456', 'kamal.liyanage@yahoo.com', '468, Fort Road, Anuradhapura', '0190123456');

INSERT INTO Customer (CustomerID, FirstName, LastName, CphoneNumber, CEmail, CAddress, CustomerPersonalPhoneNumber) 
VALUES (11, 'Shanika', 'Jayasinghe', '0701234568', 'shanika.jayasinghe@gmail.com', '579, Airport Road, Colombo 4', '0111234568');

INSERT INTO Customer (CustomerID, FirstName, LastName, CphoneNumber, CEmail, CAddress, CustomerPersonalPhoneNumber)
VALUES (12, 'Buddhi', 'Samarawickrama', '0702345679', 'buddhi.samarawickrama@yahoo.com', '680, Railway Road, Kegalle', '0122345679');

INSERT INTO Customer (CustomerID, FirstName, LastName, CphoneNumber, CEmail, CAddress, CustomerPersonalPhoneNumber)
VALUES (13, 'Harsha', 'Kumara', '0703456780', 'harsha.kumara@gmail.com', '791, Main Road, Puttalam', '0133456780');

INSERT INTO Customer (CustomerID, FirstName, LastName, CphoneNumber, CEmail, CAddress, CustomerPersonalPhoneNumber)
VALUES (14, 'Nishan', 'Jayawardena', '0704567891', 'nishan.jayawardena@hotmail.com', '802, Hospital Road, Bandarawela', '0144567891');

INSERT INTO Customer (CustomerID, FirstName, LastName, CphoneNumber, CEmail, CAddress, CustomerPersonalPhoneNumber) 
VALUES (15, 'Dinesh', 'Nawaratne', '0705678902', 'dinesh.nawaratne@gmail.com', '913, Industrial Avenue, Ratnapura', '0155678902');

SELECT * FROM Customer;


--------------------------------------------------------------------------------

-- Display the aLL CustomerIDs and decrypted phone numbers
SET SERVEROUTPUT ON;  

DECLARE
    l_key RAW(32);
    l_decrypted_phone_number RAW(200);
BEGIN
    l_key := DBMS_CRYPTO.HASH(UTL_I18N.STRING_TO_RAW('YourSecretKey', 'AL32UTF8'), DBMS_CRYPTO.HASH_SH256);

    FOR customer_rec IN (SELECT CustomerID, CustomerPersonalPhoneNumber FROM Customer) LOOP
        -- Decrypt the phone number
        l_decrypted_phone_number := DBMS_CRYPTO.DECRYPT(
            customer_rec.CustomerPersonalPhoneNumber,
            DBMS_CRYPTO.AES_CBC_PKCS5,
            l_key
        );

        DBMS_OUTPUT.PUT_LINE('CustomerID: ' || customer_rec.CustomerID || 
                             ' | Personal Phone Number: ' || UTL_I18N.RAW_TO_CHAR(l_decrypted_phone_number, 'AL32UTF8'));
    END LOOP;
END;





