DELIMITER //

DROP PROCEDURE IF EXISTS insert_occupancy_status;

CREATE PROCEDURE insert_occupancy_status (
)
BEGIN
	DECLARE sql_error TINYINT DEFAULT FALSE;
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET sql_error = TRUE;
        
	START TRANSACTION;
    
    ALTER TABLE bed ADD COLUMN occupancy_status
    VARCHAR(255) AFTER location;
    
    UPDATE bed SET occupancy_status = 'Available' WHERE patient_id IS NULL;
	UPDATE bed SET occupancy_status = 'Occupied' WHERE patient_id IS NOT NULL;
    
    IF sql_error = FALSE THEN
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END//

CALL insert_occupancy_status;