-- Query 1
INSERT INTO teacher(first_name,last_name,hire_date,salary)
VALUES ('Sebastian','Talamentes','2025-08-01',00000), 
	   ('John','Smith','2008-12-12',65000)
-- Query 2
CREATE TABLE animal_types(species_type_id bigserial Primary Key, species varchar(100), habitat varchar(25), diet varchar(100)); 
CREATE TABLE animals(animal_id bigserial Primary Key,animal_name varchar(10),species_id smallint,age smallint)
-- Query 3
INSERT INTO animal_types(species,habitat,diet)
VALUES ('Lion','Savannah','Meat'), ('Penguin', 'South Pole', 'Fish'), ('Giraffe', 'Savannah', 'Plants')
-- Query 4
INSERT INTO animals(animal_name,species_id,age)
VALUES ('Simba', 1, 28), ('Melman', 3, 21), ('Skipper', 2, 31)
-- Query 5
INSERT INTO animals(animal_name,species_id,age)
VALUES ('Simba' 2, 28)
