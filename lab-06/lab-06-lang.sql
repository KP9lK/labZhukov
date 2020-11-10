DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS mapping;
DROP TABLE IF EXISTS language;
CREATE TABLE employee (name TEXT UNIQUE);
CREATE TABLE language (langname TEXT UNIQUE);
CREATE TABLE mapping (

idlang int,
id int,
FOREIGN KEY (idlang)
	REFERENCES language (rowid),
FOREIGN KEY (id)
	REFERENCES employee (rowid)
);
INSERT INTO employee(name) VALUES ("Piter");
INSERT INTO employee(name) VALUES ("Oleg");
INSERT INTO employee(name) VALUES ("Andrei");
INSERT INTO employee(name) VALUES ("Egor is not Error");
INSERT INTO language(langname) VALUES ("Java");
INSERT INTO language(langname) VALUES ("C++");
INSERT INTO language(langname) VALUES ("Solidity");
INSERT INTO language(langname) VALUES ("Python");
INSERT INTO mapping VALUES(1,1);
INSERT INTO mapping VALUES(2,1);
INSERT INTO mapping VALUES(3,1);
INSERT INTO mapping VALUES(4,1);
INSERT INTO mapping VALUES(1,2);
INSERT INTO mapping VALUES(1,3);
INSERT INTO mapping VALUES(2,2);
INSERT INTO mapping VALUES(3,4);
INSERT INTO mapping VALUES(2,4);
INSERT INTO mapping VALUES(4,3);
