/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');


INSERT INTO animals(pet_name, data_of_birth, escape_attempts, neutered, weight_kg) VALUES('Agumon', TO_DATE('02/03/2020', 'MM/DD/YYYY'), 0, TRUE, 10.23);
INSERT INTO animals(pet_name, data_of_birth, escape_attempts, neutered, weight_kg) VALUES('Gabumon', TO_DATE('11/15/2018', 'MM/DD/YYYY'), 2, TRUE, 8.0);
INSERT INTO animals(pet_name, data_of_birth, escape_attempts, neutered, weight_kg) VALUES('Pikachu', TO_DATE('01/07/2021', 'MM/DD/YYYY'), 1, FALSE, 15.04);
INSERT INTO animals(pet_name, data_of_birth, escape_attempts, neutered, weight_kg) VALUES('Devimon', TO_DATE('05/12/2017', 'MM/DD/YYYY'), 5, TRUE, 11.0);
