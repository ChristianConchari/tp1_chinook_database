-- 13. Calcula el porcentaje del total de la factura que representa cada factura.

WITH total_invoice AS (
    SELECT invoice_id, SUM(unit_price * quantity) AS total_invoice
    FROM invoice_line
    GROUP BY invoice_id
),
total_all_invoices AS (
    SELECT SUM(total_invoice) AS total_all_invoices
    FROM total_invoice
)
SELECT 
    invoice.invoice_id,
    total_invoice.total_invoice,
    total_all_invoices.total_all_invoices,
    (ROUND(total_invoice.total_invoice / total_all_invoices.total_all_invoices, 4)) * 100 AS percentage
FROM invoice
JOIN total_invoice ON invoice.invoice_id = total_invoice.invoice_id, total_all_invoices;