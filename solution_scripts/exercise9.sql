-- 9. Clasifica a los clientes en cada país por la cantidad total que han gastado.

SELECT invoice.billing_country, invoice.customer_id, SUM(invoice.total) AS total_spent
FROM invoice
GROUP BY invoice.billing_country, invoice.customer_id
ORDER BY invoice.billing_country, total_spent DESC;
