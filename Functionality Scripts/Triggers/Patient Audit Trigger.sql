DROP TABLE IF EXISTS patient_audit;

CREATE TABLE patient_audit
(
	patient_id			INT				NOT NULL,
    patient_last_name	VARCHAR(255)	NOT NULL,
    patient_first_name	VARCHAR(255)	NOT NULL,
    gender				VARCHAR(6)		NOT NULL,
    date_of_birth		DATE			NOT NULL,
    address				VARCHAR(255)	NOT NULL,
    insurance			VARCHAR(255)	NOT NULL,
    action_type			VARCHAR(50)		NOT NULL,
    action_by			VARCHAR(128)	NOT NULL,
    action_on			DATETIME		NOT NULL
);

DELIMITER //

DROP TRIGGER IF EXISTS patient_after_insert;

CREATE TRIGGER patient_after_insert
	AFTER INSERT ON patient
    FOR EACH ROW
BEGIN
	INSERT INTO patient_audit VALUES
    (NEW.patient_id, NEW.patient_last_name, NEW.patient_first_name, NEW.gender, NEW.date_of_birth, NEW.address, NEW.insurance, 'INSERTED',
    CURRENT_USER(), NOW());
END//

DROP TRIGGER IF EXISTS patient_after_update;

CREATE TRIGGER patient_after_update
	AFTER UPDATE ON patient
    FOR EACH ROW
BEGIN
	INSERT INTO patient_audit VALUES
    (NEW.patient_id, NEW.patient_last_name, NEW.patient_first_name, NEW.gender, NEW.date_of_birth, NEW.address, NEW.insurance, 'UPDATED',
    CURRENT_USER(), NOW());
END//

DROP TRIGGER IF EXISTS patient_after_delete;

CREATE TRIGGER patient_after_delete
	AFTER DELETE ON patient
    FOR EACH ROW
BEGIN
	INSERT INTO patient_audit VALUES
    (OLD.patient_id, OLD.patient_last_name, OLD.patient_first_name, OLD.gender, OLD.date_of_birth, OLD.address, OLD.insurance, 'DELETED',
    CURRENT_USER(), NOW());
END//

-- Testing values
INSERT INTO patient (patient_last_name, patient_first_name, gender, date_of_birth, address, insurance)
VALUES ('Smith', 'John', 'Male', '2000-01-01', '123 Street', 'Aetna');

UPDATE patient SET address = '145 Newland Street' WHERE patient_id = 15;

DELETE FROM patient WHERE patient_id = 21;

SELECT * FROM patient_audit;