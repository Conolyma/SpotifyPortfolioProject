Select *
From spotifyproject.spotify2023;

-- Track name was imported weirdly, going to rename the column

-- renaming the track name column
alter table spotify2023
change column ï»¿track_name track_name text;

-- seeing if the change worked
use spotifyproject;
select track_name
from spotifyproject.spotify2023;

-- it worked!

-- the column artists(s)_name is causing issues, going to rename it to artist_names
alter table spotify2023
change column `artist(s)_name` artist_names text;

-- seeing if the change worked 
select artist_names	
from spotifyproject.spotify2023; 

-- It worked! Now for our original query.
-- Trying to see which songs rleased in 2023 were the most streamed.
Select track_name, artist_names, released_year, streams
from spotifyproject.spotify2023
where released_year = '2023'
order by streams desc;

-- encountered a really weird result with a lot of "Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½t" in columns, gonna see what I can do about it. 
-- checked the original excel file, a couple of columns have some or a compination of weird characters, must've been an error when the dataset author scraped the data. 
-- The errors are really wierd and random, since the data set isn't too large I'm going to attemt to fix this manually in the excel file.
-- going to add a new table titled spotify2023cl to spotifyproject schema, the cl stands for clean. I did my best trying to get rid as many errors as I could. 

Select *
from spotifyproject.spotify2023cleaned;

-- Now using the first query 
Select track_name, artist_names, released_year, streams
from spotifyproject.spotify2023cleaned
where released_year = '2023'
order by streams desc;

-- It finally works!!

-- Making quereys to answer question 1: What was the most streamed song in 2023?
Select track_name, artist_names, released_date, streams, in_spotify_charts
from spotifyproject.spotify2023cleaned
order by streams desc;

-- Exploring the data.
SELECT track_name, streams, 
       (in_spotify_playlists + in_apple_playlists + in_deezer_playlists) as Total_In_Playlists
FROM spotifyproject.spotify2023cleaned
ORDER BY streams DESC;

select track_name, streams,
	(in_spotify_playlists + in_apple_playlists + in_deezer_playlists) as Total_In_Playlists,
	(in_spotify_charts + in_apple_charts + in_deezer_charts + in_shazam_charts) as Total_In_Charts
FROM spotifyproject.spotify2023cleaned
order by streams desc;

-- Alright time to answer Question 1. 
select track_name, artist_names, artist_count, streams,
	(in_spotify_playlists + in_apple_playlists + in_deezer_playlists) as Total_In_Playlists,
	(in_spotify_charts + in_apple_charts + in_deezer_charts + in_shazam_charts) as Total_In_Charts
FROM spotifyproject.spotify2023cleaned
order by streams desc;

-- Gonna limit it to one
select track_name, artist_names, artist_count, streams,
	(in_spotify_playlists + in_apple_playlists + in_deezer_playlists) as Total_In_Playlists,
	(in_spotify_charts + in_apple_charts + in_deezer_charts + in_shazam_charts) as Total_In_Charts
FROM spotifyproject.spotify2023cleaned
order by streams desc
Limit 1;
-- The answer is Circles by Post Malone

-- Exploring the data to answer question 2: Who was the most streamed music artists in 2023?
SELECT artist_names, SUM(streams) AS Total_Streams
FROM spotifyproject.spotify2023cleaned
GROUP BY artist_names
ORDER BY Total_Streams DESC
LIMIT 1;
-- and of course, it's Taylor Swift

-- running the query without the limit because I'm curious
SELECT artist_names, SUM(streams) AS Total_Streams
FROM spotifyproject.spotify2023cleaned
GROUP BY artist_names
ORDER BY Total_Streams DESC;

-- Exploring the data to find out question 3: What was the most streamed song that came out in 2023?

SELECT track_name, released_date, 
       SUM(streams) AS Total_Streams,
       (SUM(in_spotify_playlists) + SUM(in_apple_playlists) + SUM(in_deezer_playlists)) AS Total_In_Playlists,
       (SUM(in_spotify_charts) + SUM(in_apple_charts) + SUM(in_deezer_charts) + SUM(in_shazam_charts)) AS Total_In_Charts
