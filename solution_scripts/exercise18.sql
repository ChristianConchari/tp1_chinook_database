-- 18. Encuentra al artista con el mayor número de pistas para cada género.

WITH num_tracks_per_artist_genre AS (
    SELECT
        artist.artist_id,
        artist.name AS artist_name,
        genre.genre_id,
        genre.name AS genre_name,
        COUNT(track.track_id) AS count_tracks
    FROM track 
    JOIN album ON album.album_id = track.album_id
    JOIN artist ON album.artist_id = artist.artist_id
    JOIN genre ON track.genre_id = genre.genre_id
    GROUP BY artist.artist_id, artist.name, genre.genre_id, genre.name
),
max_num_tracks_per_genre AS (
    SELECT genre_id, MAX(count_tracks) as max_num_tracks
    FROM num_tracks_per_artist_genre
    GROUP BY genre_id
),
ranked_artists AS (
    SELECT
    num_tracks_per_artist_genre.artist_name,
    num_tracks_per_artist_genre.genre_name,
    num_tracks_per_artist_genre.count_tracks,
    ROW_NUMBER() OVER (
        PARTITION BY num_tracks_per_artist_genre.genre_id 
        ORDER BY num_tracks_per_artist_genre.count_tracks DESC,
        num_tracks_per_artist_genre.artist_name
    ) AS rank
    FROM num_tracks_per_artist_genre
    JOIN max_num_tracks_per_genre 
    ON num_tracks_per_artist_genre.genre_id = max_num_tracks_per_genre.genre_id
    AND num_tracks_per_artist_genre.count_tracks = max_num_tracks_per_genre.max_num_tracks
)
SELECT artist_name, genre_name, count_tracks
FROM ranked_artists
WHERE rank=1
ORDER BY genre_name ASC;
