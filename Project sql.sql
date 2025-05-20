CREATE DATABASE CLINIC;
USE CLINIC;
CREATE TABLE Patients(
patient_id INT AUTO_INCREMENT PRIMARY KEY ,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL ,
date_of_birth DATE ,
gender ENUM('Male', 'Female', 'Other') NOT NULL , 
phone VARCHAR(15) UNIQUE NOT NULL ,
email VARCHAR(100) UNIQUE
);

-- Doctors table
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE NOT NULL
);

-- Specialties table
CREATE TABLE Specialties (
    specialty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Many-to-Many relationship between Doctors and Specialties
CREATE TABLE Doctor_Specialty (
    doctor_id INT NOT NULL,
    specialty_id INT NOT NULL,
    PRIMARY KEY (doctor_id, specialty_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (specialty_id) REFERENCES Specialties(specialty_id)
);

-- Appointments table
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason TEXT,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Treatments table
CREATE TABLE Treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    description TEXT NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- Payments table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    treatment_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    method ENUM('Cash', 'Card', 'Insurance') NOT NULL,
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);

INSERT INTO Patients (first_name, last_name, date_of_birth, gender, phone, email) VALUES
('Alice', 'Johnson', '1990-05-14', 'Female', '1234567890', 'alice.johnson@example.com'),
('Bob', 'Smith', '1985-11-23', 'Male', '0987654321', 'bob.smith@example.com');

-- Sample Doctors
INSERT INTO Doctors (first_name, last_name, phone, email, hire_date) VALUES
('Dr. Sarah', 'Brown', '1112223333', 'sarah.brown@clinic.com', '2020-01-10'),
('Dr. John', 'Lee', '4445556666', 'john.lee@clinic.com', '2021-03-15');

-- Sample Specialties
INSERT INTO Specialties (name) VALUES
('Cardiology'),
('Dermatology'),
('Pediatrics');

-- Sample Doctor-Specialty relationships
INSERT INTO Doctor_Specialty (doctor_id, specialty_id) VALUES
(1, 1), -- Dr. Sarah - Cardiology
(2, 2), -- Dr. John - Dermatology
(2, 3); -- Dr. John - Pediatrics

-- Sample Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, reason, status) VALUES
(1, 1, '2025-05-21 10:00:00', 'Chest pain consultation', 'Scheduled'),
(2, 2, '2025-05-22 14:30:00', 'Skin rash evaluation', 'Scheduled');

-- Sample Treatments
INSERT INTO Treatments (appointment_id, description, cost) VALUES
(1, 'ECG and blood pressure monitoring', 150.00),
(2, 'Skin ointment prescription and allergy test', 100.00);

-- Sample Payments
INSERT INTO Payments (treatment_id, payment_date, amount, method) VALUES
(1, '2025-05-21', 150.00, 'Card'),
(2, '2025-05-22', 100.00, 'Cash');

SELECT * FROM Patients;


 






