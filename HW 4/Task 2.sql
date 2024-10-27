-- DROP DATABASE IF EXISTS pet_database;
-- CREATE DATABASE pet_database;
-- USE pet_database;

DROP TABLE IF EXISTS petPet, petEvent;

-- Create the petPet table
CREATE TABLE petPet (
    petname VARCHAR(10) PRIMARY KEY,
    owner VARCHAR(10),
    species VARCHAR(20),
    gender VARCHAR(1),
    birth_date DATE,
    death_date DATE
);

-- Create the petEvent table with foreign key constraint
CREATE TABLE petEvent (
    petname VARCHAR(10),
    eventdate DATE,
    eventtype VARCHAR(20),
    remark VARCHAR(50),
    FOREIGN KEY (petname) REFERENCES petPet(petname),
    PRIMARY KEY (petname, eventdate)
);

-- Insert initial values into petPet table
INSERT INTO petPet VALUES
    ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),
    ("Claws", "Gwen", "cat", "M", "1994-03-17", NULL),
    ("Buffy", "Harold", "dog", "F", "1989-05-13", NULL),
    ("Fang", "Benny", "dog", "M", "1990-08-27", NULL),
    ("Bowser", "Diane", "dog", "M", "1979-08-31", "1995-07-29"),
    ("Chirpy", "Gwen", "bird", "F", "1998-09-11", NULL),
    ("Whistler", "Gwen", "bird", NULL, "1997-12-09", NULL),
    ("Slim", "Benny", "snake", "M", "1996-04-29", NULL),
    ('Puffball','Diane','hamster','F','1999-03-30',NULL);

-- Insert initial values into petEvent table
INSERT INTO petEvent VALUES
    ("Fluffy", "1995-05-15", "litter", "4 kittens, 3 female, 1 male"),
    ("Buffy", "1993-06-23", "litter", "5 puppies, 2 female, 3 male"),
    ("Buffy", "1994-06-19", "litter", "3 puppies, 3 female"),
    ("Chirpy", "1999-03-21", "vet", "needed beak straightened"),
    ("Slim", "1997-08-03", "vet", "broken rib"),
    ("Slim", "1997-10-04", "vet", "broken tooth"),
    ("Bowser", "1991-10-12", "kennel", NULL),
    ("Fang", "1991-10-12", "kennel", NULL),
    ("Fang", "1998-08-28", "birthday", "Gave him a new chew toy"),
    ("Claws", "1998-03-17", "birthday", "Gave him a new flea collar"),
    ("Whistler", "1998-12-09", "birthday", "First birthday");

UPDATE petEvent 
SET eventdate = "2020-10-15", eventtype = "vet", remark = "antibiotics" 
WHERE petname = "Fluffy";

-- Insert Hammy into petPet table first
INSERT INTO petPet (petname, owner, species, gender, birth_date)
VALUES ("Hammy", "Diane", "Hamster", "M", "2010-10-30");

-- Then insert an event for Hammy in petEvent table
INSERT INTO petEvent (petname, eventdate, eventtype, remark) 
VALUES ("Hammy", "2020-10-15", "vet", "antibiotics");

-- Display all records in petEvent table
SELECT * FROM petEvent;
