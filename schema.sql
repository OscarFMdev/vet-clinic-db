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


/* THIRD SECTION */

/* Create owners table */
CREATE TABLE owners(
id INT GENERATED ALWAYS AS IDENTITY,
full_name VARCHAR(255),
age INT,
PRIMARY KEY (id)
);
/* -------------- */

/* Create species table */
CREATE TABLE species(
id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
name VARCHAR(255)
);
/* -------------- */

/* modify animals table */
ALTER TABLE animals ADD PRIMARY KEY (id);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT CONSTRAINT animals_species_fk_species_id REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owners_id INT CONSTRAINT animals_owners_fk_owners_id REFERENCES owners(id);
/* -------------- */

