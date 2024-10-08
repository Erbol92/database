create database Homework;

create table if not exists GenreList (
	id SERIAL primary key,
	title VARCHAR(20)
);

create TABLE if not exists Artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) not null,
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES GenreList(id)
);

create table if not exists Album (
	id SERIAL primary key,
	title VARCHAR(60) not null,
	year INT not null,
	artist_id INT,
	foreign key (artist_id) references Artist(id)
);

create table if not exists Track (
	id SERIAL primary key,
	title VARCHAR(60),
	duration TIME,
	album_id INT,
	foreign key (album_id) references Album(id)
);

create table if not exists AlbumArtist (
	album_id INT,
	artist_id INT,
	PRIMARY KEY (artist_id, album_id),
	foreign key (album_id) references Album(id),
	foreign key (artist_id) references Artist(id)
);

create table if not exists GenreListAlbum (
	id SERIAL primary key,
	album_id INT,
	genrelist_id INT,
	foreign key (album_id) references Album(id),
	foreign key (genrelist_id) references GenreList(id)
);

create table if not exists Collections (
	id SERIAL primary key,
	title VARCHAR(20),
	year DATE
);

create table if not exists TrackCollections (
	track_id INT,
	collection_id INT,
	PRIMARY key (track_id, collection_id),
	foreign key (track_id) references Track(id),
	foreign key (collection_id) references Collections(id)
);