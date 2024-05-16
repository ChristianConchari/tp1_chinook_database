-- 4. Encuentra la longitud total (en milisegundos) de todas las pistas para cada álbum.

SELECT album.title, SUM(track.milliseconds) AS total_length
FROM album as album
JOIN track as track ON album.album_id = track.album_id
GROUP BY album.title;