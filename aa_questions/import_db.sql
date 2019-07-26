PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  body TEXT NOT NULL,

  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Mohary', 'Lyang'),
  ('Mohit', 'Dhamija'),
  ('Kevin', 'Ly'),
  ('Mary', 'Liang');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('What''s an exponent?', 'So uhhh, how do you read the thing is it like 10n^2?', 1),
  ('How long is app academy?', 'Hey there, was just wondering how many weeks the program is...', 2),
  ('Put a paretheses.', 'A what?', 1),
  ('What''s for lunch?', 'I just wanted to know if the Diversity meeeting today had free pizza?', 3),
  ('I can''t see the screen!!', 'Hi, I just wanted to know why there is a pillar in the middle of the lecture hall?? Thanks.', 4);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (1, 5),
  (2, 4),
  (3, 4),
  (4, 4),
  (3, 5),
  (4, 2);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1, 4),
  (2, 4),
  (3, 4),
  (4, 4),
  (2, 5),
  (3, 5),
  (4, 5);

INSERT INTO
  replies (user_id, question_id, parent_id, body)
VALUES
  (1, 2, NULL, 'I heard that it''s weeks long total!'),
  (4, 2, 1, 'They actually added an additional four weeks to the latest cohort!'),
  (2, 2, 2, 'Thanks Mary!'),
  (2, 4, NULL, 'I asked Dean, but he said he didn''t know'),
  (3, 4, 1, 'We should ask whoever sent out the email invite'),
  (4, 4, NULL, 'I don''t think there is gonna be pizza. I almost dropped out when I found out...'),
  (3, 5, NULL, 'Structural integrity, bro. I was a civil engineer before this.');

