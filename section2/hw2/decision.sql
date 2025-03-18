SELECT *
FROM orders
WHERE ship_country IN ('France', 'Austria', 'Spain');

SELECT *
FROM orders
ORDER BY required_date DESC, shipped_date;

SELECT min(unit_price)
FROM products
WHERE units_in_stock > 30;

SELECT max(units_in_stock)
FROM products
WHERE unit_price > 30;

SELECT avg(shipped_date - order_date)
FROM orders
WHERE ship_country = 'USA';

SELECT sum(unit_price * units_in_stock)
FROM products
WHERE discontinued <> 1;