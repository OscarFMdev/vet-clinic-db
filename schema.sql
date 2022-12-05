/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INTEGER,
    pet_name varchar(100),
    data_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg FLOAT,
);
