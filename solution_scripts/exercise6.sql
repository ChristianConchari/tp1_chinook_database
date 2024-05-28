-- 6. Encuentra la longitud promedio de la pista para cada género.

SELECT genre.name, ROUND(AVG(milliseconds), 2) AS avg_length
FROM track
JOIN genre ON track.genre_id = genre.genre_id
GROUP BY genre.name;