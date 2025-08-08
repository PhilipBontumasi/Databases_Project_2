DELIMITER |

DROP TRIGGER IF EXISTS occupancyStatusTrigger;

CREATE TRIGGER occupancyStatusTrigger BEFORE INSERT ON bed
FOR EACH ROW
BEGIN
	IF NEW.patient_id IS NULL THEN
		SET NEW.occupancy_status = 'Available';
	ELSE
		SET NEW.occupancy_status = 'Occupied';
	END IF;
END; |
DELIMITER ;

INSERT INTO bed (patient_id, location) VALUES (NULL, 'Main Street Hospital');

SELECT * FROM bed;