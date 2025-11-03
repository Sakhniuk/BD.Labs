INSERT INTO customers (name, email)
VALUES
('Anna Ivanova', 'anna@example.com'),
('Oleh Petrenko', 'oleh@example.com'),
('Kolya Yermolenko', 'kolya@example.com'),
('Maria Kovalenko', 'maria@example.com');

INSERT INTO employees (name, position)
VALUES
('Dmytro Bondar', 'Manager'),
('Vova Sharpenlo', 'Support'),
('Iryna Shevchenko', 'Salesperson'),
('Andriy Kravets', 'Cashier');

INSERT INTO categories (name)
VALUES
('Electronics'), 
('Furniture'),
('Books'),
('Clothing');

INSERT INTO products (name, price, category_id)
VALUES
('Laptop', 25000, 1),
('Chair', 800, 2),
('T-shirt', 400, 3),
('Magazine', 500, 4);

INSERT INTO orders (customer_id, employee_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 5),
(4, 4, 3);

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM order_items;
