-- 8. Para cada país, encuentra la cantidad total gastada por los clientes.

SELECT invoice.billing_country as country, SUM(invoice.total) as total_spent
FROM invoice
GROUP BY invoice.billing_country;