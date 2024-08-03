create table if not exists genre(
	id serial primary key,
	name varchar(255) unique not null);

create table if not exists music_artist(
	id serial primary key,
	name varchar(100) unique not null
);
create table if not exists genre_musartist(
	genre_id integer not null references genre(id),
	mus_artist_id integer not null references music_artist(id),
	constraint pk primary key (genre_id, mus_artist_id)
);
create table if not exists album(
	id serial primary key,
	name varchar(100) not null,
	year integer
);
create table if not exists artist_album(
	mus_artist_id integer not null references music_artist(id),
	album_id integer not null references album(id),
	constraint pk2 primary key (mus_artist_id, album_id)
);

create table if not exists track(
	id serial primary key,
	name varchar(60) not null,
	duration integer,
	album_id integer not null references album(id)
);

create table if not exists collection(
	id serial primary key,
	name varchar(100) not null,
	year integer not null
	
);

create table if not exists collection_track(
	collection_id integer not null references collection(id),
	track_id integer not null references track(id),
	constraint pk3 primary key (collection_id, track_id)
);
