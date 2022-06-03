CREATE DATABASE testEMR;

SHOW DATABASES;

USE testEMR;

SHOW TABLES;

-- Create Tables

CREATE TABLE patient (
    pid int primary key,
    LastName varchar(255),
    FirstName varchar(255),
    DateOfBirth date,
    Gender varchar(1),
    Address varchar(255),
    PhoneNum varchar(255),
    City varchar(255)
);

CREATE TABLE hospital (
    hid int primary key,
    HospitalName varchar(255),
	HospitalIdentifier varchar(255),
    Address varchar(255),
    PhoneNum varchar(255)
);

CREATE TABLE provider (
    prid int primary key,
    LicenseNum varchar(255),
    ProviderName varchar(255),
    SpecialtyCode varchar(255),
    SpecialtyName varchar(255)
);

CREATE TABLE diagnosis (
    did int primary key,
    pid int,
    FOREIGN KEY (pid) REFERENCES patient(pid) ON DELETE CASCADE,	
    DiagnosisName varchar(255),
    DiagnosisCode varchar(255)
);

CREATE TABLE medication (
    mid int primary key,
    pid int,
    FOREIGN KEY (pid) REFERENCES patient(pid) ON DELETE CASCADE,	
    MedicationName varchar(255),
    MedicationCode varchar(255)
);

CREATE TABLE smoking (
    smid int primary key,
    pid int,
    FOREIGN KEY (pid) REFERENCES patient(pid) ON DELETE CASCADE,	
    SmokingStatus varchar(255)
);

CREATE TABLE encounter (
    eid int primary key,
    pid int,
    FOREIGN KEY (pid) REFERENCES patient(pid) ON DELETE CASCADE,	
    hid int,
    FOREIGN KEY (hid) REFERENCES hospital(hid) ON DELETE CASCADE,	
    prid int,
    FOREIGN KEY (prid) REFERENCES provider(prid) ON DELETE CASCADE,	
    AdmitDate date,
    EncounterType varchar(255)
);

CREATE TABLE vaccinations (
    vid int primary key,
    pid int,
    FOREIGN KEY (pid) REFERENCES patient(pid) ON DELETE CASCADE,	
    VaccineName varchar(255),
    VaccineCode varchar(255)
);

CREATE TABLE PMH (
    pmid int primary key,
    pid int,
    FOREIGN KEY (pid) REFERENCES patient(pid) ON DELETE CASCADE,	
    MedicalType varchar(255),
    MedicalName varchar(255),
    MedicalCode varchar(255)
);

CREATE TABLE allergy (
    aid int primary key,
    pid int,
    FOREIGN KEY (pid) REFERENCES patient(pid) ON DELETE CASCADE,	
    AllergyName varchar(255)
);

-- Generate test data

INSERT INTO patient (pid, LastName, FirstName, DateOfBirth, Gender, Address, City, PhoneNum) 
    VALUES 
    (1, 'Lee', 'Jaehoon', '1978-09-03', 'M', 'LG Apt 101-101', 'Seoul', '010-3232-1232'),  
    (2, 'Kim', 'Jaehun', '1958-01-11', 'M', 'Samsung Apt 131-101', 'Seoul', '010-3222-1607'),  
    (3, 'Shin', 'Nayoung', '2004-04-03', 'F', 'Samsung Apt 131-403', 'Jeju', '010-9222-1637'),  
    (4, 'Hong', 'Sunha', '1954-01-05', 'F', 'Samsung Apt 231-901', 'Busan', '010-3422-2637') ,
    (5, 'Kim', 'Giyoung', '1998-01-13', 'M', 'Hyundai Apt 131-106', 'Seoul', '010-3262-1630'),
    (6, 'Koh', 'Hyeyoung', '1992-08-27', 'F', 'Yundong Apt 201-505', 'Jeju', '010-1356-9032'),
    (7, 'Kang', 'Dongwon', '1887-02-23', 'M', 'Aradong Apt 301-203', 'Jeju', '010-1490-2952'),
    (8, 'Yang', 'Jihoon', '2002-05-29', 'M', 'Hyundai Apt 131-107', 'Incheon', '010-9358-2395'),
    (9, 'Lee', 'soyoung', '2010-12-31', 'F', 'Apple Apt 101-103', 'Incheon', '010-3042-3953'),
    (10, 'Kang', 'Minjoo', '1997-07-12', 'F', 'Apple Apt 102-103', 'Jeju', '010-4932-9193'),
    (11, 'Kim', 'Wonjae', '1772-03-24', 'M', 'LG Apt 106-301', 'Seoul', '010-3953-0309'),
    (12, 'Yang', 'Jaehoon', '1992-09-01', 'M', 'Samsung Apt 230-101', 'Busan', '010-4323-2352'),
    (13, 'Koh', 'Hyewon', '2000-02-14', 'F', 'Aradong Apt 303-202', 'Jeju', '010-3420-4151'),
    (14, 'Yoon', 'Sowon', '2001-01-01', 'F', 'Yundong Apt 202-303', 'Seoul', '010-9500-3432'),
    (15, 'Kim', 'Jungseok', '1999-03-14', 'M', 'Nohyung Apt 101-101', 'Jeju', '010-9992-0321'),
    (16, 'Moon', 'Hyeqyung', '2002-12-24', 'F', 'Nohyung Apt 202-101', 'Jeju', '010-3321-2321'),
    (17, 'Joung', 'Sol', '2021-02-02', 'F', 'Apple Apt 101-103', 'Busan', '010-4325-2363');
    
