create database HomeWork;

create table if not exists GenreList (
	id SERIAL primary key,
	title VARCHAR(20)
);

create TABLE if not exists Artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) not null
);

CREATE TABLE IF NOT EXISTS Album (
    id SERIAL PRIMARY KEY,
    title VARCHAR(60) NOT NULL,
    year INT NOT NULL CHECK (year BETWEEN 1900 AND EXTRACT(YEAR FROM CURRENT_DATE)),
    UNIQUE (title)
);


create table if not exists Track (
	id SERIAL primary key,
	title VARCHAR(60) not null ,
	duration INT not null CHECK (duration > 1),
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
	title VARCHAR(20) not null,
	year INT NOT NULL CHECK (year BETWEEN 1900 AND EXTRACT(YEAR FROM CURRENT_DATE)),
	UNIQUE (title)
);

create table if not exists TrackCollections (
	track_id INT,
	collection_id INT,
	PRIMARY key (track_id, collection_id),
	foreign key (track_id) references Track(id),
	foreign key (collection_id) references Collections(id)
);