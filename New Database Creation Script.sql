DROP DATABASE IF EXISTS ed_bed_management;
CREATE DATABASE ed_bed_management;
USE ed_bed_management;

-- create the tables for the database
CREATE TABLE patient (
  patient_id         INT            PRIMARY KEY   AUTO_INCREMENT,
  patient_last_name	 VARCHAR(255)   NOT NULL,
  patient_first_name VARCHAR(255)   NOT NULL,
  gender	         VARCHAR(6)     NOT NULL,
  date_of_birth      DATE		    NOT NULL,
  address			 VARCHAR(255)   NOT NULL,
  insurance			 VARCHAR(255)   NOT NULL
);

CREATE TABLE clinical_care (
  clinical_care_id	 INT			PRIMARY KEY   AUTO_INCREMENT,
  patient_id         INT            NOT NULL,
  symptom	         VARCHAR(255)   NOT NULL,
  diagnosis	         VARCHAR(255)   NOT NULL,
  prescription       VARCHAR(255),
  test_result        VARCHAR(255),
  CONSTRAINT clinical_care_fk_patient
    FOREIGN KEY (patient_id)
    REFERENCES patient (patient_id)
);

CREATE TABLE bed (
  bed_number         INT            PRIMARY KEY   AUTO_INCREMENT,
  patient_id         INT,
  location	         VARCHAR(255)   NOT NULL,
  CONSTRAINT bed_fk_patient
	FOREIGN KEY (patient_id)
    REFERENCES patient (patient_id)
);

CREATE TABLE provider (
  provider_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  provider_last_name VARCHAR(255)   NOT NULL,
  provider_first_name VARCHAR(255)  NOT NULL,
  specialty			 VARCHAR(255)	NOT NULL
  );

CREATE TABLE patient_provider (
	provider_id		 INT			NOT NULL,
    patient_id		 INT			NOT NULL,
    CONSTRAINT patient_provider_fk_patient
	  FOREIGN KEY (patient_id)
      REFERENCES patient (patient_id),
	CONSTRAINT patient_provider_fk_provider
	  FOREIGN KEY (provider_id)
      REFERENCES provider (provider_id)
);

CREATE TABLE supplies (
  supply_id          INT            PRIMARY KEY   AUTO_INCREMENT,
  provider_id        INT            NOT NULL,
  supply_name        VARCHAR(255)   NOT NULL,
  supply_cost        DECIMAL(10,2)  NOT NULL,
  CONSTRAINT supplies_fk_provider
    FOREIGN KEY (provider_id)
    REFERENCES provider (provider_id)
);

CREATE TABLE visit (
  visit_id			 INT			PRIMARY KEY   AUTO_INCREMENT,
  patient_id         INT            NOT NULL,
  visit_time         DATETIME		NOT NULL,
  facility	         VARCHAR(255)   NOT NULL,
  CONSTRAINT visit_fk_patient
    FOREIGN KEY (patient_id)
    REFERENCES patient (patient_id)
);

CREATE TABLE other_personnel (
	personnel_id	int				PRIMARY KEY	  AUTO_INCREMENT,
	personnel_name	VARCHAR(255)	NOT NULL,
    personnel_type	VARCHAR(255)	NOT NULL
    );

CREATE INDEX idx_visit
ON visit (visit_time DESC);

CREATE TABLE billing (
  billing_id		 INT			PRIMARY KEY   AUTO_INCREMENT,
  patient_id         INT            NOT NULL,
  visit_time         DATETIME	    NOT NULL,
  visit_cost	     DECIMAL(10,2)  NOT NULL,
  CONSTRAINT billing_fk_patient
	FOREIGN KEY (patient_id)
    REFERENCES patient (patient_id),
  CONSTRAINT billing_fk_visit
	FOREIGN KEY (visit_time)
    REFERENCES visit (visit_time)
);

-- Insert data into the tables
INSERT INTO patient (patient_id, patient_last_name, patient_first_name, gender, date_of_birth, address, insurance) VALUES
(1, 'Smith', 'Fred', 'Male', '1968-06-20', '120 Broadway Street', 'BlueCross BlueShield'),
(2, 'Baker', 'Janice', 'Female', '1948-04-15', '4819 Fifth Avenue', 'Aetna'),
(3, 'Miller', 'Zachary', 'Male', '1994-10-03', '934 Crest Boulevard', 'Humana'),
(4, 'Parker', 'Betty', 'Female', '1975-02-10', '9214 Orchard Avenue', 'BlueCross BlueShield'),
(5, 'Williams', 'Joshua', 'Male', '1988-01-09', '5858 Sugar Hill Lane', 'United Healthcare'),
(6, 'Johnson', 'Susan', 'Female', '1955-11-11', '4325 Garden Way', 'BlueCross BlueShield'),
(7, 'Douglas', 'Gregory', 'Male', '1952-10-01', '221 Lake Boulevard', 'BlueCross BlueShield'),
(8, 'Hammond', 'Matthew', 'Male', '1985-07-26', '3815 Washington Street', 'Cigna'),
(9, 'Smith', 'Emily', 'Female', '1999-08-14', '4639 Carpenter Avenue', 'Highmark'),
(10, 'Sanchez', 'Julio', 'Male', '1979-07-04', '8475 Turner Road', 'Aetna'),
(11, 'Greene', 'Steve', 'Male', '1972-12-07', '398 Expedition Parkway', 'Humana'),
(12, 'Holmes', 'Jackson', 'Male', '1995-03-14', '7730 Summit Road', 'BlueCross BlueShield'),
(13, 'Rodriguez', 'Lisa', 'Female', '1984-03-24', '6208 Old Creek Lane', 'Aetna'),
(14, 'Garcia', 'Roberto', 'Male', '1966-02-09', '9102 Vernon Street', 'BlueCross BlueShield'),
(15, 'Birch', 'William', 'Male', '1936-02-18', '1905 Highrise Boulevard', 'Cigna'),
(16, 'Upton', 'Marie', 'Female', '1991-11-29', '4452 Forest Drive', 'BlueCross BlueShield'),
(17, 'Hurley', 'Eric', 'Male', '1976-01-10', '256 Whitley Lane', 'Highmark'),
(18, 'Ross', 'Michael', 'Male', '1983-08-04', '3569 Brewton Drive', 'Cigna'),
(19, 'Jones', 'Daniel', 'Male', '1974-05-31', '5346 Worthington Alley', 'Cigna'),
(20, 'Heath', 'Anne', 'Female', '1972-09-30', '2866 School Road', 'BlueCross BlueShield');

