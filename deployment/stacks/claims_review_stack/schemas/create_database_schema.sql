
CREATE TABLE INSURED_PERSON (
    insured_id SERIAL PRIMARY KEY,
    insured_name VARCHAR(100) NOT NULL,
    insured_group_number VARCHAR(100) NOT NULL,
    insured_plan_name VARCHAR(100) NOT NULL,
    insured_birth_date DATE NOT NULL,
    insured_policy_number VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    address TEXT
);

CREATE TABLE PATIENT (
    patient_id SERIAL PRIMARY KEY,
    insured_id INT NOT NULL,
    patient_firstname VARCHAR(100) NOT NULL,
    patient_lastname VARCHAR(100) NOT NULL,
    patient_birth_date DATE NOT NULL,
    relationship_to_insured VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15),
    sex VARCHAR(5),
    address TEXT,    
    FOREIGN KEY (insured_id) REFERENCES INSURED_PERSON(insured_id)
);

CREATE TABLE CLAIM (
    claim_id SERIAL PRIMARY KEY,
    patient_id INT NOT NULL,
    claim_date DATE NOT NULL,
    diagnosis_1 VARCHAR(50),
    diagnosis_2 VARCHAR(50),
    diagnosis_3 VARCHAR(50),
    diagnosis_4 VARCHAR(50),
    balanceDue DECIMAL(10, 2),
    amountPaid DECIMAL(10, 2),
    total_charges DECIMAL(10, 2) NOT NULL,
    claim_status VARCHAR(50) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id)
);

CREATE TABLE SERVICE (
    service_id SERIAL PRIMARY KEY,
    claim_id INT NOT NULL,
    date_of_service DATE,
    place_of_service VARCHAR(10),
    type_of_service VARCHAR(10),
    procedure_code INT,
    charge_amount DECIMAL(10, 2),
    FOREIGN KEY (claim_id) REFERENCES CLAIM(claim_id)
);

INSERT INTO INSURED_PERSON (insured_name, insured_policy_number, insured_plan_name, insured_birth_date, insured_group_number, phone_number, address)
VALUES
('John Smith', 'ABC123', 'FakeHealth Plus', '1990-01-01', 'GRP123', '202 555 1212', '1600 Pennsylvania Avenue NW, Washington, DC 20500'),
('Achilles Tenn Dawn', 'ABC456', 'FakeHealth Premium', '1990-01-01', 'GRP345', '555 555 1212', '123 Main Street, Fakeville, FL 12345'),
('Mary Demick', 'ABC789', 'FakeHealth Standard', '1990-01-01', 'GRP789', '555 555 1212', '123 Main Street, Fakeville, FL 12345'),
('Ima Pigg', '49', 'FakeHealth Plus', '1980-05-15', 'GRP100', '555-OINK-123', '42 Bacon Boulevard Hogtown HT 12345'),
('Hugh Jass', '23', 'FakeHealth Premium', '1975-11-30', 'GRP100', '555-BIG-BUTT', '69 Cushion Court Sittington ST 67890'),
('Anita Bath', '61', 'FakeHealth Standard', '1990-03-22', 'GRP100', '555-SOAP-911', '7 Rubber Ducky Road Bubbletown BT 13579'),
('Ben Dover', '11', 'FakeHealth Plus', '2065-07-04', 'GRP100', '555-FLEX-247', '180 Pretzel Avenue Bendington BD 24680'),
('Eileen Dover', '2', 'FakeHealth Premium', '1988-09-13', 'GRP100', '555-TILT-345','45 Degree Street Leanville LN 11223'),
('Justin Case','75','FakeHealth Standard','1982-12-25','GRP100','555-MAYBE-777','999 What If Boulevard Perhapsburg PH99999'),
('Penny Tration', '55', 'FakeHealth Plus', '1977-02-14', 'GRP100', '555-DEEP-414', '6 Feet Under Drive Coreville CR 66666'),
('Mike Rotch', '57', 'FakeHealth Premium', '1969-08-08', 'GRP100', '555-ITCH-789', '23 Scratch Avenue Fidgetville FG 87654'),
('Ivana Tinkle', '30', 'FakeHealth Standard', '1995-06-06', 'GRP100', '555-PEE-5555', '1 Bladder Way Urinetown UT 12121'),
('Seymour Butts', '93', 'FakeHealth Plus', '2060-10-31', 'GRP100', '555-REAR-END', '101 Behind Street Bottomville BV 80085'),
('Ophelia Payne', '52', 'FakeHealth Premium', '2000-01-01', 'GRP100', '555-OUCH-222', '8 Agony Lane Hurtville HV 54321'),
('Hugh G. Rection', '89', 'FakeHealth Standard', '1985-04-20', 'GRP100', '555-RISE-UP1', '69 Stiff Street Uprightville UV 69696'),
('Ivana Humpalot', '71', 'FakeHealth Plus', '1984-02-29', 'GRP100', '555-LOVE-699','69 Passion Road Lustville LT 96969'),
('Willie Leak','90','FakeHealth Premium','1971-11-11','GRP100','555-DRIP-247','7 Puddle Path Damptown DT 77777'),
('Anita Mann','67','FakeHealth Standard','1998-08-18','GRP100','555-MASC-411','1 Beard Street Dudeville DV 80808'),
('Dick Tator','50','FakeHealth Plus','2045-04-01 ','GRP100 ','555-BOSS-911 ','1 Supreme Leader Avenue Controlton CT11111'),
('Emma Royd ','86 ','FakeHealth Premium ','1986-09-09 ','GRP100 ','555-VOID-000 ','0 Black Hole Road Nullville NV00000' ),
('Moe Lester', '94', 'FakeHealth Standard', '2055-06-13', 'GRP100', '555-CREEP-666', '123 Sketchy Street Shadytown ST 66666'),
('Gaye Pole', '28', 'FakeHealth Plus', '1992-07-07', 'GRP100', '555-TWIRL-789', '360 Spin Circle Rotationville RV 36036'),
('Haywood Jablowme', '96', 'FakeHealth Premium', '1978-12-12', 'GRP100', '555-BLOW-247', '42 Windy Way Gustville GV 42424');

