/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id int,
    name varchar(255) NOT NULL,
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal,
    PRIMARY KEY(id)
);
