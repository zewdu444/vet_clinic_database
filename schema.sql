/* Database schema to keep the structure of entire database. */

CREATE TABLE animals
(
    id integer primary key NOT NULL,
    name text ,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);