INSERT INTO hospital (hid, HospitalName, HospitalIdentifier, Address, PhoneNum)
	VALUES
    (1, 'Samsung hospital', 'H12324', 'Seoul IlwonDong', '02-332-3232'),
    (2, 'Asan hospital', 'H12624', 'Seoul Jamsil', '02-132-3282'),
    (3, 'Jeju hospital', 'H12124', 'Seoul IlwonDong', '02-332-3238'),
    (4, 'Dokto hospital', 'H14324', 'Seoul IlwonDong', '02-362-3292'),
    (5, 'Hanla hospital', 'H14256', 'Jeju Yundong', '064-712-2345'),
    (6, 'Sinhwa hospital', 'H15523', 'Busan Yeonjegu', '051-562-4329'),
    (7, 'Busan hospital', 'H14402', 'Jeju Nohyung', '064-745-2456'),
    (8, 'Yeonse hospital', 'H12034', 'Gyeonggi Suwon', '031-442-3392'),
    (9, 'Korea hospital', 'H14670', 'Daegu Dalseo', '053-452-2345'),
    (10, 'Daehan hospital', 'H11111', 'Seoul Jongno', '02-830-5820');
    
INSERT INTO provider (prid, licenseNum, ProviderName, SpecialtyCode, SpecialtyName)
	VALUES
	(1, 'D4123', 'Shin Yongho', '8', 'Family medicine'),
	(2, 'D4923', 'Kim Taehun', '2', 'Anesthesiology & Pain Medicine'),
	(3, 'D4193', 'Cho Jinho', '3', 'Child & Adolescent Medicine'),
    (4, 'D3214', 'Koh Jihoon', '5', 'Pulmonology & Allergy'), 
    (5, 'D4412', 'Kim Jun', '6', 'Tuberculosis'),
    (6, 'D3201', 'Kang Duckho', '1', 'Obstetrics and Gynecology'),
    (7, 'D4932', 'Yang Jinhoon', '7', 'Nephrology'),
    (8, 'D2434', 'Yoon Taehyung', '9', 'Otorhinolaryngology'),
    (9, 'D1323', 'Kim Somi', '12', 'Physical Medicine and Rehabilitation'),
    (10, 'D2921', 'Kang Suji', '4', 'Dermatology'),
    (11, 'D5432', 'Yang soyoung', '10', 'Radiology'),
    (12, 'D2350', 'Park Gihoon', '11', 'Emergency Medicine'),
    (13, 'D6493', 'Kang Uhwang', '13', 'Urology'),
    (14, 'D7949', 'Koh Jaeyoung', '14', 'Psychiatry');

