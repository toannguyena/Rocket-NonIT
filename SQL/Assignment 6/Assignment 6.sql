-- SQL – Assignment 6
-- Exercise 1:
-- Questions
-- a) TạoProject_Modules table với các ràng buộc và kiểu dữ liệu và thêm ít nhất 3 bản ghi vào mỗi table trên
-- ------------------------------------------------------------------------
DROP DATABASE IF EXISTS Project_manager;
CREATE DATABASE IF NOT EXISTS Project_manager;
USE Project_manager;
-- ------------------------------------------------------------------------
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee
(
		EmployeeID				SMALLINT AUTO_INCREMENT PRIMARY KEY,
		EmployeeLastName		CHAR (20) NOT NULL,
		EmployeeFistName		CHAR (20) NOT NULL,
		EmployeeHireDate		DATE NOT NULL,
		EmployeeStatus			ENUM('DangLamViec','DaNghiViec','NULL') NOT NULL,
		SupervisorID			SMALLINT,
		SocialSecurityNumber	INT NOT NULL
);
   -- ----------------------------------------------------------------------
   DROP TABLE IF EXISTS Projects;
   CREATE TABLE Projects
( 
		ProjectID					SMALLINT AUTO_INCREMENT PRIMARY KEY,
		EmployeeID					SMALLINT NOT NULL,
		ProjectName					VARCHAR(100) NOT NULL,
		ProjectStartDate			DATE NOT NULL,
		ProjectDescription			VARCHAR(1000),	
		ProjectDetailt				NVARCHAR(1000),
		ProjectCompletedOn			DATE NOT NULL,
        FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

  -- ----------------------------------------------------------------------

DROP TABLE IF EXISTS Project_Modules;
CREATE TABLE Project_Modules     
(	
		ModuleID					SMALLINT AUTO_INCREMENT PRIMARY KEY,
		ProjectID					SMALLINT NOT NULL,
		EmployeeID					SMALLINT NOT NULL,
		ProjectModulesDate			DATE NOT NULL,
		ProjectModulesCompledOn		DATE NOT NULL,	
		ProjectModulesDescription	NVARCHAR(1000),
		FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) ON DELETE CASCADE,
		FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
      );
   SELECT * FROM PROJECT_MODULES;

-- ----------------------------------------------------------------------------
	DROP TABLE IF EXISTS Work_Done;
    CREATE TABLE Work_Done 
(
		WorkDoneID					SMALLINT AUTO_INCREMENT PRIMARY KEY,
		EmployeeID					SMALLINT NOT NULL,
		ModuleID					SMALLINT NOT NULL,
		WorkDoneDate				DATE NULL,
		WorkDoneDescription			VARCHAR(1000),
		WorkDoneStatus				ENUM('DangTienHanh','DaHoanThanh','NULL') NOT NULL,
        FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
        FOREIGN KEY (ModuleID) REFERENCES Project_Modules(ModuleID) ON DELETE CASCADE
);
-- --------------------------------------------------------------------------------
				
INSERT INTO		 	Employee (EmployeeLastName,EmployeeFistName,EmployeeHireDate,EmployeeStatus,SupervisorID,SocialSecurityNumber)
VALUES			    ('nguyen', 'nam 1', '2019-02-03', 'DangLamViec', 	NULL, 1233),
					('nguyen', 'nam 2', '2018-02-03', 'DangLamViec', 	NULL, 1223),
					('nguyen', 'nam 3', '2017-02-03', 'DaNghiViec', 	NULL, 1213),
					('nguyen', 'nam 4', '2017-06-08', 'DangLamViec', 	10	, 1433),
					('nguyen', 'nam 5', '2018-03-08', 'NULL', 			NULL, 1543),
					('nguyen', 'nam 6', '2015-12-13', 'DangLamViec', 	NULL, 1763),
					('nguyen', 'nam 7', '2018-02-20', 'DaNghiViec', 	8	, 1873),
					('nguyen', 'nam 8', '2017-07-03', 'DangLamViec', 	11	, 1343),
					('nguyen', 'nam 9', '2018-08-03', 'DaNghiViec',	 	NULL, 1653),
					('nguyen', 'nam 10', '2014-06-09', 'DangLamViec', 	11	, 1433),
					('nguyen', 'nam 11', '2015-06-07', 'NULL', 			NULL, 1213);

-- --------------------------------------------------------------------------------
INSERT INTO		 	Projects (EmployeeID, ProjectName, ProjectStartDate, ProjectDescription, ProjectDetailt, ProjectCompletedOn)
VALUES			    		( 1 , 'Project 1', '2001-02-03', 'ProjectDescription 1', 'ProjectDetailt', '2019-07-03'),
							( 2 , 'Project 2', '2002-02-03', 'ProjectDescription 1', 'ProjectDetailt', '2018-10-03'),
							( 1 , 'Project 3', '2005-02-03', 'ProjectDescription 1', 'ProjectDetailt', '2017-12-03'),
							( 3 , 'Project 4', '2008-06-08', 'ProjectDescription 1', 'ProjectDetailt', '2018-06-08'),
							( 5 , 'Project 5', '2006-03-08', 'ProjectDescription 1', 'ProjectDetailt', '2020-03-08'),
							( 5 , 'Project 6', '2004-12-13', 'ProjectDescription 1', 'ProjectDetailt', '2020-02-20'),
							( 7 , 'Project 7', '2001-02-20', 'ProjectDescription 1', 'ProjectDetailt', '2020-02-20'),
							( 6 , 'Project 8', '2003-07-03', 'ProjectDescription 1', 'ProjectDetailt', '2017-09-30'),
							( 9 , 'Project 9', '2002-08-03', 'ProjectDescription 1', 'ProjectDetailt', '2019-08-03'),
							( 8 , 'Project 10','2004-06-09', 'ProjectDescription 1', 'ProjectDetailt', '2017-06-06'),
							( 8 , 'Project 11','2005-06-07', 'ProjectDescription 1', 'ProjectDetailt', '2018-02-12');

