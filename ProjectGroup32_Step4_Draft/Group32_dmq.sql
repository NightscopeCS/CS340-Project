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
WHERE supplieriD = :supplierformInput;

--Remove 
DELETE from Customers
WHERE customerID = (:homeTeamID_selected_from_games_page AND :awayTeamID_selected_from_games_page)