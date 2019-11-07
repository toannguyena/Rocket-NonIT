    -- EX1---

CREATE DATABASE IF NOT EXISTS fresher;
USE fresher;
CREATE TABLE Trainee
(
	TraineeID 							SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Full_Name 							NVARCHAR(100) NOT NULL,
	Birth_Date 							DATE NOT NULL,
    Gender 								ENUM('male','female','unknown') NOT NULL,
    ET_IQ 								TINYINT(20) NOT NULL,
    ET_Gmath 							TINYINT(20) NOT NULL,
    ET_English 							TINYINT(50) NOT NULL,
    Training_Class 						CHAR(20) NOT NULL,
    Evaluation_Notes 					NVARCHAR(500)
  );  
  
  ALTER TABLE Trainee
  ADD VTI_Accoun VARCHAR(20) UNIQUE NOT NULL;
  
  -- EX2---
  
  CREATE TABLE student_Information
  (
	ID 									SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Name 								VARCHAR(60) NOT NULL,
    Code 								VARCHAR(100) NOT NULL,
    ModifiedDate 						DATETIME
);

-- EX3--

CREATE TABLE Staff_Information
(
	ID 									SMALLINT AUTO_INCREMENT PRIMARY KEY,
	Name 								VARCHAR(50) NOT NULL,
	BirthDate 							DATETIME,
	Gender 								ENUM('0','1','NULL') NOT NULL,
	IsDeletedFlag 						ENUM('0','1') NOT NULL
);
