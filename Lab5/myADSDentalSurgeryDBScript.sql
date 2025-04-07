
CREATE TABLE Dentist (
    dentist_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    specialization VARCHAR(100)
);

CREATE TABLE Patient (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(255),
    date_of_birth DATE,
    has_unpaid_bill BOOLEAN DEFAULT FALSE
);

CREATE TABLE Surgery (
    surgery_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    phone VARCHAR(20)
);

CREATE TABLE Appointment (
    appointment_id SERIAL PRIMARY KEY,
    appointment_date DATE,
    appointment_time TIME,
    dentist_id INT REFERENCES Dentist(dentist_id),
    patient_id INT REFERENCES Patient(patient_id),
    surgery_id INT REFERENCES Surgery(surgery_id)
);


INSERT INTO Dentist (first_name, last_name, phone, email, specialization) VALUES
('John', 'Doe', '555-1234', 'jdoe@ads.com', 'Orthodontist'),
('Jane', 'Smith', '555-5678', 'jsmith@ads.com', 'Endodontist'),
('Emily', 'Clark', '555-9012', 'eclark@ads.com', 'General Dentist');

INSERT INTO Patient (first_name, last_name, phone, email, address, date_of_birth, has_unpaid_bill) VALUES
('Michael', 'Brown', '555-1111', 'mbrown@email.com', '123 Elm St', '1990-06-15', FALSE),
('Sarah', 'Miller', '555-2222', 'smiller@email.com', '456 Oak St', '1985-09-22', TRUE),
('Tom', 'Wilson', '555-3333', 'twilson@email.com', '789 Pine St', '2000-01-01', FALSE);

INSERT INTO Surgery (name, address, phone) VALUES
('ADS Main Branch', '100 Main St, Dallas, TX', '555-0001'),
('ADS South Branch', '200 South St, Austin, TX', '555-0002');

INSERT INTO Appointment (appointment_date, appointment_time, dentist_id, patient_id, surgery_id) VALUES
('2025-04-10', '09:00:00', 1, 1, 1),
('2025-04-10', '10:00:00', 2, 2, 2),
('2025-04-11', '11:00:00', 3, 3, 1);


SELECT * FROM Dentist ORDER BY last_name ASC;

SELECT A.*, P.first_name, P.last_name, P.phone, P.email
FROM Appointment A
JOIN Patient P ON A.patient_id = P.patient_id
WHERE A.dentist_id = 1;

SELECT A.*, S.name AS surgery_name, S.address
FROM Appointment A
JOIN Surgery S ON A.surgery_id = S.surgery_id;

SELECT *
FROM Appointment
WHERE patient_id = 1
AND appointment_date = '2025-04-10';
