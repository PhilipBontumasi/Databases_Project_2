DELIMITER // 

DROP PROCEDURE IF EXISTS insert_bed;

CREATE PROCEDURE insert_bed (
patient_id_param	INT,
location_param		VARCHAR(255)
)
BEGIN
	DECLARE sql_error TINYINT DEFAULT FALSE;
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET sql_error = TRUE;
        
	START TRANSACTION;
    
    INSERT INTO bed (patient_id, location) VALUES (patient_id_param, location_param);
END//

CALL insert_bed (NULL, 'Market Street Hospital');

SELECT * FROM bed;