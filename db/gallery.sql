DROP TABLE types;
DROP TABLE artists;
DROP TABLE exhibits;

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
)

CREATE TABLE exhibits
(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  date_created DATE,
  artist_id INT8 REFERENCES artists(id),
  type_id INT8 REFERENCES types(id)
  category_id INT8 REFERENCES categories(id)
);
