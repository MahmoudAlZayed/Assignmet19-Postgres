//Create Players Table :

CREATE TABLE players (
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
join_date DATE NOT NULL
);

//Insert players to Players Table :

INSERT INTO players (name , join_date) VALUES
('Mahmoud' , '2020-01-01'),
('Ahmad' ,'2021-02-02'),
(’Robert ,'2023-01-01),
(’William ,'2024-02-02),
(’Jim ,'2025-03-03),
(’Alex ,'2025-03-03),
(’Lars ,'2025-03-22),
(’Catarina ,'2025-04-01),
(’Emma,’2025-04-20);

//Create Games Table :

CREATE TABLE games (
id SERIAL PRIMARY KEY,
title VARCHAR(100) NOT NULL,
genre VARCHAR(100) NOT NULL
);

//Insert games to Games Table :

INSERT INTO games (title , genre) VALUES
('GTA' , 'ACTION'),
('FIFA' ,'SPORT'),
('SUPER MARIO' ,'ADVENTURE');

//Create Scores Table : 

CREATE TABLE scores (
id SERIAL PRIMARY KEY,
player_id INT ,
game_id INT ,
score INT ,
date_played DATE NOT NULL ,
FOREIGN KEY (player_id) REFERENCES players (id),
FOREIGN KEY (game_id) REFERENCES games (id)
);

//Insert scores to Scores Table : 

INSERT INTO scores (player_id , game_id , score , date_played) VALUES
(1,2,'100','2020-02-01') , (2,2,'150','2021-04-01'), (2,3,'70','2021-05-01') ,
(1,3,'20','2022-02-01') , (1,3,'500','2023-02-01')

INSERT INTO scores (player_id , game_id , score , date_played) VALUES
(4,2,'30','2024-02-01') , (4,2,'155','2024-04-01'), (6,3,'70','2025-05-01') ,
(1,3,'20','2022-02-01') , (6,3,'550','2025-04-01')

// Task 1 : List All Players and Their Scores :

SELECT players.name, scores.score
FROM players
LEFT JOIN scores ON players.id = scores.player_id

//Task 2 : The top 3 players with the highest total scores :

SELECT players.name ,SUM(scores.score) AS total_score
FROM players
JOIN scores ON players.id = scores.player_id
GROUP BY players.name
ORDER BY total_score DESC LIMIT 3

//Task 3 : Players who haven’t played any games:

SELECT players.name
FROM players
LEFT JOIN scores ON players.id = scores.player_id
WHERE scores.id IS NULL

//Task 4 : Popular Game Genres :

SELECT games.title , COUNT(scores.id) AS times_played
FROM games
JOIN scores ON games.id = scores.game_id
GROUP BY games.title
ORDER BY times_played DESC LIMIT 1;

//Task 5 : Recently Joined Players  : 

SELECT name 
FROM players
WHERE join_date >= NOW () - INTERVAL '30 days' 
