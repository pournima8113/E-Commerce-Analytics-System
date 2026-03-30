SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;
SELECT MONTH(order_date) AS month, SUM(total_amount) AS revenue
FROM orders
GROUP BY month;
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;
SELECT c.name,
CASE
    WHEN SUM(o.total_amount) > 50000 THEN 'High Value'
    WHEN SUM(o.total_amount) BETWEEN 20000 AND 50000 THEN 'Medium Value'
    ELSE 'Low Value'
END AS customer_type
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;
SELECT name, total_spent,
RANK() OVER (ORDER BY total_spent DESC) AS rank_no
FROM (
    SELECT c.name, SUM(o.total_amount) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.name
) AS sub;