INSERT INTO diagnosis (did, pid, DiagnosisName, DiagnosisCode) 
	VALUES
    (1, 1, 'Hypertension', 'I10'),
    (2, 1, 'Diabetes', 'N08.3'),
    (3, 2, 'Arthrithis', 'M13. 80'),
    (4, 4, 'Pneumonia', 'J18. 9'),
    (5, 12, 'Stroke', 'ICD-8 433'),
    (6, 11, 'Cancer of colon', 'C18. 9'),
    (7, 3, 'Cancer of breast', 'C50'),
    (8, 5, 'Lost legs', 'Z89. 9'),
    (9, 15, 'Cancer of colon', 'C18. 9'),
    (10, 17, 'Deconditioned', '728.2'),
    (11, 13, 'Lung disease', 'J44. 9'),
    (12, 16, 'Decreased mobility', 'Z74. 0.'),
    (13, 8, 'Stroke', 'ICD-8 433'),
    (14, 7, 'Pneumonia', 'J18. 9'),
    (15, 6, 'Hypertension', 'I10'),
    (16, 9, 'Cancer of breast', 'C50'),
    (17, 10, 'Hip replacement', 'Z96. 64'),
    (18, 3, 'Decreased mobility', 'Z74. 0.'),
    (19, 14, 'Heart surgery', 'I97. 790'),
    (20, 15, 'Fall: fractured pelvic bones', 'S32. 89XA');

INSERT INTO  medication (mid, pid, MedicationName, MedicationCode)
	VALUES
    (1, 1, 'Amoxicilin', '54569-5193'),
    (2, 2, 'Insulin', 'Z79. 4'),
    (3, 2, 'Lovenox', '96372'),
    (4, 4, 'Amoxicilin', '54569-5193'),
    (5, 12, 'Lovenox', '96372'),
    (6, 11, 'Gabapentin', '50090-1681'),
    (7, 3, 'Naloxone', 'J2310'),
    (8, 5, 'Atenolol', '65841-022-01'),
    (9, 15, 'Lisinopril', '50090-4485'),
    (10, 17, 'Carvedilol', '65841-616-01'),
    (11, 13, 'Paroxetine', 'C19H20FNO3'),
    (12, 16, 'Prednisone', 'J7510.'),
    (13, 8, 'Hydrocotisone', 'J1720'),
    (14, 7, 'Lovenox', '96372'),
    (15, 6, 'Insulin', 'Z79. 4'),
    (16, 9, 'Naloxone', 'J2310'),
    (17, 10, 'Lovenox', '96372'),
    (18, 3, 'Paroxetine', 'C19H20FNO3'),
    (19, 14, 'Carvedilol', '65841-616-01'),
    (20, 15, 'Hydrocotisone', 'J1720');
    
INSERT INTO smoking (smid, pid, SmokingStatus)
	VALUES 
    (1, 1, 'Former smoker'),
    (2, 2, 'Former smoker'),
    (3, 4, 'Former smoker'),
    (4, 5, 'No smoker'),
    (5, 6, 'Former smoker'),
    (6, 7, 'Former smoker'),
    (7, 8, 'No smoker'),
    (8, 10, 'No smoker'),
    (9, 11, 'No smoker'),
    (10, 12, 'No smoker'),
    (11, 13, 'No smoker'),
    (12, 14, 'Former smoker'),
    (13, 15, 'Former smoker'),
    (14, 16, 'Former smoker');
    
INSERT INTO encounter (eid, pid, hid, prid, AdmitDate, EncounterType)
	VALUES
    (1, 1, 1, 1, '2018-02-01', 'ED'),
    (2, 2, 2, 1, '2020-08-01', 'ED'),
    (3, 3, 4, 3, '2020-01-11', 'ED'),
    (4, 4, 2, 1, '2020-07-30', 'ED'),
    (5, 5, 3, 2, '2019-01-04', 'ED'),
    (6, 5, 1, 2, '2020-07-01', 'ED'),
	(7, 6, 7, 13, '2022-06-01', 'ED'),
	(8, 14, 8, 12, '2020-04-11', 'ED'),
    (9, 11, 3, 7, '2021-04-22', 'ED'),
    (10, 6, 2, 14, '2022-04-11', 'ED'),
    (11, 9, 10, 9, '2018-07-18', 'ED'),
    (12, 8, 5, 3, '2018-02-14', 'ED'),
    (13, 7, 6, 4, '2021-12-11', 'ED'),
    (14, 10, 9, 5, '2021-09-04', 'ED'),
    (15, 13, 8, 6, '2017-02-21', 'ED'),
    (16, 12, 2, 8, '2022-06-05', 'ED'),
    (17, 15, 7, 10, '2021-12-23', 'ED'),
    (18, 16, 8, 11, '2017-01-10', 'ED'),
    (19, 17, 4, 12, '2020-05-06', 'ED'),
    (20, 14, 1, 13, '2021-09-27', 'ED');

