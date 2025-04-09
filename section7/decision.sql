CREATE OR REPLACE VIEW orders_customers_employees AS
SELECT order_date,
       required_date,
       shipped_date,
       ship_postal_code,
       company_name,
       contact_name,
       phone,
       last_name,
       first_name,
       title
FROM orders
         JOIN customers USING (customer_id)
         JOIN employees USING (employee_id);

SELECT *
FROM orders_customers_employees
WHERE order_date > '1997-01-01'
ORDER BY order_date;



CREATE OR REPLACE VIEW o_c_emp AS
SELECT order_date,
       required_date,
       shipped_date,
       ship_postal_code,
       ship_country,
       company_name,
       contact_name,
       phone,
       last_name,
       first_name,
       title
FROM orders
         JOIN customers USING (customer_id)
         JOIN employees USING (employee_id);

CREATE OR REPLACE VIEW o_c_emp AS
SELECT order_date,
       required_date,
       shipped_date,
       ship_postal_code,
       ship_country,
       c.postal_code,
       reports_to,
       company_name,
       contact_name,
       phone,
       last_name,
       first_name,
       title
FROM orders
         JOIN customers c USING (customer_id)
         JOIN employees USING (employee_id);

ALTER VIEW o_c_emp RENAME TO o_c_emp_old;

SELECT *
FROM o_c_emp
WHERE ship_country = 'USA';

DROP VIEW IF EXISTS o_c_emp_old;

CREATE VIEW active_products AS
SELECT *
FROM products
WHERE discontinued <> 1
WITH LOCAL CHECK OPTION;

SELECT *
FROM active_products;

INSERT INTO active_products
VALUES (9999, 'prod', 1, 1, 10, 20, 20, 10, 1, 0);

SELECT *
FROM products
WHERE product_id = 9999;

DELETE
FROM products
WHERE product_id = 9999;

INSERT INTO active_products
VALUES (9999, 'prod', 1, 1, 10, 20, 20, 10, 1, 1);

