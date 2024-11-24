ALTER TABLE Customer 
ADD (CustomerPersonalPhoneNumber RAW(200));

---------------------------------------------------------------------------------------------------------------
-- Creating a Trigger for Encryption to automatically encrypt the CustomerPersonalPhoneNumber

CREATE OR REPLACE TRIGGER encrypt_customer_phone
BEFORE INSERT ON Customer
FOR EACH ROW
DECLARE
    l_key RAW(32);
BEGIN
    
    l_key := DBMS_CRYPTO.HASH(UTL_I18N.STRING_TO_RAW('YourSecretKey', 'AL32UTF8'), DBMS_CRYPTO.HASH_SH256);

    
    :NEW.CustomerPersonalPhoneNumber := DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW(:NEW.CustomerPersonalPhoneNumber, 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    );
END;


-------------------------------------------------------------------------------------------------------------------

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



-------------------------------------------------------------------------------------------------------------------------------------


-- Display the CustomerID and decrypted phone number for Specific CustomerID
SET SERVEROUTPUT ON;  

DECLARE
    l_key RAW(32);
    l_decrypted_phone_number RAW(200);
BEGIN
    l_key := DBMS_CRYPTO.HASH(UTL_I18N.STRING_TO_RAW('YourSecretKey', 'AL32UTF8'), DBMS_CRYPTO.HASH_SH256);

    
    FOR customer_rec IN (SELECT CustomerID, CustomerPersonalPhoneNumber FROM Customer WHERE CustomerID = 203) LOOP
        
        l_decrypted_phone_number := DBMS_CRYPTO.DECRYPT(
            customer_rec.CustomerPersonalPhoneNumber,
            DBMS_CRYPTO.AES_CBC_PKCS5,
            l_key
        );

        DBMS_OUTPUT.PUT_LINE('CustomerID: ' || customer_rec.CustomerID || 
                             ' | Personal Phone Number: ' || UTL_I18N.RAW_TO_CHAR(l_decrypted_phone_number, 'AL32UTF8'));
    END LOOP;
END;


----------------------------------------------------------------------------------------------------------------------------------


INSERT INTO Customer (CustomerID, FirstName, LastName, CphoneNumber, CEmail, CAddress, CustomerPersonalPhoneNumber)
VALUES (203, 'NIBM', 'CLMB', '0676543210', 'NIBM.CLMB@gmail.com', 'No. 22, CLMB Road, Colombo 03', '0112233669');

select * from customer;





























-------------------------------------------------------------------------------------------------------------------------------------

--insert or update cus_per_pho_num with encryption

DECLARE
    l_key RAW(32);
BEGIN

    l_key := DBMS_CRYPTO.HASH(UTL_I18N.STRING_TO_RAW('YourSecretKey', 'AL32UTF8'), DBMS_CRYPTO.HASH_SH256);

 
    UPDATE Customer 
    SET CustomerPersonalPhoneNumber = DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW('0111111111', 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    ) 
    WHERE CustomerID = 202;

 
    COMMIT;
END;

------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- add data
DECLARE
    l_key RAW(32);
BEGIN
    -- Create the encryption key
    l_key := DBMS_CRYPTO.HASH(UTL_I18N.STRING_TO_RAW('YourSecretKey', 'AL32UTF8'), DBMS_CRYPTO.HASH_SH256);

  
    UPDATE Customer 
    SET CustomerPersonalPhoneNumber = DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW('0910123456', 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    ) WHERE CustomerID = 1;

    UPDATE Customer 
    SET CustomerPersonalPhoneNumber = DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW('0112345678', 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    ) WHERE CustomerID = 2;

    UPDATE Customer 
    SET CustomerPersonalPhoneNumber = DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW('0123456789', 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    ) WHERE CustomerID = 3;

    UPDATE Customer 
    SET CustomerPersonalPhoneNumber = DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW('0134567890', 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    ) WHERE CustomerID = 4;

    UPDATE Customer 
    SET CustomerPersonalPhoneNumber = DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW('0145678901', 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    ) WHERE CustomerID = 5;

    UPDATE Customer 
    SET CustomerPersonalPhoneNumber = DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW('0156789012', 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    ) WHERE CustomerID = 6;

    UPDATE Customer 
    SET CustomerPersonalPhoneNumber = DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW('0167890123', 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    ) WHERE CustomerID = 7;

    UPDATE Customer 
    SET CustomerPersonalPhoneNumber = DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW('0178901234', 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    ) WHERE CustomerID = 8;

    UPDATE Customer 
    SET CustomerPersonalPhoneNumber = DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW('0189012345', 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    ) WHERE CustomerID = 9;

    UPDATE Customer 
    SET CustomerPersonalPhoneNumber = DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW('0190123456', 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    ) WHERE CustomerID = 10;

    UPDATE Customer 
    SET CustomerPersonalPhoneNumber = DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW('0111234568', 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    ) WHERE CustomerID = 11;

    UPDATE Customer 
    SET CustomerPersonalPhoneNumber = DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW('0122345679', 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    ) WHERE CustomerID = 12;

    UPDATE Customer 
    SET CustomerPersonalPhoneNumber = DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW('0133456780', 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    ) WHERE CustomerID = 13;

    UPDATE Customer 
    SET CustomerPersonalPhoneNumber = DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW('0144567891', 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    ) WHERE CustomerID = 14;

    UPDATE Customer 
    SET CustomerPersonalPhoneNumber = DBMS_CRYPTO.ENCRYPT(
        UTL_I18N.STRING_TO_RAW('0155678902', 'AL32UTF8'), 
        DBMS_CRYPTO.AES_CBC_PKCS5, 
        l_key
    ) WHERE CustomerID = 15;


    COMMIT;
END;

