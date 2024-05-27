-- 20. Encuentra cuántas pistas de más de 3 minutos tiene cada álbum.

WITH track_duration AS (
    SELECT
        album_id,
        COUNT(*) AS track_count
    FROM track
    WHERE milliseconds > 180000
    GROUP BY album_id
)
SELECT
    album_id,
    track_count
FROM track_duration
ORDER BY album_id;