-- 14. Calcula el porcentaje de pistas que representa cada género.

WITH total_tracks AS (
    SELECT COUNT(track_id) AS total_tracks
    FROM track
),
num_tracks_per_genre AS (
    SELECT genre.genre_id, genre.name AS genre_name, COUNT(track.track_id) AS count_tracks
    FROM track
    JOIN genre ON track.genre_id = genre.genre_id
    GROUP BY genre.genre_id, genre.name
)
SELECT
    num_tracks_per_genre.genre_id,
    num_tracks_per_genre.genre_name,
    num_tracks_per_genre.count_tracks,
    ROUND((num_tracks_per_genre.count_tracks::decimal / total_tracks.total_tracks) * 100, 4) AS percentage
FROM num_tracks_per_genre, total_tracks
ORDER BY percentage DESC;