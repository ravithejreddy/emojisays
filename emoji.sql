CREATE DATABASE emoji;

CREATE TABLE leaders
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(100),
  user_id INTEGER,
  total_count INTEGER
)


CREATE TABLE users
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR (100),
  email VARCHAR(100),
  password_digest VARCHAR(100)
)
CREATE TABLE votes
(
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER,
  leader_id INTEGER,
  emoji VARCHAR(100),
  emoji_value INTEGER
)
-- CREATE TABLE users
-- (
--   id SERIAL4 PRIMARY KEY,
--   name VARCHAR(100),
--   voted_on TEXT[]
-- )
--
-- CREATE TABLE votes
-- (
--   id SERIAL4 PRIMARY KEY,
--   image bytea,
--   value_of_image INTEGER
-- )
--
-- INSERT INTO votes (image,value_of_image) VALUES ('happy-emo.jpeg',1),
-- INSERT INTO votes (image,value_of_image) VALUES ('angry-emo.jpeg',-1)
--
--
--
INSERT INTO leaders (name) VALUES ('Hillary Clinton');
INSERT INTO leaders (name) VALUES ('Bernie Sanders');
INSERT INTO leaders (name) VALUES ('Martin OMalley');
INSERT INTO leaders (name) VALUES ('Ben Carson');
INSERT INTO leaders (name) VALUES ('Jed Bush');
INSERT INTO leaders (name) VALUES ('Chris Christie');
INSERT INTO leaders (name) VALUES ('Donald Trump');
