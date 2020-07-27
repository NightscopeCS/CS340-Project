CREATE TABLE Customers(
     customerID INT(20) AUTO_INCREMENT PRIMARY KEY NOT NULL,
     customerName VARCHAR(255) NOT NULL,
     customerStreet VARCHAR(255) NOT NULL,
     customerCity VARCHAR(255) NOT NULL,
     customerState VARCHAR(255) NOT NULL,
     customerPostalCode VARCHAR(255) NOT NULL,
     customerCountry VARCHAR(255) NOT NULL,
     customerPhone VARCHAR(255) NOT NULL,
     customerEmail VARCHAR(255) NOT NULL
     )ENGINE=innoDB;

CREATE TABLE Orders(
    orderID INT(20) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    customerID INT DEFAULT NULL,
    orderDate DATE NOT NULL,
    shippedDate DATE DEFAULT NULL
  )ENGINE=innoDB;

CREATE TABLE Products(
 productID INT(20) AUTO_INCREMENT PRIMARY KEY NOT NULL,
 productName VARCHAR(255) NOT NULL,
 supplierID INT DEFAULT NULL,
 productPrice DOUBLE NOT NULL
)ENGINE=innoDB;


CREATE TABLE Orders_Products(
  orderID INT,
  productID INT,
  productQTY INT(20) NOT NULL,
  PRIMARY KEY (orderID, productID)
  )ENGINE=InnoDB;

CREATE TABLE Beans(
 beanID INT(20) AUTO_INCREMENT PRIMARY KEY NOT NULL,
 beanName VARCHAR(255) NOT NULL
)ENGINE=innoDB;

CREATE TABLE Products_Beans(
 beanID INT DEFAULT NULL,
 productID INT DEFAULT NULL,
 PRIMARY KEY(beanID, productID)
)ENGINE=InnoDB;

CREATE TABLE Suppliers(
   supplierID INT(20) AUTO_INCREMENT PRIMARY KEY NOT NULL,
   supplierName VARCHAR(255) NOT NULL,
   supplierStreet VARCHAR(255) NOT NULL,
   supplierCity VARCHAR(255) NOT NULL,
   supplierState VARCHAR(255) NOT NULL,
   supplierPostalCode VARCHAR(255) NOT NULL,
   supplierCountry VARCHAR(255) NOT NULL
)ENGINE=innoDB;



ALTER TABLE Orders
ADD FOREIGN KEY(customerID)
REFERENCES Customers(customerID);

ALTER TABLE Products
ADD FOREIGN KEY(supplierID)
REFERENCES Suppliers(supplierID);

ALTER TABLE Orders_Products
ADD FOREIGN KEY(orderID)
REFERENCES Orders(orderID) ON DELETE CASCADE;


ALTER TABLE Orders_Products
ADD FOREIGN KEY(productID)
REFERENCES Products(productID) ON DELETE CASCADE;

ALTER TABLE Products_Beans
ADD FOREIGN KEY(beanID)
REFERENCES Beans(beanID);

ALTER TABLE Products_Beans
ADD FOREIGN KEY(productID)
REFERENCES Products(productID);

INSERT INTO Customers(customerName, customerStreet, customerCity,
customerState, customerPostalCode, customerCountry,
customerPhone, customerEmail) VALUES('Georgia J.', '45 West State',
'Chicago', 'IL', '60611', 'USA', '312-777-9999', 'GJ@georgia.com'),
('SightGlee Coffee', '212 7th Howard St.', 'San Francisco', 'CA',
'94108', 'USA', '415-888-8888', 'SC@sightglee.com'),
('Bird Coffee', '5 E 100th', 'New York', 'NY', '10012', 'USA',
  '212-111-2222', 'BC@birdcoffee.com'),
('Cafe Du Mond', '845 Decatur St.', 'New Orleans', 'LA', '70112',
'USA', '318-333-1111', 'CDM@cafedumond.com');

INSERT INTO Orders(customerID, orderDate, shippedDate) VALUES
(1, '2020-6-14', '2020-6-25'), (2, '2020-6-20', '2020-7-2'),
(3, '2020-7-1', NULL), (4, '2020-7-3', NULL);

INSERT INTO Suppliers(supplierName, supplierStreet, supplierCity, supplierState, 
supplierPostalCode, supplierCountry) VALUES('mc Food Products', '155 NW St. Helens', 
'New York', 'NY', '10012', 'USA'), ('Joes Gig Coffee', '29213 89nd Ave', 'Kent', 'WA', 
'98032', 'USA'), ('Coffee Bean Roaster', '3/8 Arkwrights Rd.', 'Rockingham', 'WA', 
'6168','Australia'), ('SA Coffee & Tea', '215 Concord Pkwy', 'South Concord', 'NC',
'28027', 'USA'); 

INSERT INTO Products(productName, supplierID, productPrice) VALUES
('SuuweetCF', 2, 20.78), ('Espresso7', 1, 30.50), ('CentralWay', 2, 25.98),
('SantosaOrganic', 3, 35.63), ('CostaricaTime', 4, 40.71);

INSERT INTO Beans(beanName) VALUES('Liberica'), 
('Robusta'), ('Arabica'), ('Columbia'), ('Arabica Peaberry'), ('Brazillian Peaberry'), ('Etiopian Arabica');

INSERT INTO Orders_Products(orderID, productID, productQTY) VALUES
(1,2,3), (1,4,1),(1,5,2),(2,1,4),(3,1,3), (3,2,5),(3,3,1),(4,2,5),(4,3,6);

insert into Products_Beans(beanID, productID) values(1,1),(3, 1),(3,2),(2,2),(5,3),
(7,3),(1,3),(2,4),(4,4),(4,5),(5,5),(6,5);






