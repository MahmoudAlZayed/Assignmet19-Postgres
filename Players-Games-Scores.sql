{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;\f1\fnil\fcharset0 HelveticaNeue-Bold;\f2\fswiss\fcharset0 Helvetica;
}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red64\green108\blue176;}
{\*\expandedcolortbl;;\cssrgb\c0\c1\c1;\cssrgb\c31179\c50821\c74312;}
\paperw11900\paperh16840\margl1440\margr1440\vieww28600\viewh18000\viewkind0
\deftab560
\pard\pardeftab560\slleading20\partightenfactor0

\f0\fs26 \cf0 //Create Players Table :\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
CREATE TABLE players (\
id SERIAL PRIMARY KEY,\
name VARCHAR(50) NOT NULL,\
join_date DATE NOT NULL\
);\
\
//Insert players to Players Table :\
\
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 INSERT INTO players (name , join_date) VALUES\
('Mahmoud' , '2020-01-01'),\
('Ahmad' ,'2021-02-02'),\
(\'92Robert ,'2023-01-01),\
(\'92William ,'2024-02-02),\
(\'92Jim ,'2025-03-03),\
(\'92Alex ,'2025-03-03),\
(\'92Lars ,'2025-03-22),\
(\'92Catarina ,'2025-04-01),\
(\'92Emma,\'922025-04-20);\
\
//Create Games Table :\
\
CREATE TABLE games (\
id SERIAL PRIMARY KEY,\
title VARCHAR(100) NOT NULL,\
genre VARCHAR(100) NOT NULL\
);\
\
//Insert games to Games Table :\
\
INSERT INTO games (title , genre) VALUES\
('GTA' , 'ACTION'),\
('FIFA' ,'SPORT'),\
('SUPER MARIO' ,'ADVENTURE');\
\
//Create Scores Table : \
\
CREATE TABLE scores (\
id SERIAL PRIMARY KEY,\
player_id INT ,\
game_id INT ,\
score INT ,\
date_played DATE NOT NULL ,\
FOREIGN KEY (player_id) REFERENCES players (id),\
FOREIGN KEY (game_id) REFERENCES games (id)\
);\
\
//Insert scores to Scores Table : \
\
INSERT INTO scores (player_id , game_id , score , date_played) VALUES\
(1,2,'100','2020-02-01') , (2,2,'150','2021-04-01'), (2,3,'70','2021-05-01') ,\
(1,3,'20','2022-02-01') , (1,3,'500','2023-02-01')\
\
INSERT INTO scores (player_id , game_id , score , date_played) VALUES\
(4,2,'30','2024-02-01') , (4,2,'155','2024-04-01'), (6,3,'70','2025-05-01') ,\
(1,3,'20','2022-02-01') , (6,3,'550','2025-04-01')\
\
\pard\pardeftab560\slleading20\partightenfactor0

\f1\b \cf0 // Task 1 : List All Players and Their Scores\'a0:\
\pard\pardeftab560\slleading20\partightenfactor0

\f0\b0 \cf0 \
SELECT players.name, scores.score\
FROM players\
LEFT JOIN scores ON players.id = scores.player_id\
\
//Task 2 : The top 3 players with the highest total scores :\
\
SELECT players.name ,SUM(scores.score) AS total_score\
FROM players\
JOIN scores ON players.id = scores.player_id\
GROUP BY players.name\
ORDER BY total_score DESC LIMIT 3\
\
//Task 3 : Players who haven\'92t played any games:\
\
SELECT players.name\
FROM players\
LEFT JOIN scores ON players.id = scores.player_id\
WHERE scores.id IS NULL\
\
//Task 4 : 
\f2\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec3 Popular Game Genres\'a0:\

\f0\fs26 \AppleTypeServices \cf0 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
SELECT games.title , COUNT(scores.id) AS times_played\
FROM games\
JOIN scores ON games.id = scores.game_id\
GROUP BY games.title\
ORDER BY times_played DESC LIMIT 1;\
\
\pard\pardeftab560\slleading20\partightenfactor0

\f1\b \cf0 //Task 5 : Recently Joined Players\'a0 : \
\
SELECT name \
FROM players\
WHERE join_date >= NOW () - INTERVAL '30 days' }