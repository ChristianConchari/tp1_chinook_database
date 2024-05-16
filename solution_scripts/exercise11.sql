-- 11. Selecciona todas las pistas que tienen la palabra "love" en su título.

SELECT track.track_id, track.name
FROM track
WHERE track.name ~* '\mlove\M';