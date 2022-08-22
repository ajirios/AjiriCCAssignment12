-- CREATE DATABASE pizzaDB;

-- CREATE TABLE pizzaDB.`customers` (
-- 	customerID INT NOT NULL,
--     customerName VARCHAR(500),
--     phoneNumber VARCHAR(20),
--     PRIMARY KEY (customerID)
-- );

-- CREATE TABLE pizzaDB.`pizzas` (
-- 	pizzaNumber INT NOT NULL,
--     pizzaName VARCHAR(500),
--     price DECIMAL(8,2),
--     PRIMARY KEY (pizzaNumber) 
-- );

-- CREATE TABLE pizzaDB.`orders` (
-- 	orderNumber INT NOT NULL,
--     orderDate DATETIME,
--     PRIMARY KEY (orderNumber)
-- );

-- CREATE TABLE pizzaDB.`pizza_orders` (
-- 	orderNumber INT NOT NULL,
--     pizzaNumber INT NOT NULL,
--     quantity INT,
--     FOREIGN KEY (orderNumber) REFERENCES `orders`(orderNumber),
--     FOREIGN KEY (pizzaNumber) REFERENCES `pizzas`(pizzaNumber)
-- );

-- CREATE TABLE pizzaDB.`customer_orders` (
-- 	customerID INT NOT NULL,
--     orderNumber INT NOT NULL,
--     FOREIGN KEY (customerID) REFERENCES `customers`(customerID),
--     FOREIGN KEY (orderNumber) REFERENCES `orders`(orderNumber)
-- );


-- INSERT INTO pizzaDB.pizzas (pizzaNumber, pizzaName, price) VALUES (1, 'Pepperoni & Cheese', 7.99);
-- INSERT INTO pizzaDB.pizzas (pizzaNumber, pizzaName, price) VALUES (2, 'Vegetarian', 9.99);
-- INSERT INTO pizzaDB.pizzas (pizzaNumber, pizzaName, price) VALUES (3, 'Meat Lovers', 14.99);
-- INSERT INTO pizzaDB.pizzas (pizzaNumber, pizzaName, price) VALUES (4, 'Hawaiian', 12.99);

-- INSERT INTO pizzaDB.customers (customerID, customerName, phoneNumber) VALUES (10000001, 'Trevor Page', '226-555-4982');

-- INSERT INTO pizzaDB.customers (customerID, customerName, phoneNumber) VALUES (10000002, 'John Doe', '555-555-9498');

-- INSERT INTO pizzaDB.orders (orderNumber, orderDate) VALUES (10001, '2014-10-09 09:47:00');
-- INSERT INTO pizzaDB.customer_orders (customerID, orderNumber) VALUES (10000001, 10001);
-- INSERT INTO pizzaDB.pizza_orders (orderNumber, pizzaNumber, quantity) VALUES (10001, 1, 1);
-- INSERT INTO pizzaDB.pizza_orders (orderNumber, pizzaNumber, quantity) VALUES (10001, 3, 1);

-- INSERT INTO pizzaDB.orders (orderNumber, orderDate) VALUES (10002, '2014-10-09 13:20:00');
-- INSERT INTO pizzaDB.customer_orders (customerID, orderNumber) VALUES (10000002, 10002);
-- INSERT INTO pizzaDB.pizza_orders (orderNumber, pizzaNumber, quantity) VALUES (10002, 2, 1);
-- INSERT INTO pizzaDB.pizza_orders (orderNumber, pizzaNumber, quantity) VALUES (10002, 3, 2);

-- INSERT INTO pizzaDB.orders (orderNumber, orderDate) VALUES (10003, '2014-10-09 9:47:00');
-- INSERT INTO pizzaDB.customer_orders (customerID, orderNumber) VALUES (10000001, 10003);
-- INSERT INTO pizzaDB.pizza_orders (orderNumber, pizzaNumber, quantity) VALUES (10003, 3, 1);
-- INSERT INTO pizzaDB.pizza_orders (orderNumber, pizzaNumber, quantity) VALUES (10003, 4, 1);

-- SELECT customers.customerID, customerName, SUM(price * quantity) FROM customers 
-- JOIN customer_orders ON customers.customerID = customer_orders.customerID 
-- JOIN orders ON customer_orders.orderNumber = orders.orderNumber 
-- JOIN pizza_orders ON pizza_orders.orderNumber = orders.orderNumber 
-- JOIN pizzas ON pizzas.pizzaNumber = pizza_orders.pizzaNumber   
-- GROUP BY customers.customerID;


SELECT customers.customerID, customerName, orderDate, SUM(price * quantity) FROM customers 
JOIN customer_orders ON customers.customerID = customer_orders.customerID 
JOIN orders ON customer_orders.orderNumber = orders.orderNumber 
JOIN pizza_orders ON pizza_orders.orderNumber = orders.orderNumber 
JOIN pizzas ON pizzas.pizzaNumber = pizza_orders.pizzaNumber 
GROUP BY customers.customerID
HAVING orderDate > '2014-10-09 10:00:00';
