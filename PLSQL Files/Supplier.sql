-- 4

CREATE TABLE Supplier (
    SupplierID NUMBER PRIMARY KEY,
    SupplierName VARCHAR2(100) NOT NULL,
    SupplierEmail VARCHAR2(100) NOT NULL,
    SupplierPhoneNumber VARCHAR2(15) NOT NULL,
    SupplierAddress VARCHAR2(250) NOT NULL
);

INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierPhoneNumber, SupplierAddress) 
VALUES (1, 'Ceylon Groceries', 'ceylongroceries@gmail.com', '0711234567', '456, Main St, Colombo 5');

INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierPhoneNumber, SupplierAddress) 
VALUES (2, 'Lanka Fresh Fruits', 'lankafreshfruits@yahoo.com', '0772345678', '789, Market Rd, Kandy');

INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierPhoneNumber, SupplierAddress) 
VALUES (3, 'Suwanda Spices', 'suwandaspices@gmail.com', '0753456789', '321, Spice St, Galle');

INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierPhoneNumber, SupplierAddress) 
VALUES (4, 'Fresh Vegetables Supplier', 'freshvegetablessupplier@hotmail.com', '0784567890', '654, Veggie St, Colombo');

INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierPhoneNumber, SupplierAddress) 
VALUES (5, 'Ceylon Tea Suppliers', 'ceylonteasuppliers@hotmail.com', '0715678901', '987, Tea Plantations, Nuwara Eliya');

INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierPhoneNumber, SupplierAddress) 
VALUES (6, 'Pure Ceylon Milk', 'pureceylonmilk@gmail.com', '0766789012', '123, Dairy Rd, Negombo');

INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierPhoneNumber, SupplierAddress) 
VALUES (7, 'Spice Garden Suppliers', 'spicegardensuppliers@gmail.com', '0777890123', '345, Herb St, Kandy');

INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierPhoneNumber, SupplierAddress) 
VALUES (8, 'Lanka Seafood', 'lankaseafood@yahoo.com', '0718901234', '456, Fisherman Rd, Galle');

INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierPhoneNumber, SupplierAddress) 
VALUES (9, 'Green Leaf Vegetables', 'greenleafvegetables@gmail.com', '0759012345', '789, Veggie St, Colombo 4');

INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierPhoneNumber, SupplierAddress) 
VALUES (10, 'Natural Sweeteners', 'naturalsweeteners@hotmail.com', '0780123456', '321, Sugar Rd, Negombo');

INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierPhoneNumber, SupplierAddress) 
VALUES (11, 'Ceylon Herbal Products', 'ceylonherbals@gmail.com', '0711234568', '654, Herbal Lane, Kandy');

INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierPhoneNumber, SupplierAddress) 
VALUES (12, 'Quality Meat Suppliers', 'qualitymeats@yahoo.com', '0772345679', '987, Butchers Rd, Galle');

INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierPhoneNumber, SupplierAddress) 
VALUES (13, 'Organic Rice Suppliers', 'organicrice@gmail.com', '0753456780', '123, Rice Field Rd, Colombo 3');

INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierPhoneNumber, SupplierAddress) 
VALUES (14, 'Srilankan Spice Company', 'srilankanspices@hotmail.com', '0784567891', '654, Spice Route, Nuwara Eliya');

INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierPhoneNumber, SupplierAddress) 
VALUES (15, 'Ceylon Coconut Products', 'ceylonproducts@gmail.com', '0715678902', '987, Coconut Rd, Negombo');

SELECT * FROM Supplier;
