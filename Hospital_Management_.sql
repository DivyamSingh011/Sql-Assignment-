
-- Step 1: Create and Use Database
CREATE DATABASE IF NOT EXISTS hospital_db;

-- Show databases (simulate human interaction)
SHOW DATABASES;

-- Use the new database explicitly
USE hospital_db;

-- Step 2: Drop existing tables to avoid duplicates
DROP TABLE IF EXISTS Bill, Patient, Doctor, Department, Reception;

-- Step 3: Create Tables
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    address TEXT
);

CREATE TABLE Reception (
    recp_id INT PRIMARY KEY,
    recp_name VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE Bill (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    total_amount INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- Step 4: Insert and Select to simulate human verification
-- Department
INSERT INTO Department VALUES (1, 'Cardiology'), (2, 'Neurology'), (3, 'Orthopedics'),
                              (4, 'Pediatrics'), (5, 'General Medicine');
SELECT * FROM Department;

-- Doctor
INSERT INTO Doctor VALUES (101, 'Dr. Sharma', 'Cardiologist', 1),
                          (102, 'Dr. Mehta', 'Neurologist', 2),
                          (103, 'Dr. Khan', 'Orthopedic', 3),
                          (104, 'Dr. Rao', 'Pediatrician', 4),
                          (105, 'Dr. Das', 'General Physician', 5);
SELECT * FROM Doctor;

-- Patient
INSERT INTO Patient VALUES (201, 'Aman Gupta', '9876543210', 'Delhi'),
                           (202, 'Riya Singh', '7896541230', 'Meerut'),
                           (203, 'Vikram Patel', '9988776655', 'Lucknow'),
                           (204, 'Nisha Yadav', '7778889991', 'Kanpur'),
                           (205, 'Pooja Bansal', '6665554443', 'Agra');
SELECT * FROM Patient;

-- Reception
INSERT INTO Reception VALUES (301, 'Suman Verma', '1234567890'),
                             (302, 'Rajeev Rathi', '2345678901'),
                             (303, 'Neha Sharma', '3456789012'),
                             (304, 'Karan Patel', '4567890123'),
                             (305, 'Anjali Chauhan', '5678901234');
SELECT * FROM Reception;

-- Bill
INSERT INTO Bill VALUES (401, 201, 5000),
                        (402, 202, 3000),
                        (403, 203, 4500),
                        (404, 204, 2500),
                        (405, 205, 7000);
SELECT * FROM Bill;

-- Step 5: DML Operations
-- UPDATE
UPDATE Doctor SET specialization = 'Senior Cardiologist' WHERE doctor_id = 101;
SELECT * FROM Doctor WHERE doctor_id = 101;

UPDATE Patient SET phone = '9999999999' WHERE patient_id = 202;
SELECT * FROM Patient WHERE patient_id = 202;

-- DELETE
DELETE FROM Department WHERE dept_id = 5;
SELECT * FROM Department;

DELETE FROM Bill WHERE bill_id = 405;
SELECT * FROM Bill;

-- Additional Inserts
INSERT INTO Department VALUES (6, 'Dermatology');
SELECT * FROM Department;

INSERT INTO Doctor VALUES (106, 'Dr. Ahuja', 'Dermatologist', 6);
SELECT * FROM Doctor WHERE doctor_id = 106;
