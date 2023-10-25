/*Queries that provide answers to the questions from all projects.*/

-- Find all animals whose name ends in "mon".
SELECT * from animals WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE neutured = true AND escape_attempts < 3; 

-- List the date of birth of all animals named either "Agumon" or "Pikachu"
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

-- List name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

--List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

-- Find all animals that are neutered.
SELECT * FROM animals WHERE neutered = true;    

-- Find all animals not named Gabumon.
SELECT * FROM animals WHERE name != 'Gabumon'; 

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3; 

-- Begin Transaction 
BEGIN; 
UPDATE animals SET species = 'unspecified' ; 
select name, species from animals; 
ROLLBACK;

-- Begin Transaction 
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT; 
SELECT * FROM animals; 

-- Begin Transaction 
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK; 
SELECT * FROM animals; 

-- Begin the transaction
BEGIN; 
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT my_savepoint; 
UPDATE animals SET weight_kg = weight_kg * -1; 
SELECT * FROM animals;
ROLLBACK TO my_savepoint; 
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0; 
SELECT * FROM animals;
COMMIT;  

SELECT COUNT(*) FROM animals ;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals; 
SELECT neutered, MAX(escape_attempts) AS max_escape_attempts FROM animals GROUP BY neutered; 
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species; 
SELECT species, AVG(escape_attempts) AS avg_escape_attempts FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species; 
