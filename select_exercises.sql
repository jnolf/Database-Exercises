USE albums_db;
#SHOW TABLES IN CLI

SELECT *
FROM albums;
# 31 rows in database

SELECT COUNT(DISTINCT artist)
FROM albums;
# 23 unique artists in database

DESCRIBE albums;
# id is PRI 

SELECT *
FROM albums;
#In 1967 The Beatles released Sgt. Pepper's

----------------------------------------------

SELECT *
FROM albums
WHERE artist = 'Pink Floyd';
#DSotM and The Wall

SELECT release_date
FROM albums
WHERE NAME = 'Sgt. Pepper\'s Lonely Hearts Club Band';
#In 1967

SELECT genre
FROM albums
WHERE NAME = 'Nevermind';
#Grunge, Alt Rock

SELECT *
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;
#A few good, a few not so good :)

SELECT *
FROM albums 
WHERE sales < 20;
#13 of the greatest albms of all time. Especially Grease. :o

SELECT *
FROM albums
WHERE genre = 'Rock';
# Because the word "Hard" isn't inculded IN my "...".
