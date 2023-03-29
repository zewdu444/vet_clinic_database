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

---project three---
CREATE TABLE owners
(
    id SERIAL  primary key,
    full_name text ,
    age  integer
);
CREATE TABLE species
(
    id SERIAL primary key,
    name text
);

create sequence animal_id_seq;
alter table animals alter column id set default nextval('animal_id_seq');
ALTER TABLE animals drop column species;
ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);