INSERT INTO vaccinations(vid, pid, VaccineName, VaccineCode)
    VALUES
    (1, 3, 'Meningococcal vaccine', 'J07AH01'),
    (2, 1, 'Japanese encephalitis vaccine', 'J07BA01'),
    (3, 1, 'Tetanus vaccine', 'J07AM01'),
    (4, 2, 'Hepatitis A vaccine', 'J07BC02'),
    (5, 3, 'Hepatitis B vaccine', 'J07BC01'),
    (6, 4, 'Varicella vaccine', 'J07BK01'),
    (7, 4, 'Zoster vaccine', 'J07BK02'),
    (8, 4, 'HPV vaccine', 'J07BM01'),
    (9, 5, 'Tetanus vaccine', 'J07AM01'),
    (10, 5, 'Meningococcal vaccine', 'J07AH01'),
    (11, 6, 'Tetanus vaccine', 'J07AM01'),
    (12, 7, 'HPV vaccine', 'J07BM01'),
    (13, 8, 'Hepatitis A vaccine', 'J07BC02'),
    (14, 9, 'Measles vaccine', 'J07BD01'),
    (15, 10, 'Meningococcal vaccine', 'J07AH01'),
    (16, 11, 'Tetanus vaccine', 'J07AM01'),
    (17, 12, 'Measles vaccine', 'J07BD01'),
    (18, 13, 'HPV vaccine', 'J07BM01'),
    (19, 14, 'HPV vaccine', 'J07BM01'),
    (20, 15, 'Hepatitis B vaccine', 'J07BC01'),
    (21, 16, 'Measles vaccine', 'J07BD01'),
    (22, 17, 'Hepatitis A vaccine', 'J07BC02'),
    (23, 8, 'Meningococcal vaccine', 'J07AH01'),
    (24, 13, 'Hepatitis A vaccine', 'J07BC02'),
    (25, 15, 'Meningococcal vaccine', 'J07AH01');
    
INSERT INTO PMH(pmid, pid, MedicalType, MedicalName, MedicalCode)
    VALUES
    (1, 2, 'mental', 'depressive disorder', 'F32'),
    (2, 1, 'disease', 'myocardial infarction', 'I214'),
    (3, 2, 'operation', 'open heart surgery', '33016- 37799'),
    (4, 3, 'atopy', 'asthma', 'J45'),
    (5, 5, 'disease', 'diabetes', 'E10.2'),
    (6, 9, 'atopy', 'allergic rhinitis', 'J30. 9'),
    (7, 10, 'mental', 'panic disorder', 'F41.0'),
    (8, 13, 'disease', 'tuberculosis',  'Z22.7'),
    (9, 15, 'operation', 'Spinal Surgery', 'M43. 20'),
    (10, 17, 'disease', 'arrhythmia', 'I49'),
    (11, 17, 'mental', 'dementia', 'F03.90'),
    (12, 4, 'mental', 'schizophrenia', 'F20. 9');
    
INSERT INTO allergy(aid, pid, AllergyName)
    VALUES
    (1, 1, 'peanut'),
    (2, 1, 'shrimp'),
    (3, 3, 'Japan cedar'),
    (4, 5, 'peach'),
    (5, 7, 'buckwheat'),
    (6, 9, 'Japan cedar'),
    (7, 10, 'Grass'),
    (8, 11, 'milk'),
    (9, 11, 'peach'),
    (10, 13, 'crab'),
    (11, 17, 'buckwheat'),
    (12, 16, 'peanut'),
    (13, 15, 'crab'),
    (14, 14, 'Grass'),
    (15, 10, 'milk'),
    (16, 2, 'peanut'),
    (17, 6, 'Grass'),
    (18, 8, 'Japan cedar'),
    (19, 4, 'crab'),
    (20, 2, 'Japan cedar');
    
commit;