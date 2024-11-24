
--Business Report 1: Top Products by Sales
--This report shows the top products based on sales volume, which helps to analysis the best-selling items.

DECLARE
    v_limit NUMBER := 5;
BEGIN
    FOR rec IN (
        SELECT p.ProductName, SUM(rpd.ReceivedQuantity) AS TotalSold
        FROM Product p
        JOIN ReceivedProductDetails rpd ON p.ProductID = rpd.ProductID
        GROUP BY p.ProductName
        ORDER BY TotalSold DESC
        FETCH FIRST v_limit ROWS ONLY
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Product: ' || rec.ProductName || ', Total Sold: ' || rec.TotalSold);
    END LOOP;
END;


--Business Report 2: Total Sales by Payment Method
--This report shows the summary of total sales amount for each payment method used by each customer.

SELECT OrderPaymentMethod AS PaymentMethod, SUM(PayedTotalPrice) AS TotalSales
FROM ReceivedOrderPayment
GROUP BY OrderPaymentMethod
ORDER BY TotalSales DESC;


--Business Report 3: Total Quantity Sold by Product
--This report Display the total quantity sold for each product, identifying the best-selling items

SELECT p.ProductName, SUM(rpd.ReceivedQuantity) AS TotalQuantitySold
FROM ReceivedOrderPayment rop
JOIN ReceivedOrder ro ON rop.ReceivedOrderID = ro.ReceivedOrderID
JOIN ReceivedProductDetails rpd ON ro.ReceivedOrderID = rpd.ReceivedOrderID
JOIN Product p ON rpd.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantitySold DESC;


--Business Report 4: Upcoming Product Expiry
--This report includes the list of products that are expiring within the next two months, allowing  inventory management and promotions.

SELECT ProductName, ProductExpiaryDate
FROM Product
WHERE ProductExpiaryDate BETWEEN SYSDATE AND SYSDATE + 60
ORDER BY ProductExpiaryDate ASC;

--Business Report 5: Supplier Orders for September 2024
--This report shows all the supplier orders placed in September 2024 which includes order dates and total prices.

SELECT s.SupplierName, so.OrderDate, so.TotalPrice
FROM SupplierOrder so
JOIN Supplier s ON so.SupplierID = s.SupplierID
WHERE so.OrderDate BETWEEN TO_DATE('2024-09-01', 'YYYY-MM-DD') AND TO_DATE('2024-09-30', 'YYYY-MM-DD')
ORDER BY so.OrderDate DESC;


--Business Report 6: Supplier Orders Summary
--This report identifies high-value supplier orders placed in September 2024.

SELECT 
    s.SupplierName, 
    so.OrderDate, 
    so.TotalPrice,
    CASE 
        WHEN so.TotalPrice > 5000 THEN 'High-value order'
        ELSE 'Standard order'
    END AS OrderType
FROM SupplierOrder so
JOIN Supplier s ON so.SupplierID = s.SupplierID
WHERE so.OrderDate BETWEEN TO_DATE('2024-09-01', 'YYYY-MM-DD') AND TO_DATE('2024-09-30', 'YYYY-MM-DD')
ORDER BY so.OrderDate DESC;


--Business Report 7: Average Salary by Department
--This report calculate and views the average salary of staff in each department, in the order of average salary in descending order.

SELECT d.DepartmentName, AVG(s.StaffSalary) AS AverageSalary
FROM Staff s
JOIN Department d ON s.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY AverageSalary DESC;


--Business Report 8: Suppliers from Colombo
--This report views the list of suppliers located in Colombo, including their names and addresses.
SELECT SupplierName, SupplierAddress
FROM Supplier
WHERE SupplierAddress LIKE '%Colombo%'
ORDER BY SupplierName;


--Business Report 9: Total Order Value by Supplier
--This report Display the summary of the total order value for each supplier, with suppliers whose total values greater than 1000.
SELECT SupplierName, SUM(so.TotalPrice) AS TotalOrderValue
FROM Supplier s
JOIN SupplierOrder so ON s.SupplierID = so.SupplierID
GROUP BY SupplierName
HAVING SUM(so.TotalPrice) > 1000;


--Business Report 10: Staff Joined After 2020
--This report shows staff members who joined after January 1, 2020, ordered by their join date in descending order.
SELECT StaffFullName, JoinedDate
FROM Staff
WHERE JoinedDate > TO_DATE('2020-01-01', 'YYYY-MM-DD')
ORDER BY JoinedDate DESC;



