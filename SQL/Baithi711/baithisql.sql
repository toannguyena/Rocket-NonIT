-- a) Tạo table với các ràng buộc và kiểu dữ liệu 

DROP DATABASE IF EXISTS Manage_Students_Marks ;
CREATE DATABASE IF NOT EXISTS Manage_Students_Marks;
USE Manage_Students_Marks;
-- --------------------------------------------------
DROP TABLE IF EXISTS Student;
CREATE TABLE Student 	
(
	RN			SMALLINT AUTO_INCREMENT PRIMARY KEY,
	`Name`		CHAR (30) NOT NULL,
	Age			SMALLINT NOT NULL,
	Gender		ENUM('0','1')
);
-- --------------------------------------------------
DROP TABLE IF EXISTS `Subject`;
CREATE TABLE `Subject` 
(
	sID			SMALLINT AUTO_INCREMENT PRIMARY KEY,
	sName		CHAR (30) NOT NULL
);
-- --------------------------------------------------
DROP TABLE IF EXISTS StudentSubject;
CREATE TABLE StudentSubject
(
	RN				SMALLINT,
	sID				SMALLINT,
	Mark			SMALLINT,
	`Date`			DATE,
    PRIMARY KEY (`RN`,`sID`),
    FOREIGN KEY (`RN`) 	REFERENCES Student(`RN`) 	ON DELETE CASCADE,
	FOREIGN KEY (`sID`) REFERENCES `Subject`(`sID`)	ON DELETE CASCADE
);
-- --------------------------------------------------
INSERT INTO		 	Student (`Name`, Age, Gender)
VALUES			    ('nguyen nam 1', 20, '0'),
					('nguyen nam 2', 21, '1'),
					('nguyen nam 2', 21, NULL),
					('nguyen nam 4', 22, '1');
-- ------------------------------------------------
INSERT INTO		 	`Subject` (sName)
VALUES			    ('VAN'),
					('TOAN'),
					('HOA'),
					('LY');
-- ------------------------------------------------
INSERT INTO		 	StudentSubject (RN, sID	, Mark, `Date`)
VALUES			    (1 , 1, '10' ,'2019-02-01'),
					(2 , 2, NULL ,'2019-03-01'),
					(3 , 3, '9'  ,'2019-04-01'),
                    (4 , 1, '5'  ,'2019-02-02');
-- ------------------------------------------------			
-- b) Viết lệnh để
-- a. Lấy tất cả các môn học không có bất kì điểm nào 		
-- ------------------------------------------------					
SELECT 			s.sID, sName
FROM	 		StudentSubject SS
RIGHT JOIN		`Subject` S ON SS.sID = S.sID
WHERE 			SS.sID is NULL;

-- ------------------------------------------------					
-- b)
-- b.Lấy danh sách các môn học có ít nhất 2 điểm
-- ------------------------------------------------					

SELECT 				S.sName
FROM				StudentSubject SS
INNER JOIN			`Subject` S 	ON 	SS.sID	=	S.sID
GROUP BY			SS.sID
HAVING				COUNT(SS.sID)>1;
-- ------------------------------------------------	
-- c) Tạo "StudentInfo" view có các thông tin về học sinh bao gồm:
-- RN,sID,Name, Age, Gender, sName, Mark, Date. Với cột Gender show
-- Male để thay thế cho 0, Female thay thế cho 1 và Unknow thay thế cho
-- null.
-- ------------------------------------------------	

DROP VIEW IF EXISTS 	StudentInfo;
CREATE VIEW 			StudentInfo AS
	SELECT				SS.RN,Sb.sID,St.Name, St.Age, 
			CASE 
					WHEN Gender	= '0' THEN 'Male'
					WHEN Gender	= '1' THEN ' Female'
					ELSE 'Unknow'
					END AS Gender, 
					Sb.sName, SS.Mark, SS.Date
	FROM	StudentSubject SS
	JOIN	`Subject` Sb ON Sb.`sID`= SS.`sID`
	JOIN 	Student St ON St.`RN` = SS.`RN`;



