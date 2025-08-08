DELIMITER //

DROP PROCEDURE IF EXISTS update_patient;

CREATE PROCEDURE update_patient
(
patient_id_param			INT,
patient_last_name_param	 	VARCHAR(255),
patient_first_name_param	VARCHAR(255),
gender_param				VARCHAR(6),
date_of_birth_param			DATE,
address_param				VARCHAR(255),
insurance_param				VARCHAR(255)
)
BEGIN
	DECLARE sql_error TINYINT DEFAULT FALSE;
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;
    
    START TRANSACTION;
    
    UPDATE patient
    SET patient_last_name = patient_last_name_param,
    patient_first_name = patient_first_name_param,
    gender = gender_param,
    date_of_birth = date_of_birth_param,
    address = address_param,
    insurance = insurance_param
    WHERE patient_id = patient_id_param;
    
    IF sql_error = FALSE THEN
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END//

CALL update_patient (20, 'Tester', 'Test', 'Female', '1995-01-02', '123 Test Street', 'Aetna');

SELECT * FROM patient;