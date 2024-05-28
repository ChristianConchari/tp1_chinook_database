-- 7. Para cada cliente, encuentra la cantidad total que han gastado.

SELECT customer.first_name, customer.last_name, SUM(invoice.total) AS total_spent
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id;