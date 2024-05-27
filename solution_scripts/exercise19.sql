-- 19. Compara el total de la última factura de cada cliente con el total de su factura anterior.

WITH last_invoice_per_customer AS (
    SELECT
        invoice_id,
        customer_id,
        invoice_date,
        total,
        LAG(total) OVER (
            PARTITION BY customer_id
            ORDER BY invoice_date
        ) AS previous_total
    FROM invoice
)
SELECT
    customer_id,
    invoice_id AS current_invoice_id,
    total AS current_invoice_total,
    previous_total,
    (total - previous_total) AS difference
FROM last_invoice_per_customer
ORDER BY customer_id, invoice_date;
    
    
