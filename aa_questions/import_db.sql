PRAGMA foreign_keys = ON;

DROP TABLE if exists question_likes;
DROP TABLE if exists replies;
DROP TABLE if exists question_follows;
DROP TABLE if exists questions;
DROP TABLE if exists users;

CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname VARCHAR(20) NOT NULL,
  lname VARCHAR(20) NOT NULL
  
);


CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title VARCHAR(20) NOT NULL,
  body VARCHAR(20) NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);


CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  user_id INTEGER NOT NULL,
  

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  body VARCHAR(20) NOT NULL,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  author_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
  FOREIGN KEY (author_id) REFERENCES users(id)
);


CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  likes INTEGER,
  question_id INT,
  user_id INT NOT NULL,


  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO 
  users (fname, lname)
VALUES
  ('tom', 'jerry'),
  ('johnny', 'appleseed');

INSERT INTO questions 
  (title, body, author_id)
VALUES
  ('Q1', 'figuring out SQL', (SELECT id FROM users WHERE fname = 'tom' AND lname = 'jerry')),
  ('Q2', 'lost my pants in a/A', (SELECT id FROM users WHERE fname = 'johnny' AND lname = 'appleseed'));

INSERT INTO question_follows 
  (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'Q1' ), (SELECT id FROM users WHERE id = 2 ) ),
  ((SELECT id FROM questions WHERE title = 'Q2' ), (SELECT id FROM users WHERE id = 1 ) );

INSERT INTO replies
  (body, question_id, parent_reply_id, author_id)
VALUES
  ('wtf ru saying',(SELECT id FROM questions WHERE title = 'Q1' ), NULL, (SELECT id FROM users WHERE id = 2 ));

INSERT INTO replies
  (body, question_id, parent_reply_id, author_id)
VALUES  
  ('wdym, wtf ru saying, was that not english?',(SELECT id FROM questions WHERE title = 'Q1'), (SELECT id FROM replies WHERE id = 1), (SELECT id FROM users WHERE id = 1 ));

INSERT INTO question_likes
  (likes, question_id, user_id)
VALUES
  (1, (SELECT id FROM questions WHERE title = 'Q1' ), (SELECT id FROM users WHERE id = 2)),
  (1, (SELECT id FROM questions WHERE title = 'Q2' ), (SELECT id FROM users WHERE id = 1));


