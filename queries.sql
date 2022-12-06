/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE pet_name LIKE '%on%';
/* ALTER TABLE, CHANGE data_of_birth for date_of_birth */
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-01';
SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE pet_name = 'Agumon' OR pet_name = 'Pikachu';
SELECT pet_name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE PET_NAME = 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
