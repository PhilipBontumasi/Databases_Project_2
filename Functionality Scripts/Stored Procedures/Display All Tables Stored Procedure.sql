DELIMITER //

DROP PROCEDURE IF EXISTS display_all_tables;

CREATE PROCEDURE display_all_tables
(
)

BEGIN
	DECLARE sql_error TINYINT DEFAULT FALSE;
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET sql_error = TRUE;
        
	START TRANSACTION;
    
	SELECT * FROM bed;
    SELECT * FROM billing;
    SELECT * FROM clinical_care;
    SELECT * FROM other_personnel;
    SELECT * FROM patient;
    SELECT * FROM patient_provider;
    SELECT * FROM provider;
    SELECT * FROM supplies;
    SELECT * FROM visit;
    
    IF sql_error = FALSE THEN
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;    
END//

CALL display_all_tables;