INSERT INTO PATIENT (insured_id, patient_firstname, patient_lastname, patient_birth_date, relationship_to_insured, phone_number, sex, address)
VALUES
(1, 'Jane', 'Doe', '1992-01-02', 'Spouse', '555 555 1234', 'F', '123 Main Street, Fakeville, FL 12345'),
(2, 'Achilles', 'Tenn Dawn', '2000-01-01', 'Self', '555 555 1212', 'M', '123 Main Street, Fakeville, FL 12345'),
(3, 'Penn', 'Demick', '2000-01-01', 'Spouse', '555 555 1212', 'N', '123 Main Street, Fakeville, FL 12345'),
(4, 'Ima', 'Pigg', '1980-05-15', 'Self', '555-OINK-123', 'F', '42 Bacon Boulevard Hogtown HT 12345'),
(5, 'Hugh', 'Jass', '1975-11-30', 'Self', '555-BIG-BUTT', 'M', '69 Cushion Court Sittington ST 67890'),
(6, 'Anita', 'Bath', '1990-03-22', 'Self', '555-SOAP-911', 'F', '7 Rubber Ducky Road Bubbletown BT 13579'),
(7, 'Ben', 'Dover', '2065-07-04', 'Self', '555-FLEX-247', 'M', '180 Pretzel Avenue Bendington BD 24680'),
(8, 'Eileen', 'Dover', '1988-09-13', 'Self', '555-TILT-345', 'F', '45 Degree Street Leanville LN 11223'),
(9, 'Justin', 'Case', '1982-12-25', 'Self', '555-MAYBE-777', 'M','999 What If Boulevard Perhapsburg PH 99999'),
(10, 'Penny', 'Tration', '1988-09-12', 'Self', '555-DEEP–414', 'F', '6 Feet Under Drive Coreville CR 66666'),
(11, 'Mike', 'Rotch', '1969-08-08', 'Self', '555-ITCH-789', 'M', '23 Scratch Avenue Fidgetville FG 87654'),
(12, 'Ivana', 'Tinkle', '1995-06-06', 'Self', '555-PEE-5555', 'F', '1 Bladder Way Urinetown UT 12121'),
(13, 'Seymour', 'Butts', '2060-10-31', 'Self', '555-REAR-END', 'M', '101 Behind Street Bottomville BV 80085'),
(14, 'Ophelia', 'Payne', '2000-01-01', 'Self', '555-OUCH-222', 'F', '8 Agony Lane Hurtville HV 54321'),
(15, 'Hugh G.', 'Rection', '1985-04-20', 'Self', '555-RISE-UP1', 'M', '69 Stiff Street Uprightville UV 69696'),
(16, 'Ivana', 'Humpalot', '1984-02-29', 'Self', '555-LOVE-699', 'F', '69 Passion Road Lustville LT 96969'),
(17, 'Willie', 'Leak', '1971-11-11', 'Self', '555-DRIP-247', 'M','7 Puddle Path Damptown DT 77777'),
(18, 'Anita', 'Mann', '1998-08-18', 'Self', '555-MASC-411', 'F', '1 Beard Street Dudeville DV 80808'),
(19, 'Dick', 'Tator', '2045-04-01', 'Self', '555-BOSS-911', 'M', '1 Supreme Leader Avenue Controlton CT 11111'),
(20, 'Emma', 'Royd', '1986-09-09', 'Self', '555-VOID-000', 'F', '0 Black Hole Road Nullville NV 00000'),
(21, 'Moe', 'Lester', '2055-06-13', 'Self', '555-CREEP-666', 'M', '123 Sketchy Street Shadytown ST 66666'),
(22, 'Gaye', 'Pole', '1992-07-07', 'Self', '555-TWIRL-789', 'F', '360 Spin Circle Rotationville RV 36036'),
(23, 'Haywood', 'Jablowme', '1978-12-12', 'Self', '555-BLOW-247', 'M', '42 Windy Way Gustville GV 42424');