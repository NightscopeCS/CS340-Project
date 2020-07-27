--Project Group 32 - CaffeineOverflow - Data Manipulation Queries

--Add a new Customer (INSERT)
INSERT INTO Customers (customerName, customerStreet, customerCity, customerState, customerPostalCode, customerCountry, customerPhone, customerEmail)
VALUES (:customerNameInput, :customerStreetInput, :customerCityInput, :customerStateInput, :customerPostalCodeInput, :customerCountryInput, :customerPhoneInput, :customerEmailInput);

--Add a new Product
INSERT INTO Products (supplierID, productName, productPrice)
VALUES (:supplierIDInput, :productNameInput, :productPriceInput);

--Add a new Order
INSERT INTO Orders (customerID, orderDate, shippedDate)
VALUES (:customerIDInput, :orderDateInput, :shippedDateInput);

--Add a new Bean
INSERT INTO Beans (beanName)
VALUES (:beanNameInput);

--Add a new Supplier
INSERT INTO Suppliers (supplierName, supplierStreet, supplierCity, supplierState, supplierPostalCode, supplierCountry)
VALUES (:supplierNameInput, :supplierStreetInput, :supplierCityInput, :supplierStateInput, :supplierPostalCodeInput, :supplierCountryInput);

--Add new Order Details
INSERT INTO Orders_Products (orderID, productID, productQTY)
VALUES (:orderIDInput, :productIDInput, :productQTYInput);

--Add new Product Details
INSERT INTO Products_Beans (productID, beanID)
VALUES (:productIDInput, :beanIDInput);

--Remove Product Details (DELETE)

DELETE from Products_Beans
WHERE productID = (:productIDInput) AND beanID = (:beanIDInput);

--Display customer names, product names, bean types that are contained in their orders (SELECT)

SELECT Customers.customerName, Products. productName, Beans.beanName FROM Customers
INNER JOIN Orders ON Orders.customerID = Customers.customerID
INNER JOIN Orders_Products ON Orders_Products.orderID = Orders.orderID
INNER JOIN Products ON Orders_Products.productID = Products.productID
INNER JOIN Products_Beans ON Products.productID = Products_Beans.productID 
INNER JOIN Beans ON Products_Beans.beanID = Beans.beanID;


--Display customer names, order numbers, product names, product quantities, and supplier names. (SELECT)

SELECT Customers.customerName, Orders.orderID, Products.productName, Orders_Products.productQTY, supplierName FROM Customers
INNER JOIN Orders ON Orders.customerID = Customers.customerID
INNER JOIN Orders_Products ON Orders_Products.orderID = Orders.orderID
INNER JOIN Products ON Orders_Products.productID = Products.productID
INNER JOIN Suppliers ON Products.supplierID = Suppliers.supplierID ORDER BY Customers.customerName;


--Search Customer Names Who Prefer A Particular Bean Type (Search/Filter)

SELECT Customers.customerName, Beans.beanName FROM Customers
INNER JOIN Orders ON Orders.customerID = Customers.customerID
INNER JOIN Orders_Products ON Orders_Products.orderID = Orders.orderID
INNER JOIN Products ON Orders_Products.productID = Products.productID
INNER JOIN Products_Beans ON Products.productID = Products_Beans.productID 
INNER JOIN Beans ON Products_Beans.beanID = Beans.beanID WHERE beanName = ':beanNameInput';


--Update Supplier Information (UPDATE)
​
UPDATE Suppliers SET supplierName = :supplierNameInput, supplierStreet = :supplierStreetInput, supplierCity = :supplierCityInput,
supplierState = :supplierStateInput, supplierPostalCode = :supplierPostalCodeInput, supplierCountry = :supplierCountryInput 
WHERE supplierID = :supplierformInput;