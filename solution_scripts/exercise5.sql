-- 5. Lista los 10 álbumes con más pistas.

SELECT album.title, COUNT(track.track_id) as track_count
FROM album
JOIN track ON album.album_id = track.album_id
GROUP BY album.title, album.album_id
ORDER BY track_count DESC
LIMIT 10;