-- 3. Cuenta el número de pistas por género.

SELECT genre.name, COUNT(track.genre_id) AS track_count
FROM genre
JOIN track ON genre.genre_id = track.genre_id
GROUP BY genre.name;