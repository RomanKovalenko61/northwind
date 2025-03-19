SELECT c.company_name, concat(first_name, ' ', last_name) AS employee_name
FROM orders o
         JOIN customers c USING (customer_id)
         JOIN employees e USING (employee_id)
         JOIN shippers s on o.ship_via = s.shipper_id
WHERE c.city = 'London'
  AND e.city = 'London'
  AND s.company_name = 'Speedy Express';

SELECT product_name, units_in_stock, contact_name, phone
FROM products
         JOIN categories USING (category_id)
         JOIN suppliers USING (supplier_id)
WHERE category_name IN ('Beverages', 'Seafood')
  AND units_in_stock < 20
  AND discontinued = 0;

SELECT contact_name, order_id
FROM customers
         LEFT JOIN orders USING (customer_id)
WHERE order_id IS NULL;

SELECT contact_name, order_id
FROM orders
         RIGHT JOIN customers USING (customer_id)
WHERE order_id IS NULL;