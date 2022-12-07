CREATE TABLE animals (
    id INTEGER,
    pet_name varchar(100),
    data_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg FLOAT,
);

/* SECOND SECTION */
ALTER TABLE animals ADD species varchar;
