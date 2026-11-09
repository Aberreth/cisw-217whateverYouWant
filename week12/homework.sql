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
