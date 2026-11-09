CREATE TABLE artists(
id serial PRIMARY KEY,
name text,
songs_owned int);

create table songs(
id serial PRIMARY KEY,
artist_id int,
title text,
album text,
genre text,
release_date date,
FOREIGN KEY(artist_id) REFERENCES artists);

-- 1. My project theme is music. The data for the songs comes from all the music I have saved on my laptop, with most of the song metadata being provided by the Musicbrainz database through Musicbrainz Picard.
-- 2. "artists" is the parent table, "songs" is the child table. Each artist can be associated with many songs, but each song will only be associated one artist, under this system. What is a collab I have never heard of that shhhhhh.
-- 3. "id" is the primary key of both tables. "artist_id" is a foreign key in the songs table which is associated with an Artist in the artists table.
-- 4. Each song can also be associated with one album, and a genre. More categories can be added, as Musicbrainz supplies a lot of useful metadata on each song. I have over 600 songs downloaded, so I have a lot of data I could put in the table.
