
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50) CHECK (position <> '')
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DOUBLE PRECISION CHECK (price > 0),
    category_id INTEGER NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    customer_id INTEGER NOT NULL,
    employee_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

-- order_items з ON DELETE CASCADE
CREATE TABLE order_items (
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO customers (name, email)
VALUES
('Julia Sakhniuk', 'julia@example.com'),
('Ivan Petrenko', 'ivan.p@gmail.com');
SELECT * FROM customers;

INSERT INTO employees (name, position)
VALUES
('Andrii Shevchenko', 'Manager'),
('Olena Koval', 'Consultant');
SELECT * FROM employees;

INSERT INTO categories (name)
VALUES
('Electronics'),
('Clothes');
SELECT * FROM categories;

INSERT INTO products (name, price, category_id)
VALUES
('iPhone 15', 1200, 1),
('T-Shirt Nike', 45, 2);
SELECT * FROM products;

INSERT INTO orders (customer_id, employee_id)
VALUES
(1, 1),
(2, 2);
SELECT * FROM orders;

INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1, 1, 1),
(2, 2, 2);


SELECT * FROM order_items;

SELECT id, name, email 
FROM customers
WHERE email = 'julia@example.com';

SELECT name, price 
FROM products 
WHERE price > 1000;

SELECT orders.id AS order_id, customers.name AS customer_name, employees.name AS employee_name
FROM orders
JOIN customers ON orders.customer_id = customers.id
JOIN employees ON orders.employee_id = employees.id
WHERE employees.name = 'Andrii Shevchenko';

SELECT products.name AS product_name, categories.name AS category_name
FROM products
JOIN categories ON products.category_id = categories.id
WHERE categories.name = 'Electronics';



INSERT INTO customers (name, email) 
VALUES ('Petro Ivanov', 'petro@example.com');

INSERT INTO employees (name, position) 
VALUES ('Maria Kozak', 'Sales');

INSERT INTO categories (name) 
VALUES ('Books');

INSERT INTO products (name, price, category_id) 
VALUES ('MacBook Pro', 2500, 1);


UPDATE customers 
SET email = 'julia.updated@example.com' 
WHERE id = 1;

UPDATE products 
SET price = 1300 
WHERE name = 'iPhone 15';

UPDATE employees 
SET position = 'Senior Manager' 
WHERE id = 1;




DELETE FROM orders 
WHERE id = 2;

DELETE FROM products 
WHERE name = 'T-Shirt Nike';

DELETE FROM categories 
WHERE name = 'Clothes';
