ALTER TABLE actor
ADD full_name VARCHAR(40);

UPDATE actor
SET full_name = concat(first_name, ' ', last_name);

ALTER TABLE hdd
ADD full_name VARCHAR(40);

UPDATE hdd
SET full_name = concat(first_name, ' ', last_name);

ALTER TABLE actor
DROP last_name;

ALTER TABLE actor
DROP first_name;

ALTER TABLE hdd
DROP last_name;

ALTER TABLE hdd
DROP first_name