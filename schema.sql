CREATE DATABASE vet_clinic; 
    
CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    create_time DATE, 
    name VARCHAR(225),
    date_of_birth DATE, 
    escape_attempts INTEGER, 
    neutered BOOLEAN, 
    weight_kg DECIMAL(5,2), 
    PRIMARY KEY(id)
);

ALTER TABLE animals
ADD COLUMN species VARCHAR(255);

CREATE TABLE owners (
    id serial PRIMARY KEY, 
    full_name VARCHAR(225), 
    age INTEGER
);

CREATE TABLE species (
    id serial PRIMARY KEY, 
    name VARCHAR(225)
);

ALTER TABLE animals
ALTER COLUMN id SET DATA TYPE serial; 

ALTER TABLE animals
DROP COLUMN species; 

ALTER TABLE animals
ADD COLUMN species_id integer REFERENCES species(id); 

ALTER TABLE animals
ADD COLUMN owner_id integer REFERENCES owners(id); 

CREATE TABLE vets (
    id serial PRIMARY KEY,
    name VARCHAR(255),
    age integer,
    date_of_graduation date
);

CREATE TABLE specializations (
    id serial PRIMARY KEY,
    vet_id integer REFERENCES vets(id), 
    species_id integer REFERENCES species(id)
);

CREATE TABLE visits (
    id serial PRIMARY KEY,
    animal_id integer REFERENCES animals(id), 
    vet_id integer REFERENCES vets(id),
    visit_date date
);

