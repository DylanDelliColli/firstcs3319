

DROP DATABASE IF EXISTS ddellicoassign2db;
CREATE DATABASE ddellicoassign2db;
USE ddellicoassign2db;

GRANT USAGE ON *.* TO 'ta'@'localhost';
DROP USER 'ta'@'localhost';
CREATE USER 'ta' @'localhost' IDENTIFIED BY 'cs3319';
GRANT ALL PRIVILEGES ON ddellicoassign2db.* TO 'ta'@'localhost';
FLUSH PRIVILEGES;

SHOW tables;

CREATE TABLE Doctors (
	licenseNum varchar(4) NOT NULL,
	firstName varchar(20) NOT NULL,
	lastName varchar(20) NOT NULL,
	specialty varchar(30) NOT NULL,
	dateLicensed date NOT NULL,
	PRIMARY KEY (licenseNum)
);


CREATE TABLE Hospitals (
	hospitalCode varchar(3) NOT NULL,
	name varchar(20),
	city varchar(20),
	province varchar(2),
	numBeds int,
	headDoctor varchar(4),
	FOREIGN KEY (headDoctor) REFERENCES Doctors(licenseNum),
	PRIMARY KEY (hospitalCode)
);

DESCRIBE Doctors;
ALTER TABLE Doctors ADD worksFrom varchar(4), ADD CONSTRAINT FOREIGN KEY (worksFrom) REFERENCES Hospitals(hospitalCode) ON DELETE RESTRICT;
DESCRIBE Doctors;

CREATE TABLE Patients (
	OHIP int NOT NULL,
	firstName varchar(20),
	lastName varchar(20),
	PRIMARY KEY (OHIP)
);


CREATE TABLE Is_Assigned (
	OHIPnum int,
	docLicense varchar(4),
	FOREIGN KEY (OHIPnum) REFERENCES Patients(OHIP),
	FOREIGN KEY (docLicense) REFERENCES Doctors(licenseNum) ON DELETE CASCADE,
	PRIMARY KEY (OHIPnum, docLicense)
);

SHOW tables;
	


