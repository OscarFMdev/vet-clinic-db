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
SELECT a.pet_name, o.full_name FROM animals a JOIN owners o ON a.owners_id = o.id AND o.full_name = 'Melody Pond';
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

/* FOURTH SECTION */

/* Who was the last animal seen by William Tatcher? */
SELECT vi.vets_id, v.name,a.pet_name, vi.visit_date FROM visits vi  JOIN vets v ON vi.vets_id = v.id AND v.name = 'William Tatcher' LEFT JOIN animals a ON vi.animal_id = a.id ORDER BY vi.visit_date DESC LIMIT 1;

/* How many different animals did Stephanie Mendez see? */
SELECT v.name, COUNT(v.name) FROM visits vi LEFT JOIN vets v ON vi.vets_id = v.id AND v.name = 'Stephanie Mendez' GROUP BY v.name LIMIT 1;

/* List all vets and their specialties, including vets with no specialties. */
SELECT vet.name, s.name  FROM specializations sp LEFT JOIN vets vet ON vet.id = sp.vets_id
LEFT JOIN species s ON s.id = sp.species_id;

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */
SELECT a.pet_name, vet.name, v.visit_date FROM visits v
LEFT JOIN animals a ON a.id = v.animal_id
JOIN vets vet ON vet.id = v.vets_id AND vet.name = 'Stephanie Mendez'
WHERE v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

/* What animal has the most visits to vets? */
SELECT a.pet_name, COUNT(v.animal_id) FROM animals a
LEFT JOIN visits v ON v.animal_id = a.id
GROUP BY a.pet_name ORDER BY count DESC LIMIT 1;


/* Who was Maisy Smith's first visit? */
SELECT a.pet_name, vet.name, vi.visit_date FROM vets vet
LEFT JOIN visits vi ON vet.id = vi.vets_id
LEFT JOIN animals a ON vi.animal_id = a.id
WHERE vet.name = 'Maisy Smith' ORDER BY vi.visit_date LIMIT 1;

/* Details for most recent visit: animal information, vet information, and date of visit. */
SELECT *  FROM visits v
LEFT JOIN animals a ON a.id = v.animal_id
LEFT JOIN vets vet ON vet.id = v.vets_id
ORDER BY v.visit_date DESC LIMIT 1;

/* How many visits were with a vet that did not specialize in that animal's species?  */
SELECT species.name, species.id,  sp.species_id, vet.name  FROM visits vi RIGHT  JOIN vets vet ON vi.vets_id = vet.id
LEFT JOIN specializations sp ON sp.vets_id = vet.id
LEFT JOIN animals a ON vi.animal_id = a.id
LEFT JOIN species ON species.id = a.species_id
WHERE species.id != sp.species_id OR sp.species_id = NULL;

/* What specialty should Maisy Smith consider getting? Look for the species she gets the most. */
SELECT species.name, COUNT(species.name) AS visits FROM visits vi RIGHT  JOIN vets vet ON vi.vets_id = vet.id
LEFT JOIN specializations sp ON sp.vets_id = vet.id
LEFT JOIN animals a ON vi.animal_id = a.id
LEFT JOIN species ON species.id = a.species_id
WHERE vet.name = 'Maisy Smith' GROUP BY species.name ORDER BY visits DESC;
