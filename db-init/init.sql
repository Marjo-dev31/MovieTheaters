CREATE DATABASE MovieTheaters;

use MovieTheaters;


CREATE TABLE cinemas (
    id VARCHAR(36) PRIMARY KEY NOT NULL DEFAULT (UUID()),
    name VARCHAR(255) NOT NULL
);

CREATE TABLE rooms (
    id VARCHAR(36) PRIMARY KEY NOT NULL DEFAULT (UUID()),
    name VARCHAR(255) NOT NULL,
    seats INT,
    cinema_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (cinema_id) REFERENCES cinemas(id) ON DELETE CASCADE
    );

CREATE TABLE schedules (
    id VARCHAR(36) PRIMARY KEY NOT NULL DEFAULT (UUID()),
    start_at TIME NOT NULL
);

CREATE TABLE movies (
    id VARCHAR(36) PRIMARY KEY NOT NULL DEFAULT (UUID()),
    name VARCHAR(255) NOT NULL
);

CREATE TABLE prices (
    id VARCHAR(36) PRIMARY KEY NOT NULL DEFAULT (UUID()),
    name VARCHAR(255) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE users (
    id VARCHAR(36) PRIMARY KEY NOT NULL DEFAULT (UUID()),
    firstname VARCHAR(255) NOT NULL,
    isAdmin BOOLEAN,
    password VARCHAR(255)
);

CREATE TABLE usercinemas (
    user_id VARCHAR(36),
    cinema_id VARCHAR(36),
    PRIMARY KEY (`user_id`, `cinema_id`),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (cinema_id) REFERENCES cinemas(id) ON DELETE CASCADE
);

CREATE TABLE sessions (
    id VARCHAR(36) PRIMARY KEY NOT NULL DEFAULT (UUID()),
    cinema_id VARCHAR(36) NOT NULL,
    room_id VARCHAR(36) NOT NULL,
    movie_id VARCHAR(36) NOT NULL,
    schedule_id VARCHAR(36) NOT NULL,
    user_id VARCHAR(36),
    FOREIGN KEY (cinema_id) REFERENCES cinemas(id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY (schedule_id) REFERENCES schedules(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

INSERT INTO cinemas VALUES 
(DEFAULT, 'Cinéma du centre'),
(DEFAULT, 'Cinéma de quartier');

INSERT INTO rooms VALUES 
(DEFAULT, 'Bleu', 180, (SELECT id FROM cinemas WHERE name ='Cinéma du centre')),
(DEFAULT, 'Rouge', 100, (SELECT id FROM cinemas WHERE name ='Cinéma du centre')),
(DEFAULT, 'Jaune', 120, (SELECT id FROM cinemas WHERE name ='Cinéma du centre')),
(DEFAULT, 'Vert', 180, (SELECT id FROM cinemas WHERE name ='Cinéma de quartier')),
(DEFAULT, 'Orange', 100, (SELECT id FROM cinemas WHERE name ='Cinéma de quartier'));

INSERT INTO schedules VALUES 
(DEFAULT, '09:00:00'),
(DEFAULT, '11:30:00'),
(DEFAULT, '14:00:00'),
(DEFAULT, '16:30:00'),
(DEFAULT, '18:00:00'),
(DEFAULT, '19:30:00'),
(DEFAULT, '21:00:00');

INSERT INTO movies VALUES 
(DEFAULT, "Un p'tit truc en plus"),
(DEFAULT, 'Furiosa'),
(DEFAULT, 'Bad Boys 3'),
(DEFAULT, 'La planète des singes'),
(DEFAULT, 'Marcelle Mio');

INSERT INTO prices VALUES 
(DEFAULT, 'Plein tarif', 9.20),
(DEFAULT, 'Etudiant', 7.60),
(DEFAULT, 'Moins de 14 ans', 5.90);

INSERT INTO users VALUES 
(DEFAULT, 'José', true, '$2a$12$.ZMaCf.BUdNlb1o3Qc2NHOsv2cwsiQBxyGEDP/CXcFpTbWQmc251q'),
(DEFAULT, 'Thomas', false, '$2a$12$PnI28zQgRRY8bYDky09xG.6Dp7ZXNtoxgS4kSkTbBTGqQKJ7IqPFu'),
(DEFAULT, 'Estelle', false, '$2a$12$2IeR.uFpo.WjKf5YnfftN.iVS.Je4TtTZEYcY.Fwy18/Ry0qNHKUa');

INSERT INTO sessions VALUES 
(DEFAULT, (SELECT id FROM cinemas WHERE name = 'Cinéma du centre'), (SELECT id FROM rooms WHERE name ='Bleu'), (SELECT id FROM movies WHERE name = 'Furiosa'), (SELECT id FROM schedules WHERE start_at = '09:00:00'), (SELECT id FROM users WHERE firstname = 'José')),
(DEFAULT, (SELECT id FROM cinemas WHERE name = 'Cinéma du centre'), (SELECT id FROM rooms WHERE name ='Rouge'), (SELECT id FROM movies WHERE name = 'Furiosa'), (SELECT id FROM schedules WHERE start_at = '09:00:00'), (SELECT id FROM users WHERE firstname = 'José')),
(DEFAULT, (SELECT id FROM cinemas WHERE name = 'Cinéma du centre'), (SELECT id FROM rooms WHERE name ='Bleu'), (SELECT id FROM movies WHERE name = "Un p'tit truc en plus"), (SELECT id FROM schedules WHERE start_at = '14:00:00'), (SELECT id FROM users WHERE firstname = 'Thomas')),
(DEFAULT, (SELECT id FROM cinemas WHERE name = 'Cinéma du centre'), (SELECT id FROM rooms WHERE name ='Jaune'), (SELECT id FROM movies WHERE name = 'Bad Boys 3'), (SELECT id FROM schedules WHERE start_at = '21:00:00'), (SELECT id FROM users WHERE firstname = 'Thomas')),
(DEFAULT, (SELECT id FROM cinemas WHERE name = 'Cinéma du centre'), (SELECT id FROM rooms WHERE name ='Jaune'), (SELECT id FROM movies WHERE name = 'Bad Boys 3'), (SELECT id FROM schedules WHERE start_at = '18:00:00'), (SELECT id FROM users WHERE firstname = 'Thomas')),
(DEFAULT, (SELECT id FROM cinemas WHERE name = 'Cinéma de quartier'), (SELECT id FROM rooms WHERE name ='Vert'), (SELECT id FROM movies WHERE name = 'Furiosa'), (SELECT id FROM schedules WHERE start_at = '09:00:00'), (SELECT id FROM users WHERE firstname = 'Estelle')),
(DEFAULT, (SELECT id FROM cinemas WHERE name = 'Cinéma de quartier'), (SELECT id FROM rooms WHERE name ='Vert'), (SELECT id FROM movies WHERE name = 'Marcelle Mio'), (SELECT id FROM schedules WHERE start_at = '14:00:00'), (SELECT id FROM users WHERE firstname = 'Estelle')),
(DEFAULT, (SELECT id FROM cinemas WHERE name = 'Cinéma de quartier'), (SELECT id FROM rooms WHERE name ='Orange'), (SELECT id FROM movies WHERE name = 'Marcelle Mio'), (SELECT id FROM schedules WHERE start_at = '14:00:00'), (SELECT id FROM users WHERE firstname = 'Estelle')),
(DEFAULT, (SELECT id FROM cinemas WHERE name = 'Cinéma de quartier'), (SELECT id FROM rooms WHERE name ='Orange'), (SELECT id FROM movies WHERE name = 'La planète des singes'), (SELECT id FROM schedules WHERE start_at = '09:00:00'), (SELECT id FROM users WHERE firstname = 'José')),
(DEFAULT, (SELECT id FROM cinemas WHERE name = 'Cinéma de quartier'), (SELECT id FROM rooms WHERE name ='Orange'), (SELECT id FROM movies WHERE name = "Un p'tit truc en plus"), (SELECT id FROM schedules WHERE start_at = '21:00:00'), (SELECT id FROM users WHERE firstname = 'José'));


SELECT sessions.id, rooms.name AS rooms, rooms.seats AS seats, movies.name AS movies, schedules.start_at AS schedules FROM sessions 
INNER JOIN rooms ON rooms.id=room_id
INNER JOIN movies ON movie_id = movies.id
INNER JOIN schedules ON schedules.id=schedule_id
WHERE sessions.cinema_id ='f069c1af-2282-11ef-b034-58a023d3f752'
ORDER BY movies;

SELECT * FROM prices;

