--ЗАДАНИЕ №2
--Название и продолжительность самого длительного трека.
select t."name", t.duration 
from track t
where t.duration  = 
	 (select max(f.duration) from track as f);

--Название треков, продолжительность которых не менее 3,5 минут.

select t.name 
from track t
where t.duration >= 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select c.name 
from collection c
where c.year between 2018 and 2020;

--Исполнители, чьё имя состоит из одного слова.
select ma.name 
from music_artist ma  
where ma."name" not like '% %';

--Название треков, которые содержат слово «мой» или «my»
select t.name 
from track t
where t.name like 'My%' or t.name like '% my %' or t.name = 'my'
or t.name like 'Мой%' or t.name like '% мой %' or t.name = 'мой';

--ЗАДАНИЕ №3
--Количество исполнителей в каждом жанре.
select g.name, count(*) 
from genre g  
	 join genre_musartist gm 
	 on gm.genre_id  = g.id 
group by g.name;

--Количество треков, вошедших в альбомы 2019–2020 годов.
select count(t.id) 
from album a 
	 join track t 
	 ON t.album_id = a.id 
where a."year" > 2018 and a."year" < 2021;

--Средняя продолжительность треков по каждому альбому.
select a.name, avg(t.duration) 
from album a 
	 join track t 
	 ON t.album_id = a.id 
group by a.name;

--Все исполнители, которые не выпустили альбомы в 2020 году.
select ma."name" , ma.id 
from music_artist ma
where ma.id not in 
	  (select distinct aa.mus_artist_id 
	   from artist_album aa
			join album a 
			on a.id = aa.album_id
		where a.year = 2020);

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select c."name" 
from collection c
	 join collection_track ct 
	 on c.id = ct.collection_id 
	 join track t 
	 on ct.track_id = t.id 	 
	 join album a 
	 on t.album_id = a.id 
	 join artist_album aa 
	 on a.id = aa.album_id
	 join music_artist ma
	 on aa.mus_artist_id = ma.id
where ma.name = 'XOLIDAYBOY';

--ЗАДАНИЕ №4
-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
select r."name"  
from (select a."name", count(gm.genre_id) as genre_total
	  from album a 
	  join artist_album aa on aa.album_id = a.id 
	  join genre_musartist gm on aa.mus_artist_id = gm.mus_artist_id
	  group by a.name) as r
where r.genre_total > 1;

--Наименования треков, которые не входят в сборники.
select t.name, t.id
from track t 
left join collection_track ct on t.id = ct.track_id 
where ct.collection_id is null;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
select ma.name 
from music_artist ma 
join artist_album aa on aa.mus_artist_id = ma.id 
join track t on t.album_id = aa.album_id 
where t.duration = (select min(t2.duration) 
					from track t2);
				
--Названия альбомов, содержащих наименьшее количество треков.
select a.name
from album a 
join track t on t.album_id = a.id
where t.duration = (select min(t2.duration) 
					from track t2);
			

	