/* select all animals with names ending in mon */
SELECT * 
  FROM animals 
  WHERE 
    name LIKE '%mon';

/* select all animals born between the years 2016 and 2019 */
SELECT * 
  FROM animals 
  WHERE date_of_birth 
    BETWEEN 'Jan 1, 2016' AND 'Jan 1, 2019';

/* get all animals that are neutered and have escape attempts below 3 */
SELECT * 
  FROM animals 
  WHERE neutered=true 
    AND escape_attempts<3;

/* get the date_of_birth of animals with name Agumon or Pikachu */
SELECT date_of_birth 
  FROM animals 
  WHERE name='Agumon' OR name='Pikachu';

/* get name and escape attempts of animals that their weight is greater than 10.5 in kg */
SELECT name, escape_attempts 
  FROM animals 
  WHERE weight_kg > 10.5;

/* select all animals that are neutered */
SELECT * 
  FROM animals 
  WHERE neutered=true;

/* get all animals not name Gabumon */
SELECT * 
  FROM animals 
  WHERE name!='Gabumon';

/* get all animals with weight between 10.4 and 17.3 */
SELECT * 
  FROM animals 
  WHERE weight_kg 
    BETWEEN 10.4 AND 17.3;