INSERT INTO clinical_care (clinical_care_id, patient_id, symptom, diagnosis, prescription, test_result) VALUES
(1, 10, 'Coughing', 'Minor Cold', NULL, NULL),
(2, 10, 'Sneezing', 'Minor Cold', NULL, NULL),
(3, 2, 'Respiratory Troubles', 'COVID-19', 'Remdesivir', 'Patient experienced shortness of breath, and tests showed weakening of lung functions'),
(4, 19, 'Abdominal Pain', 'Acute Pancreatitis', NULL, 'Tests indicated inflammation of the pancreas');

INSERT INTO bed (bed_number, patient_id, location) VALUES
(1, 2, 'Common Market Hospital'),
(2, NULL, 'Common Market Hospital'),
(3, NULL, 'Orchard Community Hospital'),
(4, NULL, 'Common Market Hospital'),
(5, 19, 'Main Street Hospital'),
(6, NULL, 'Orchard Community Hospital'),
(7, NULL, 'Common Market Hospital'),
(8, 4, 'Main Street Hospital'),
(9, NULL, 'Main Street Hospital'),
(10, NULL, 'Common Market Hospital'),
(11, 15, 'Orchard Community Hospital'),
(12, NULL, 'Old Creek Childrens Hospital'),
(13, NULL, 'Main Street Hospital'),
(14, NULL, 'Orchard Community Hospital'),
(15, NULL, 'Old Creek Childrens Hospital'),
(16, NULL, 'Main Street Hospital'),
(17, 7, 'Common Market Hospital'),
(18, NULL, 'Orchard Community Hospital');

INSERT INTO other_personnel (personnel_id, personnel_name, personnel_type) VALUES
(1, 'Bernard Weinmann', 'Manager'),
(2, 'Katie Jones', 'Receptionist'),
(3, 'Jane Duncan', 'Receptionist');

INSERT INTO provider (provider_id, provider_last_name, provider_first_name, specialty) VALUES
(1, 'Lin', 'Timothy', 'Anesthesiology'),
(2, 'Gill', 'William', 'Emergency Medicine'),
(3, 'Branch', 'Jodi', 'Oncology'),
(4, 'Goldman', 'Paul', 'Anesthesiology'),
(5, 'Berger', 'Brian', 'Oncology'),
(6, 'Newman', 'George', 'Anesthesiology');

INSERT INTO patient_provider (provider_id, patient_id) VALUES
(1, 2),
(1, 4),
(1, 17),
(1, 20),
(2, 2),
(3, 1),
(3, 15),
(3, 18),
(4, 4),
(4, 7),
(4, 9),
(4, 12),
(5, 3),
(5, 5),
(5, 6),
(5, 8),
(5, 10),
(5, 11),
(6, 3),
(6, 8),
(6, 13),
(6, 14),
(6, 16),
(6, 19);

INSERT INTO supplies (supply_id, provider_id, supply_name, supply_cost) VALUES
(1, 1, 'Anesthetic Machine', 5275.00),
(2, 1, 'Gloves', 15.00),
(3, 2, 'Antibiotics', 150.00),
(4, 2, 'Gloves', 15.00),
(5, 3, 'Chemotherapy', 350.00),
(6, 3, 'Gloves', 15.00),
(7, 4, 'Anesthetic Machine', 5500.00),
(8, 4, 'Gloves', 15.00),
(9, 5, 'Chemotherapy', 450.00),
(10, 5, 'Gloves', 15.00),
(11, 6, 'Anesthetic Machine', 6000.00),
(12, 6, 'Gloves', 15.00);


INSERT INTO visit (visit_id, patient_id, visit_time, facility) VALUES
(1, 2, '2020-05-24 14:00:00', 'Common Market Hospital'),
(2, 19, '2020-08-08 08:30:00', 'Main Street Hospital');

INSERT INTO billing (billing_id, patient_id, visit_time, visit_cost) VALUES
(1, 2, '2020-05-24 14:00:00', '4460.00'),
(2, 19, '2020-08-08 08:30:00', '2245.00');