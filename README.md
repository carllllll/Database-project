# CLINIC BOOKING SYSTEM Database-project
#The Database project is based off a Clinic booking system with patients table, doctor's table, specialties table, doctor's specialties, appointments table, treatments table and payment table.
What the project does:
1. The project aims to create a system for patients to book specific appointments for specific medical concerns with a doctor who has expertice in the said medical concern.
2.  The project enters the patient data and matches their concern with a doctor it then books am appointment with the doctor for the patient.
3.  It stores both patient and doctor information.
4.  It also stores treatment data.
How to run:
-First download the sql file and then open the Mysql application and navigate to the administration tab on the bottom left of the Mysql application and among the options displayed select Data import then select the Project sql file that was downloaded. After importing the file you can execute each of the sql files one at a time.
![image](https://github.com/user-attachments/assets/c0a8527e-5e38-4236-b7dd-0fe19bb6b82f)
The following are the tables:
-- Patients table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
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
