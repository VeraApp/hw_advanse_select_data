insert into genre(name)
values
	('Поп'),
	('Рок'),
	('Рэп'),
	('Indie Rock');
	
insert into music_artist(name)
values ('Mary Gu'),
		('Green Apelsin'),
		('XOLIDAYBOY'),
		('Imagine Dragons'),
		('Adele'),
		('Мари Краймбрери');
		
insert into genre_musartist (genre_id, mus_artist_id)
values (1, 1), (4, 1), 
       (2, 2), (4, 2),
       (3, 3), (4, 3),
       (2, 4), 
       (1, 5), 
       (1, 6);	

insert into album(name, year)
values ('Хорошее и плохое', 2021),
('Плохое и хорошее', 2021),
('Северный ветер', 2021),
('Божественная комедия', 2022),
('Origins', 2019),
('Evolve', 2017),
('21', 2020),
('25', 2019),
('Нас узнает весь мир', 2022);

insert into artist_album (mus_artist_id, album_id)
values  (1, 1), (1,2), 
		(2, 3), 
		(3, 4), 
		(4, 5), (4, 6), 
		(5, 7), (5, 8), 
		(6,9);

insert into track(name, duration, album_id)
values ('Косички', 148, 1),
('Вечеринки', 185, 1),
('Небо', 132, 2),
('Пиьмо', 136, 2),
('Охота на лисицу ', 192, 3),
('Труп невесты', 205, 3),
('Мой Данте', 202, 4),
('Natural', 189, 5),
('Bad liar', 260, 5),
('Beliver', 204, 6),
('Yesterday', 205, 6),
('Radioactive', 188, 6),
('Rolling in the deep', 228, 7),
('My little love', 389, 7),
('AMORE', 194, 9),
('Самолет', 188, 9),
('Океаны', 166, 9),
('Мания', 191, 9);

insert into collection ("name", year)
values('Рок', 2019),
('Лучшее 2020-2023',2023),
('Микс', 2020),
('Караоке', 2024),
('Adele mix', 2020)

insert into collection_track(collection_id, track_id)
values (1, 5), (1, 6), (1, 8), (1, 9), (1, 10), (1, 12), (1, 11),
(2, 1), (2, 3), (2, 7), (2, 8), (2, 12), (2, 15), (2, 17),
(3, 2), (3, 1), (3, 7), (3, 9), (3, 10), (3, 12), (3, 13), (3, 16), (3, 17), (3, 18),
(5, 13), (5, 14)

