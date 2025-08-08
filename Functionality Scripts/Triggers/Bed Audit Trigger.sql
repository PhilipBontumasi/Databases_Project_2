DROP TABLE IF EXISTS bed_audit;

CREATE TABLE bed_audit
(
	bed_number			INT				NOT NULL,
	patient_id			INT,
    location			VARCHAR(255)	NOT NULL,
    action_type			VARCHAR(50)		NOT NULL,
    action_by			VARCHAR(128)	NOT NULL,
    action_on			DATETIME		NOT NULL
);

DELIMITER //

DROP TRIGGER IF EXISTS bed_after_insert;

CREATE TRIGGER bed_after_insert
	AFTER INSERT ON bed
    FOR EACH ROW
BEGIN
	INSERT INTO bed_audit VALUES
    (NEW.bed_number, NEW.patient_id, NEW.location, 'INSERTED', CURRENT_USER(), NOW());
END//

DROP TRIGGER IF EXISTS bed_after_update;

CREATE TRIGGER bed_after_update
	AFTER UPDATE ON bed
    FOR EACH ROW
BEGIN
	INSERT INTO bed_audit VALUES
    (NEW.bed_number, NEW.patient_id, NEW.location, 'UPDATED', CURRENT_USER(), NOW());
END//

DROP TRIGGER IF EXISTS bed_after_delete;

CREATE TRIGGER bed_after_delete
	AFTER DELETE ON bed
    FOR EACH ROW
BEGIN
	INSERT INTO bed_audit VALUES
    (OLD.bed_number, OLD.patient_id, OLD.location, 'DELETED', CURRENT_USER(), NOW());
END//

-- Testing values

UPDATE bed SET location = '8th Street Hospital' WHERE bed_number = 10;

DELETE FROM bed WHERE bed_number = 14;

SELECT * FROM bed_audit;