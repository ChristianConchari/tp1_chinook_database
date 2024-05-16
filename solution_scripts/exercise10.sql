-- 10. Para cada artista, encuentra el álbum con más pistas y clasifica a los artistas por este número.

WITH track_count AS (
    SELECT 
        artist.artist_id, 
        artist.name AS artist_name,
        album.album_id,
        album.title AS album_title, 
        COUNT(track.track_id) AS num_tracks
    FROM album as album
    JOIN track as track ON album.album_id = track.album_id
    JOIN artist as artist ON album.artist_id = artist.artist_id
    GROUP BY artist.artist_id, artist.name, album.album_id, album.title
),
max_track_count AS (
    SELECT 
        track_count.artist_id, 
        MAX(num_tracks) AS max_num_tracks
    FROM track_count as track_count
    GROUP BY track_count.artist_id
),
album_with_max_tracks AS (
    SELECT 
        track_count.artist_id,
        track_count.artist_name,
        track_count.album_title,
        track_count.num_tracks
    FROM 
        track_count AS track_count
    JOIN 
        max_track_count AS max_track_count ON track_count.artist_id = max_track_count.artist_id 
        AND track_count.num_tracks = max_track_count.max_num_tracks
)
SELECT artist.artist_id, artist.name, max_track_count.max_num_tracks
FROM artist as artist
JOIN max_track_count ON artist.artist_id = max_track_count.artist_id
ORDER BY max_track_count.max_num_tracks DESC;