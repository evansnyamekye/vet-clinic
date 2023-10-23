CREATE DATABASE vet_clinic; 
    
CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    create_time DATE, 
    name VARCHAR(225),
    date_of_birth DATE, 
    escape_attamptes INTERGER, 
    neutured BOOLEAN, 
    weight_kg DECIMAL(5,2), 
    PRIMARY KEY(id)
);