-- --------------------------------------------------------------------------------

INSERT INTO		Project_Modules(ProjectID,   EmployeeID,	ProjectModulesDate,  ProjectModulesCompledOn,  ProjectModulesDescription)
VALUES							(2,	3,	'2001-04-06',	'2019-12-03',	'ProjectModulesDescription 1'),
                                (1,	1,	'2003-01-02',	'2019-12-03',	'ProjectModulesDescription 2'),
                                (3,	2,	'2002-09-01',	'2017-12-03',	'ProjectModulesDescription 3'),
                                (5,	2,	'2002-03-15',	'2018-06-08',	'ProjectModulesDescription 4'),
                                (5,	2,	'2002-03-15',	'2021-06-08',	'ProjectModulesDescription 4'),
                                (5,	2,	'2002-03-15',	'2020-06-08',	'ProjectModulesDescription 4'),
                                (4,	4,	'2002-04-02',	'2020-03-08',	'ProjectModulesDescription 5'),
                                (4,	4,	'2002-04-02',	'2020-02-20',	'ProjectModulesDescription 5'),
                                (4,	4,	'2002-04-02',	'2020-02-20',	'ProjectModulesDescription 5'),
                                (4,	4,	'2002-04-02',	'2017-09-30',	'ProjectModulesDescription 5'),
                                (4,	4,	'2002-04-02',	'2019-08-03',	'ProjectModulesDescription 5'),
                                (4,	4,	'2002-04-02',	'2017-06-06',	'ProjectModulesDescription 5'),
                                (4,	4,	'2002-04-02',	'2018-02-12',	'ProjectModulesDescription 5');
-- --------------------------------------------------------------------------------

INSERT INTO   		Work_Done(EmployeeID,  ModuleID, WorkDoneDate, WorkDoneDescription, WorkDoneStatus)                     	
VALUES   						( 3,	1,	'2010-07-03',	'design 1', 'DangTienHanh'),
								( 2,	2,	'2009-10-03',	'design 2',	'DaHoanThanh'),
								( 1,	3,	'2011-12-03',	'design 3',	'DangTienHanh'),
								( 4,	5,	'2010-06-08',	'design 5',	'DaHoanThanh'),
								( 4,	5,	'2012-03-08',	'design 5',	'DangTienHanh'),
								( 4,	5,	'2013-02-20',	'design 5',	'DaHoanThanh'),
								( 4,	5,	'2014-02-20',	'design 5',	'DangTienHanh'),
								( 4,	5,	'2012-09-30',	'design 5',	'NULL'),
								( 4,	5,	'2009-08-03',	'design 5',	'DangTienHanh'),
								( 4,	5,	'2008-06-06',	'design 5',	'DangTienHanh'),
								( 5,	4,	'2011-02-12',	'design 4',	'NULL');


-- --------------------------------------------------------------------------------

-- b) Viết stored procedure (không có parameter) để Remove tất cả thông tin
-- project đã hoàn thành sau 3 tháng kể từ ngày hiện. In số lượng record đã
-- remove từ các table liên quan trong khi removing (dùng lệnh print)
-- --------------------------------------------------------------------------------



DELIMITER $$
CREATE PROCEDURE DeleteProjectCompletedOver3months ()
BEGIN 
DELETE FROM 		Projects
WHERE 				DATE_SUB(now(), INTERVAL 90 DAY )> ProjectCompletedOn;
END$$
DELIMITER ;

CALL DeleteProjectCompletedOver3months;

-- --------------------------------------------------------------------------------
-- Viết stored procedure (có parameter) để in ra các module đang được thực hiện)
-- --------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE 	ModuleWorkingOn ()
BEGIN 		
SELECT		PM.ModuleID
FROM		Project_Modules PM
WHERE 		ProjectModulesCompledOn > NOW();
END$$
DELIMITER ;

CALL ModuleWorkingOn ();

-- --------------------------------------------------------------------------------
-- d) Viết hàm (có parameter) trả về thông tin 1 nhân viên đã tham gia
-- làm mặc dù không ai giao việc cho nhân viên đó (trong bảng Works)
-- --------------------------------------------------------------------------------
SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER $$
CREATE FUNCTION EmpIDinWorkdone () RETURNS SMALLINT
BEGIN
	DECLARE EmpID SMALLINT;
	SELECT 		wd.EmployeeID INTO EmpID   
	FROM		Work_Done wd
	RIGHT JOIN	Project_Modules pm ON pm.EmployeeID = wd.EmployeeID
	WHERE		pm.EmployeeID IS NULL;
    
	RETURN EmpID;
END$$
DELIMITER ;

SELECT EmpIDinWorkdone();

