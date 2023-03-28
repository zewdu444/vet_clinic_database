/* Database schema to keep the structure of entire database. */
--project one---
CREATE TABLE animals
(
    id integer primary key NOT NULL,
    name text ,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

-- project two--
Alter table animals add column species text;
