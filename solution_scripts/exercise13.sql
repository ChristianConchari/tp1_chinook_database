-- 13. Calcula el porcentaje del total de la factura que representa cada factura.

WITH total_invoice AS (
    SELECT 
        invoice_line.invoice_id,
        SUM(invoice_line.unit_price * invoice_line.quantity) AS total_invoice
    FROM invoice_line
    GROUP BY invoice_line.invoice_id
),
total_all_invoices AS (
    SELECT 
        SUM(total_invoice.total_invoice) AS total_all_invoices
    FROM total_invoice
)
SELECT 
    invoice.invoice_id,
    invoice.total,
    total_invoice.total_invoice,
    (ROUND(total_invoice.total_invoice / total_all_invoices.total_all_invoices, 4)) * 100 AS percentage
FROM invoice
JOIN total_invoice ON invoice.invoice_id = total_invoice.invoice_id,
total_all_invoices;