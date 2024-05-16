-- 16. Para cada factura, calcula la diferencia en el gasto total entre ella y la factura anterior.

SELECT 
    invoice_id, 
    invoice_date, 
    total,
    LAG(total, 1) OVER (ORDER BY invoice_date ASC) AS previous_invoice_total,
    total - LAG(total, 1) OVER (ORDER BY invoice_date ASC) AS difference
FROM invoice
ORDER BY invoice_date ASC;