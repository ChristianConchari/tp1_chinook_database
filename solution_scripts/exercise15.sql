-- 15. Para cada cliente, compara su gasto total con el del cliente que gastó más

WITH total_spent_per_customer AS (
    SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) AS total_spent
    FROM customer
    JOIN invoice ON customer.customer_id = invoice.customer_id
    GROUP BY customer.customer_id
),
max_spent_customer AS (
    SELECT MAX(total_spent) AS max_spent
    FROM total_spent_per_customer
)
SELECT 
    total_spent_per_customer.customer_id,
    total_spent_per_customer.first_name,
    total_spent_per_customer.last_name,
    total_spent_per_customer.total_spent,
    ROUND(total_spent_per_customer.total_spent/max_spent_customer.max_spent, 4) AS proportion
FROM total_spent_per_customer, max_spent_customer
ORDER BY proportion DESC;