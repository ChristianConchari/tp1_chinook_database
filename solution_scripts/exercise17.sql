-- 17. Para cada factura, calcula la diferencia en el gasto total entre ella y la próxima factura.

SELECT 
    invoice_id, 
    invoice_date, 
    total,
    LEAD(total) OVER (ORDER BY invoice_date ASC) AS next_invoice_total,
    LEAD(total) OVER (ORDER BY invoice_date ASC) - total AS difference
FROM invoice
ORDER BY invoice_date ASC;