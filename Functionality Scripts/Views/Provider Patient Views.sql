CREATE OR REPLACE VIEW timothy_lin_patients AS
SELECT pn.patient_id, pn.patient_name, p.gender, p.date_of_birth, p.address, p.insurance 
FROM patient p JOIN patient_provider pp ON p.patient_id = pp.patient_id JOIN patient_name pn ON pp.patient_id = pn.patient_id
WHERE pp.provider_id = 1;

CREATE OR REPLACE VIEW william_gill_patients AS
SELECT pn.patient_id, pn.patient_name, p.gender, p.date_of_birth, p.address, p.insurance 
FROM patient p JOIN patient_provider pp ON p.patient_id = pp.patient_id JOIN patient_name pn ON pp.patient_id = pn.patient_id
WHERE pp.provider_id = 2;

CREATE OR REPLACE VIEW jodi_branch_patients AS
SELECT pn.patient_id, pn.patient_name, p.gender, p.date_of_birth, p.address, p.insurance 
FROM patient p JOIN patient_provider pp ON p.patient_id = pp.patient_id JOIN patient_name pn ON pp.patient_id = pn.patient_id
WHERE pp.provider_id = 3;

CREATE OR REPLACE VIEW paul_goldman_patients AS
SELECT pn.patient_id, pn.patient_name, p.gender, p.date_of_birth, p.address, p.insurance 
FROM patient p JOIN patient_provider pp ON p.patient_id = pp.patient_id JOIN patient_name pn ON pp.patient_id = pn.patient_id
WHERE pp.provider_id = 4;

CREATE OR REPLACE VIEW brian_berger_patients AS
SELECT pn.patient_id, pn.patient_name, p.gender, p.date_of_birth, p.address, p.insurance 
FROM patient p JOIN patient_provider pp ON p.patient_id = pp.patient_id JOIN patient_name pn ON pp.patient_id = pn.patient_id
WHERE pp.provider_id = 5;

CREATE OR REPLACE VIEW george_newman_patients AS
SELECT pn.patient_id, pn.patient_name, p.gender, p.date_of_birth, p.address, p.insurance 
FROM patient p JOIN patient_provider pp ON p.patient_id = pp.patient_id JOIN patient_name pn ON pp.patient_id = pn.patient_id
WHERE pp.provider_id = 6;