DROP TABLE types;
DROP TABLE artists;
DROP TABLE categories;
DROP TABLE exhibits;
DROP TABLE relations;

CREATE TABLE types
(
  id SERIAL8 PRIMARY KEY,
  style VARCHAR(255)
);

CREATE TABLE artists
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  dob DATE
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
  type_id INT8 REFERENCES types(id) ON DELETE CASCADE
);

CREATE TABLE relations
(
  id SERIAL8 PRIMARY KEY,
  exhibit_id INT8 REFERENCES exhibit(id) ON DELETE CASCADE,
  category_id INT8 REFERENCES categories(id) ON DELETE CASCADE
)
