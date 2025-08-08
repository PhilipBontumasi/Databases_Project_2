CREATE OR REPLACE VIEW patient_name AS
SELECT patient_id, CONCAT(patient_first_name, ' ', patient_last_name) AS patient_name
FROM patient
ORDER BY patient_last_name;