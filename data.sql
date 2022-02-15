/* Populate the animals table with initial data. */
INSERT INTO 
  animals 
    (name, date_of_birth, escape_attempts, neutered, weight_kg)
  VALUES
    ('Agumon', 'Feb 3, 2020',0, true, 10.23),
    ('Gabumon', 'Nov 15, 2018',2, true, 8.00),
    ('Pikachu', 'Jan 7, 2021',1, false, 15.04),
    ('Devimon', 'May 12, 2017',5, true, 11.00);


/* Populate the animals table with more data */
INSERT INTO
  animals
    (name, date_of_birth, escape_attempts, neutered, weight_kg)
  VALUES
    ('Charmander', 'Feb 8, 2020', 0, false, -11.00),
    ('Plantmon', 'Nov 15, 2022', 2, true, -5.70),
    ('Squirtle', 'Apr 2, 1993', 3, false, -12.13),
    ('Angemon', 'Jun 12, 2005', 1, true, -45.00),
    ('Boarmon', 'Jun 7, 2005', 7, true, 20.40),
    ('Blossom', 'Oct 13, 1998', 3, true, 17.00);