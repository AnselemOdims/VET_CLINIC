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