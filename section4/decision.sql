--
SELECT product_name, units_in_stock
FROM products
WHERE units_in_stock < ALL (SELECT avg(quantity)
                            FROM order_details
                            group by product_id)
ORDER BY units_in_stock DESC;

--
SELECT customer_id, sum(freight) AS freight_sum
FROM orders
         JOIN (SELECT customer_id, avg(freight) AS freight_avg
               FROM orders
               GROUP BY customer_id) as query USING (customer_id)
WHERE freight > freight_avg
  AND shipped_date BETWEEN '1996-07-16' AND '1996-07-31'
GROUP BY customer_id
ORDER BY freight_sum;

--
SELECT customer_id, ship_country, order_price
FROM orders
         JOIN
     (SELECT order_id, sum(unit_price * quantity - unit_price * quantity * discount) AS order_price
      FROM order_details
      GROUP BY order_id) as sub_query USING (order_id)
WHERE ship_country IN ('Argentina', 'Bolivia', 'Brazil', 'Chile', 'Colombia', 'Ecuador', 'Guyana', 'Paraguay',
                       'Peru', 'Suriname', 'Uruguay', 'Venezuela')
  AND order_date > '1997-09-01'
ORDER BY order_price DESC
LIMIT 3;

--
SELECT DISTINCT product_name
FROM products
WHERE exists(SELECT * FROM order_details WHERE products.product_id = order_details.product_id AND quantity = 10)
--EXCEPT
SELECT product_name
FROM products
WHERE product_id IN (SELECT product_id FROM order_details WHERE quantity = 10);



