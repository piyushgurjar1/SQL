create database Hospital;
use Hospital;
create table hospital (
    hospital_id int primary key,
    name varchar(255) NOT NULL,
    address varchar(255) NOT NULL
);
create table  doctor (
    doctor_id int primary key,
    name varchar(255) NOT NULL,
    qualification varchar(255) NOT NULL,
    specialization varchar(255) NOT NULL,
    hospital_id int,
    foreign key (hospital_id) references hospital(hospital_id)
);
create table staff (
    staff_id int primary key,
    name varchar(255) NOT NULL,
    job varchar(255) NOT NULL,
    hospital_id int,
    foreign key (hospital_id) references hospital(hospital_id)
);
create table patient (
    patient_id int primary key,
    name varchar(255) NOT NULL,
    dob DATE NOT NULL,
    blood_type varchar(10) NOT NULL
);
create table medical_record (
    record_id int primary key,
    patient_id int,
    disease varchar(255),
    report text,
    prescriptions text,
    foreign key (patient_id) references patient(patient_id)
);
create table bill (
    bill_id int primary key,
    patient_id int,
    amount int NOT NULL,
    date DATE NOT NULL,
    insurance_details TEXT,
    foreign key (patient_id) references patient(patient_id)
);
create table treatment (
    appointment_id int primary key,
    patient_id INT,
    doctor_id INT,
    foreign key (patient_id) references patient(patient_id),
    foreign key (doctor_id) references doctor(doctor_id)
);
create table  hospital_admission (
    admission_id int primary key,
    patient_id int,
    hospital_id int,
    admission_date DATE,
    discharge_date DATE,
    foreign key (patient_id) references patient(patient_id),
    foreign key (hospital_id) references hospital(hospital_id)
);





