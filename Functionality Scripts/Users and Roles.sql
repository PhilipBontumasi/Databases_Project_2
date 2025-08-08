CREATE USER IF NOT EXISTS timothylin IDENTIFIED BY 'painkiller579';
CREATE USER IF NOT EXISTS williamgill IDENTIFIED BY 'redlight9146';
CREATE USER IF NOT EXISTS jodibranch IDENTIFIED BY 'cancercanceller100';
CREATE USER IF NOT EXISTS paulgoldman IDENTIFIED BY 'goldmanstandard1849';
CREATE USER IF NOT EXISTS brianberger IDENTIFIED BY 'chemopro200';
CREATE USER IF NOT EXISTS georgenewman IDENTIFIED BY 'serenitynow531';
CREATE USER IF NOT EXISTS bernweinmann IDENTIFIED BY 'topdoc485';
CREATE USER IF NOT EXISTS katiejones IDENTIFIED BY 'deskjockey55';
CREATE USER IF NOT EXISTS janeduncan IDENTIFIED BY 'makingpointstoappoint';
CREATE USER IF NOT EXISTS root@localhost IDENTIFIED BY 'bontumasipo346';

CREATE ROLE IF NOT EXISTS developer, manager, provider, receptionist;

GRANT ALL ON *.* TO developer WITH GRANT OPTION;

GRANT SELECT, INSERT, UPDATE, DELETE ON ed_bed_management.* TO manager WITH GRANT OPTION;

REVOKE ALL, GRANT OPTION FROM provider;

GRANT SELECT, INSERT, UPDATE, DELETE ON ed_bed_management.billing TO provider;
GRANT SELECT, INSERT, UPDATE, DELETE ON ed_bed_management.clinical_care TO provider;
GRANT SELECT, INSERT, UPDATE, DELETE ON ed_bed_management.supplies TO provider;
GRANT SELECT, INSERT, UPDATE, DELETE ON ed_bed_management.visit TO provider;
GRANT SELECT ON ed_bed_management.bed TO provider;

REVOKE ALL, GRANT OPTION FROM receptionist;

GRANT SELECT, INSERT, UPDATE, DELETE ON ed_bed_management.billing TO receptionist;
GRANT SELECT, INSERT, UPDATE, DELETE ON ed_bed_management.patient TO receptionist;
GRANT SELECT, INSERT, UPDATE, DELETE ON ed_bed_management.patient_provider TO receptionist;
GRANT SELECT, INSERT, UPDATE, DELETE ON ed_bed_management.visit TO receptionist;
GRANT SELECT ON ed_bed_management.bed TO receptionist;

GRANT developer TO root@localhost;
GRANT manager TO bernweinmann;
GRANT provider TO timothylin, williamgill, jodibranch, paulgoldman, brianberger, georgenewman;
GRANT receptionist TO katiejones, janeduncan;

GRANT SELECT, INSERT, UPDATE, DELETE ON ed_bed_management.timothy_lin_patients TO timothylin;
GRANT SELECT, INSERT, UPDATE, DELETE ON ed_bed_management.william_gill_patients TO williamgill;
GRANT SELECT, INSERT, UPDATE, DELETE ON ed_bed_management.jodi_branch_patients TO jodibranch;
GRANT SELECT, INSERT, UPDATE, DELETE ON ed_bed_management.paul_goldman_patients TO paulgoldman;
GRANT SELECT, INSERT, UPDATE, DELETE ON ed_bed_management.brian_berger_patients TO brianberger;
GRANT SELECT, INSERT, UPDATE, DELETE ON ed_bed_management.george_newman_patients TO georgenewman;

SET DEFAULT ROLE developer TO root@localhost;
SET DEFAULT ROLE manager TO bernweinmann;
SET DEFAULT ROLE provider TO timothylin, williamgill, jodibranch, paulgoldman, brianberger, georgenewman;
SET DEFAULT ROLE receptionist TO katiejones, janeduncan;
