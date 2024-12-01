-- DROP DATABASE IF EXISTS pet_database;
-- CREATE DATABASE pet_database;
-- USE pet_database;

DROP TABLE IF EXISTS petPet, petEvent;

-- Create the petPet table with appropriate columns and data types
CREATE TABLE petPet (
    petname VARCHAR(10) PRIMARY KEY,
    owner VARCHAR(10),
    species VARCHAR(20),
    gender VARCHAR(1),
    birth_date DATE,
    death_date DATE
);

-- Create the petEvent table with a foreign key referencing petPet
CREATE TABLE petEvent (
    petname VARCHAR(10),
    eventdate DATE,
    eventtype VARCHAR(20),
    remark VARCHAR(50),
    FOREIGN KEY (petname) REFERENCES petPet(petname),
    PRIMARY KEY (petname, eventdate)
);
