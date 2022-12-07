SELECT * FROM animals WHERE pet_name LIKE '%on%';
/* ALTER TABLE, CHANGE data_of_birth for date_of_birth */
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-01';
SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE pet_name = 'Agumon' OR pet_name = 'Pikachu';
SELECT pet_name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE PET_NAME = 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


/* SECOND PART */

/* digimon and pokemon species */
UPDATE animals SET species = 'digimon' WHERE pet_name LIKE '%on';
UPDATE animals SET species = 'pokemon' WHERE pet_name NOT LIKE '%on';

/* deleting and restoring transaction */
BEGIN;
DELETE FROM animals;
ROLLBACK;
/*end of transaction */

/* inside a transaction */
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
/* end of transaction*/

/* QUESTIONS TO QUERIES*/
/* How many animals are there? */
SELECT COUNT(*) FROM animals;
/* How many animals have never tried to escape? */
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
/* What is the average weight of animals? */
SELECT AVG(weight_kg) FROM animals;
/* Who escapes the most, neutered or not neutered animals? */
SELECT SUM(escape_attempts) FROM animals GROUP BY neutered;
/* What is the minimum and maximum weight of each type of animal? */
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
/* What is the average number of escape attempts per animal type of those born between 1990 and 2000? */
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


/* THIRD SECTION */
/* All animals from Melody Pond*/
SELECT animals.pet_name, owners.full_name FROM animals JOIN owners ON animals.owners_id = owners.id AND owners.full_name = 'Melody Pond';
/*ALL pokemons*/
SELECT animals.pet_name, species.name FROM animals JOIN species ON  animals.species_id = species.id AND species.name = 'pokemon';

/* All owners and their animals*/
SELECT animals.pet_name, owners.full_name FROM animals RIGHT JOIN owners ON animals.owners_id = owners.id;

/* Count by species*/
SELECT species.name, COUNT(species.name)  FROM species JOIN animals ON animals.species_id = species.id GROUP BY species.name;

/* All digimons from Jennifer Orwell */
SELECT animals.pet_name, owners.full_name, species.name FROM animals JOIN owners ON animals.owners_id = owners.id AND owners.full_name = 'Jennifer Orwell' JOIN species ON animals.species_id = species.id AND species.name = 'digimon';

/* All animals from Dean which tried to escape */
SELECT animals.pet_name, owners.full_name FROM animals JOIN owners ON animals.owners_id = owners.id AND owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

/**/
SELECT COUNT(animals.pet_name), owners.full_name FROM animals JOIN owners ON animals.owners_id = owners.id GROUP BY owners.full_name ORDER BY count DESC LIMIT 1;
