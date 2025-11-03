
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

CREATE TABLE order_items (
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER CHECK (quantity > 0),
	PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO customers (name, email)
VALUES
('Anna Ivanova', 'anna@example.com'),
('Oleh Petrenko', 'oleh@example.com'),
('Maria Kovalenko', 'maria@example.com');

INSERT INTO employees (name, position)
VALUES
('Dmytro Bondar', 'Manager'),
('Iryna Shevchenko', 'Salesperson'),
('Andriy Kravets', 'Cashier');

INSERT INTO categories (name)
VALUES
('Electronics'), 
('Furniture'), 
('Clothing');

INSERT INTO products (name, price, category_id)
VALUES
('Laptop', 25000, 1),
('Chair', 800, 2),
('T-shirt', 400, 3);

INSERT INTO orders (customer_id, employee_id)
VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 5);

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM order_items;
