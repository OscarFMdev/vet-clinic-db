INSERT INTO animals(pet_name, data_of_birth, escape_attempts, neutered, weight_kg) VALUES('Agumon', TO_DATE('02/03/2020', 'MM/DD/YYYY'), 0, TRUE, 10.23);
INSERT INTO animals(pet_name, data_of_birth, escape_attempts, neutered, weight_kg) VALUES('Gabumon', TO_DATE('11/15/2018', 'MM/DD/YYYY'), 2, TRUE, 8.0);
INSERT INTO animals(pet_name, data_of_birth, escape_attempts, neutered, weight_kg) VALUES('Pikachu', TO_DATE('01/07/2021', 'MM/DD/YYYY'), 1, FALSE, 15.04);
INSERT INTO animals(pet_name, data_of_birth, escape_attempts, neutered, weight_kg) VALUES('Devimon', TO_DATE('05/12/2017', 'MM/DD/YYYY'), 5, TRUE, 11.0);


/*SECOND PART*/
INSERT INTO animals(pet_name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Charmander', TO_DATE('02/08/2020', 'MM/DD/YYYY'), 0, FALSE, -11.0);
INSERT INTO animals(pet_name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Plantmon', TO_DATE('11/15/2021', 'MM/DD/YYYY'), 2, TRUE, -5.7);
INSERT INTO animals(pet_name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Squirtle', TO_DATE('04/03/1993', 'MM/DD/YYYY'), 3, FALSE, -12.13);
INSERT INTO animals(pet_name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Angemon', TO_DATE('06/12/2005', 'MM/DD/YYYY'), 1, TRUE, -45);
INSERT INTO animals(pet_name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Boarmon', TO_DATE('06/07/2005', 'MM/DD/YYYY'), 7, TRUE, 20.4);
INSERT INTO animals(pet_name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Blossom', TO_DATE('10/13/1998', 'MM/DD/YYYY'), 3, TRUE, 17.0);
INSERT INTO animals(pet_name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Ditto', TO_DATE('05/14/2022', 'MM/DD/YYYY'), 4, TRUE, 22.0);


/* THIRD PART */
INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES('Jannifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES('Bob', 45);
INSERT INTO owners(full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES('Jodie Whittaker', 38);

INSERT INTO species(name) VALUES('pokemon');
INSERT INTO species(name) VALUES('digimon')


UPDATE animals SET species_id = 2 WHERE pet_name LIKE '%on';
UPDATE animals SET species_id = 1 WHERE pet_name NOT LIKE '%on';


UPDATE animals SET owners_id = 1 WHERE pet_name = 'Agumon';
UPDATE animals SET owners_id = 2 WHERE pet_name = 'Pikachu' OR pet_name = 'Gabumon';
UPDATE animals SET owners_id = 3 WHERE pet_name = 'Plantmon';
UPDATE animals SET owners_id = 4 WHERE pet_name = 'Charmander' OR pet_name = 'Squirtle' OR pet_name = 'Blossom';
UPDATE animals SET owners_id = 5 WHERE pet_name = 'Angemon' OR pet_name = 'Boarmon';


/* FOURTH PART */
INSERT INTO vets(name, age, date_of_graduation) VALUES('William Tatcher', 45, '2000-04-23');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations(vets_id, species_id) VALUES(1, 1);
INSERT INTO specializations(vets_id, species_id) VALUES(3, 1);
INSERT INTO specializations(vets_id, species_id) VALUES(3, 2);
INSERT INTO specializations(vets_id, species_id) VALUES(4, 2);

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Agumon'),
(SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24';

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Agumon'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22';

 INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Gabumon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02';

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05';

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08';

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14';

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Devimon'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04';

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Charmander'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24';

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21';

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'William Tatcher'), '2010-08-10';

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07';

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Squirtle'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29';

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Angemon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03';

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Angemon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04';

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24';

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15';

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27';

INSERT INTO visits(animal_id, vets_id, visit_date)
SELECT (SELECT id FROM animals WHERE pet_name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03';

