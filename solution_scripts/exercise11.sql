-- 11. Selecciona todas las pistas que tienen la palabra "love" en su título.

SELECT track_id, name
FROM track
WHERE name ~* '\mlove\M';