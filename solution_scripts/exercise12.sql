-- 12. Selecciona a todos los clientes cuyo primer nombre comienza con 'A'.

SELECT customer_id, first_name
FROM customer
WHERE first_name ~* '^a';