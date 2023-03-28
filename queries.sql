/*Queries that provide answers to the questions from all projects.*/
-- project 1--
select * from animals where  name Like '%mon';
select name from animals where date_of_birth  between  '2016-01-01' and '2019-01-01';
select name from animals where neutered=true and  escape_attempts <3
select date_of_birth from animals where name in('Agumon', 'Pikachu')
select name, escape_attempts from animals where weight_kg >10.5
select * from animals where neutered=true
select * from animals where name !='Gabumon';
select * from animals where weight_kg >= 10.4 and weight_kg <=17.3;

-- project 2--
--transactions queries-- 
BEGIN;
update animals  set species='unspecified';
ROLLBACK;
Begin;
 update animals set species='digimon' where name like '%mon';
 update animals set species= 'pokemon' where species is null; 
commit;
begin;
     delete from animals;
rollback;
begin;
  delete from animals where date_of_birth > '2022-01-01';
  savepoint animal_save_one;
  update animals set weight_kg =weight_kg * -1;
  Rollback to savepoint animal_save_one;
  update animals set weight_kg =weight_kg * -1 where weight_kg <0;
commit;
-- aggregation queries--
select  count(*) number_of_animals from animals;
select  count(*) never_escape_animals from animals where escape_attempts=0;
select avg(weight_kg) from animals;
select neutered as neutered_animal ,
sum(escape_attempts) as total_escape_attempt 
from animals group by neutered order by total_escape_attempt  desc ;
select species,MIN(weight_kg) as min_weight_kg, max(weight_kg) as max_weight_kg from animals  group by species;
select species, avg(escape_attempts) from animals 
where date_of_birth between '1990-01-01' and '2000-01-01' 
group by species;
