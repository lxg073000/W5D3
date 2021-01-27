PRAGMA foreign_keys = ON;


DROP TABLE if exists users;
CREATE TABLE users(
  fname VARCHAR(20) NOT NULL,
  lname VARCHAR(20) NOT NULL,
  id INTEGER PRIMARY KEY
);

DROP TABLE if exists questions;
CREATE TABLE questions(
  title VARCHAR(20) NOT NULL,
  body VARCHAR(20) NOT NULL,
  author VARCHAR(20) NOT NULL,
  id INTEGER PRIMARY KEY,

  FOREIGN KEY (author) REFERENCES users(id)
);

DROP TABLE if exists question_follows;
CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES question(id)
);

DROP TABLE if exists replies;
CREATE TABLE replies(
  body VARCHAR(20) NOT NULL,
  question_id VARCHAR(20) NOT NULL,
  subject_question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  id INTEGER PRIMARY KEY,
  author_id INTEGER

  FOREIGN KEY (subject_question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE if exists question_likes;
CREATE TABLE question_likes(
  likes INTEGER,
  question_id INT NOT NULL,
  user_id INT NOT NULL,
  id INTEGER PRIMARY KEY,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (fname, lname)
VALUES
('tom', 'jerry');
('sdfas', 'ghgfhg');