FROM spotifyproject.spotify2023cleaned
WHERE released_year = '2023'
GROUP BY track_name, released_date
ORDER BY Total_Streams DESC;

-- now to limit 1 
SELECT track_name, artist_names, released_date,
       SUM(streams) AS Total_Streams,
       (SUM(in_spotify_playlists) + SUM(in_apple_playlists) + SUM(in_deezer_playlists)) AS Total_In_Playlists,
       (SUM(in_spotify_charts) + SUM(in_apple_charts) + SUM(in_deezer_charts) + SUM(in_shazam_charts)) AS Total_In_Charts
FROM spotifyproject.spotify2023cleaned
WHERE released_year = '2023'
GROUP BY track_name, artist_names, released_date
ORDER BY Total_Streams DESC
Limit 1;

-- According to the results,  it's Ella Baila Sola by Eslabon Amrodo and Peso Pluma, released on 3/16/2023.

-- Now for the final question, did Jimi Hendrix make it to the list?
Select track_name, artist_names,  SUM(streams) AS Total_Streams,
       (SUM(in_spotify_playlists) + SUM(in_apple_playlists) + SUM(in_deezer_playlists)) AS Total_In_Playlists,
       (SUM(in_spotify_charts) + SUM(in_apple_charts) + SUM(in_deezer_charts) + SUM(in_shazam_charts)) AS Total_In_Charts
from spotifyproject.spotify2023cleaned
where artist_names = 'Jimi Hendrix'
group by track_name, artist_names;

-- According to the results, he sadly did not make it to the list. 

-- Getting some tables that I want to visualzize. 

-- Table 1 Top 10 streamed songs!
select track_name, artist_names, artist_count, streams,
	(in_spotify_playlists + in_apple_playlists + in_deezer_playlists) as Total_In_Playlists,
	(in_spotify_charts + in_apple_charts + in_deezer_charts + in_shazam_charts) as Total_In_Charts
FROM spotifyproject.spotify2023cleaned
order by streams desc
limit 10; 

-- Table 2 Top 10 streamed artists!
SELECT artist_names, SUM(streams) AS Total_Streams
FROM spotifyproject.spotify2023cleaned
GROUP BY artist_names
ORDER BY Total_Streams DESC
limit 10;

-- Table 3 Top 10 streamed songs released in 2023
SELECT track_name, released_date, 
       SUM(streams) AS Total_Streams,
       (SUM(in_spotify_playlists) + SUM(in_apple_playlists) + SUM(in_deezer_playlists)) AS Total_In_Playlists,
       (SUM(in_spotify_charts) + SUM(in_apple_charts) + SUM(in_deezer_charts) + SUM(in_shazam_charts)) AS Total_In_Charts
FROM spotifyproject.spotify2023cleaned
WHERE released_year = '2023'
GROUP BY track_name, released_date
ORDER BY Total_Streams DESC
Limit 10;

-- Table 4- Beter than Table 1 so I'm using this one instead.
SELECT track_name, artist_names, released_date,
       SUM(streams) AS Total_Streams,
       (SUM(in_spotify_playlists) + SUM(in_apple_playlists) + SUM(in_deezer_playlists)) AS Total_In_Playlists,
       (SUM(in_spotify_charts) + SUM(in_apple_charts) + SUM(in_deezer_charts) + SUM(in_shazam_charts)) AS Total_In_Charts
FROM spotifyproject.spotify2023cleaned
GROUP BY track_name, artist_names, released_date
ORDER BY Total_Streams DESC
Limit 10;

-- Table 5? Top 10 Arists Appearances
SELECT artist_names, COUNT(*) AS Artist_Appearances
FROM spotifyproject.spotify2023cleaned
GROUP BY artist_names
ORDER BY Artist_Appearances DESC
Limit 10;
