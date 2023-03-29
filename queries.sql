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


---project three ----
select  * from animals 
inner join owners on animals.owner_id=owners.id
inner join species on animals.species_id=species.id
where owners.full_name ='Melody Pond';

select  *  from animals 
inner join owners on animals.owner_id=owners.id
inner join species on animals.species_id=species.id
where species.name ='Pokemon';


select  * from animals 
RIGHT join owners on animals.owner_id=owners.id;

select species.name as species_name, count(animals.name) as number_of_animals from animals 
inner join species on animals.species_id=species.id
group by species.name;

select  *  from animals 
inner join owners on animals.owner_id=owners.id
inner join species on animals.species_id=species.id
where owners.full_name ='Jennifer Orwell' and species.name='Digimon';

select  * from animals 
inner join owners on animals.owner_id=owners.id
where owners.full_name ='Dean Winchester'and animals.escape_attempts=0;

select owners.full_name as owners_full_name, count(animals.name) as number_of_animals from animals 
full join owners on animals.owner_id=owners.id
group by owners.full_name
order by number_of_animals desc;

---project four---

select  *  from animals 
inner join visits on visits.animals_id=animals.id
inner join vets on vets.id=visits.vets_id
where  vets.name ='William Tatcher'
order by date_of_visit desc
limit 1


select DISTINCT   *  from animals 
inner join visits on visits.animals_id=animals.id
inner join vets on vets.id=visits.vets_id
where  vets.name ='Stephanie Mendez';


select  *  from vets 
left join specializations on specializations.vets_id=vets.id
left join species on species.id =specializations.species_id;

select  *  from animals 
inner join visits on visits.animals_id=animals.id
inner join vets on vets.id=visits.vets_id
where  vets.name ='Stephanie Mendez' and date_of_visit between '2020-04-01' and '2020-04-30'


select  animals.name as animal_name, count( animals.name) as number_of_visited from animals 
inner join visits on visits.animals_id=animals.id
inner join vets on vets.id=visits.vets_id
group by animals.name 
order by  number_of_visited desc

select  *  from animals 
inner join visits on visits.animals_id=animals.id
inner join vets on vets.id=visits.vets_id
where  vets.name ='Maisy Smith'
order by date_of_visit asc
limit 1

select  *  from animals 
inner join visits on visits.animals_id=animals.id
inner join vets on vets.id=visits.vets_id
order by date_of_visit desc
limit 1



select  count(visits.id) as number_of_vists  from animals
inner join visits on visits.animals_id =animals.id
inner join vets on vets.id=visits.vets_id
left join specializations on specializations.vets_id=vets.id
where specializations.species_id is  null;


select species.name, count(species.name)  as number_vists_by_Maisy_Smith from animals
inner join visits on visits.animals_id =animals.id
inner join species on species.id =animals.species_id 
inner join vets on vets.id=visits.vets_id
left join specializations on specializations.vets_id=vets.id
where vets.name ='Maisy Smith'
group by species.name;
