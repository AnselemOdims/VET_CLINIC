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

/* count number of animals */
SELECT COUNT(*)
  FROM animals;

/* count number of animals that have not attempted escape */
SELECT COUNT(*)
  FROM animals
  WHERE escape_attempts = 0;

/* avarage weight of animals */
SELECT AVG(weight_kg)
  FROM animals;

/* sum escape attempts and compare
   between neutered and non-neutered
*/
SELECT neutered, SUM(escape_attempts)
  FROM animals
  GROUP BY neutered;

/* minimum and maximum weights of each type of animal*/
SELECT neutered, MIN(weight_kg), MAX(weight_kg)
  FROM animals
  GROUP BY neutered;

/* average number of escape attempts per animal 
   type of those born between 1990 and 2000
*/
SELECT neutered, AVG(escape_attempts)
  FROM animals
  WHERE date_of_birth 
    BETWEEN 'Jan 1, 1990' AND 'Dec 31, 2000'
  GROUP BY neutered;

/* write queries using join to answer the following questions */

-- What animals belong to Melody Pond?
SELECT a.name, o.full_name
  FROM animals a
  INNER JOIN owners o
    ON a.owner_id = o.id
  WHERE o.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon)
SELECT a.name, s.name AS type
  FROM animals a
  INNER JOIN species s
    ON a.species_id = s.id
  WHERE s.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT o.full_name, a.name
  FROM owners o
  FULL OUTER JOIN animals a
    ON o.id = a.owner_id;

-- How many animals are there per species?
SELECT s.name, COUNT(*)
  FROM species s
  LEFT JOIN animals a
    ON s.id =  a.species_id
  GROUP BY s.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT a.name, o.full_name, s.name
  FROM animals a
  INNER JOIN owners o
    ON a.owner_id = o.id
  INNER JOIN species s
    ON a.species_id = s.id
  WHERE 
  o.full_name = 'Jennifer Orwell' 
  AND s.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT a.name, o.full_name, a.escape_attempts
  FROM animals a
  INNER JOIN owners o
    ON a.owner_id = o.id
  WHERE o.full_name = 'Dean Winchester' 
  AND a.escape_attempts = 0;

-- Who owns the most animals?
SELECT o.full_name, COUNT(*)
  FROM owners o
  LEFT JOIN animals a
    ON o.id =  a.owner_id
  GROUP BY o.full_name
  ORDER BY COUNT DESC
  LIMIT 1;

-- Who was the last animal seen by William Tatcher?
SELECT v.name AS vet_name, a.name AS animal_name, vs.date_of_visit
  FROM visits vs
  INNER JOIN animals a
    ON a.id = vs.animal_id
  INNER JOIN vets v
    ON v.id = vs.vets_id
  WHERE v.name = 'William Tatcher'
  ORDER BY vs.date_of_visit DESC
  LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT v.name as vet_name, COUNT(date_of_visit) 
  FROM visits vs
  LEFT JOIN vets v
    ON vs.vets_id = v.id
  WHERE name = 'Stephanie Mendez'
  GROUP BY v.name;

-- List all vets and their specialties, including vets with no specialties.
SELECT 
  sp.id AS specialty_id, 
  sp.species_id, 
  sp.vets_id, 
  v.name AS vet_name, 
  s.name AS species_name  
  FROM specializations sp
  FULL OUTER JOIN species s 
    ON s.id = sp.species_id
  FULL OUTER JOIN vets v 
    ON v.id = sp.vets_id
;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT 
  a.name, 
  v.name AS vet_name, 
  vs.date_of_visit
  FROM visits vs
  LEFT JOIN animals a 
    ON a.id = vs.animal_id
  LEFT JOIN vets v 
    ON v.id = vs.vets_id
  WHERE 
    v.name = 'Stephanie Mendez' AND 
    vs.date_of_visit 
    BETWEEN 'Apr 1, 2020' AND 'Aug 30, 2020';

-- What animal has the most visits to vets?
SELECT a.name, COUNT(*) 
  FROM visits vs
  INNER JOIN animals a
    ON a.id = vs.animal_id
  GROUP BY a.name
  ORDER BY COUNT DESC
  LIMIT 1
  ;

-- Who was Maisy Smith's first visit?
SELECT 
  a.name AS animal_name, 
  v.name AS vet_name,
  vs.date_of_visit
  FROM visits vs
  LEFT JOIN animals a
    ON a.id = vs.animal_id
  LEFT JOIN vets v
    ON v.id = vs.vets_id
  WHERE v.name = 'Maisy Smith'
  ORDER BY vs.date_of_visit ASC
  LIMIT 1
  ;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT 
  a.id AS animal_id,
  a.name AS animal_name,
  a.date_of_birth,
  v.id AS vet_id,
  v.name AS vet_name, 
  v.age AS vet_age,
  date_of_visit
  FROM visits vs
  INNER JOIN animals a
  ON a.id = vs.animal_id
  INNER JOIN vets v
  ON v.id = vs.vets_id
  ;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT 
  v.name AS vet_name,
  COUNT(*)
  FROM visits vs
  LEFT JOIN vets v 
    ON v.id = vs.vets_id
  LEFT JOIN specializations sp 
    ON sp.vets_id = vs.vets_id
  WHERE sp.id IS NULL
  GROUP BY v.name;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most
SELECT 
  v.name AS vet_name,
  s.name AS species_name,
  COUNT(s.name)
  FROM visits vs
  LEFT JOIN animals a 
    ON a.id = vs.animal_id
  LEFT JOIN vets v 
    ON v.id = vs.vets_id
  LEFT JOIN species s
    ON s.id = a.species_id
  WHERE v.name = 'Maisy Smith'
  GROUP BY v.name, s.name
  ORDER BY COUNT DESC
  LIMIT 1
;

-- queries for performance optimization
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';