/* Create a table animals in the vet_clinic database */
CREATE TABLE animals(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL,
  PRIMARY KEY(id)
);

/* Add a column species of type string to the animals table */
ALTER TABLE animals 
  ADD species VARCHAR(255);

/* Create a table named owners */
CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(255),
  age INT,
  PRIMARY KEY(id)
);

/* Create a table named species */
CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  PRIMARY KEY(id)
);

/* remove the species column from the animals table */
ALTER TABLE animals
  DROP species;

/* add column species_id to the animals table 
   which is a foreign key referencing species table
*/
ALTER TABLE animals
  ADD species_id INT,
  ADD CONSTRAINT fk_species
  FOREIGN KEY (species_id)
  REFERENCES species (id);


/* add column owner_id to the animals table 
   which is a foreign key referencing owners table
*/
ALTER TABLE owners
  ADD owner_id INT,
  ADD CONSTRAINT fk_owner
  FOREIGN KEY (owner_id)
  REFERENCES owners (id);

-- Create a table named vets
CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY (id)
);

/*
  Create a "join table" called specializations to handle 
  the relationship between species and vets
*/
CREATE TABLE specializations(
  id INT GENERATED ALWAYS AS IDENTITY,
  species_id INT,
  vets_id INT,
  CONSTRAINT fk_special_species 
  FOREIGN KEY (species_id)
  REFERENCES species (id),
  CONSTRAINT fk_special_vets 
  FOREIGN KEY (vets_id)
  REFERENCES vets (id),
  PRIMARY KEY (id)
);

/*
  Create a "join table" called visits to handle 
  the relationship between animals and vets
*/
CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT,
  vets_id INT,
  date_of_visit DATE,
  CONSTRAINT fk_visit_animal 
  FOREIGN KEY (animal_id)
  REFERENCES animals (id),
  CONSTRAINT fk_visit_vets 
  FOREIGN KEY (vets_id)
  REFERENCES vets (id),
  PRIMARY KEY (id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

