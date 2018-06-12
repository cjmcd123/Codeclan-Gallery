DROP TABLE relations;
DROP TABLE exhibits;
DROP TABLE categories;
DROP TABLE artists;
DROP TABLE types;

CREATE TABLE types
(
  id SERIAL8 PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE artists
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  dob DATE,
  url VARCHAR(255)
);

CREATE TABLE categories
(
  id SERIAL8 PRIMARY KEY,
  category VARCHAR(255)
);

CREATE TABLE exhibits
(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  year VARCHAR(255),
  artist_id INT8 REFERENCES artists(id) ON DELETE CASCADE,
  type_id INT8 REFERENCES types(id) ON DELETE CASCADE,
  url VARCHAR(255)
);

CREATE TABLE relations
(
  id SERIAL8 PRIMARY KEY,
  exhibit_id INT8 REFERENCES exhibits(id) ON DELETE CASCADE,
  category_id INT8 REFERENCES categories(id) ON DELETE CASCADE
)
