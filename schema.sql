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

/* FOURTH PART */
CREATE TABLE vets(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(255),
age INT,
date_of_graduation DATE,
PRIMARY KEY(id)
);

CREATE TABLE specializations(
species_id INT REFERENCES species(id),
vets_id INT REFERENCES vets(id)
);

CREATE TABLE visits(
animal_id INT REFERENCES animals(id),
vets_id INT REFERENCES vets(id),
visit_date DATE
);

--Optimize queries
CREATE INDEX animal_id_desc ON visits(animal_id DESC);
CREATE INDEX vets_id_desc ON visits(vetsl_id DESC);
CREATE INDEX emails_desc ON owners(email DESC);
