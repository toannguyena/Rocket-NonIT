-- Exercise 1: ---
-- Cho table sau:
-- Department (Department_Number, Department_Name)
-- Employee_Table (Employee_Number, Employee_Name,
-- Department_Number)
-- Employee_Skill_Table (Employee_Number, Skill_Code, Date Registered)
-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu

DROP DATABASE IF EXISTS dpm;
CREATE DATABASE IF NOT EXISTS dpm;
USE dpm;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department
(
	Department_Number 							SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Department_Name								NVARCHAR(100) NOT NULL UNIQUE
  );  
  
  DROP TABLE IF EXISTS 		Employee_Table;
  CREATE TABLE 				Employee_Table
  (
	Employee_Number 					SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Employee_Name 						VARCHAR(100) NOT NULL,
	Department_Number 					SMALLINT,
    FOREIGN KEY (Department_Number) REFERENCES Department(Department_Number)
);

DROP TABLE IF EXISTS Employee_Skill_Table;
CREATE TABLE Employee_Skill_Table
(
	Employee_Number 									SMALLINT AUTO_INCREMENT NOT NULL , 
	Skill_Code											VARCHAR(60) NOT NULL, 
	Date_Registered 									DATE NOT NULL,
    FOREIGN KEY (Employee_Number) REFERENCES Employee_Table(Employee_Number)
);



-- Question 2: Thêm ít nhất 10 bản ghi vào table

INSERT INTO		 	Department (Department_Name)
VALUES			    ('Department of State'),
					('Department of the Treasury'),
                    ('Department of Defense'),
                    ('Department of Justice'),
                    ('Department of the Interior'),
                    ('Department of Agriculture'),
                    ('Department of Commerce'), 
                    ('Department of Labor'),
                    ('Department of Energy'),
                    ('White House Chief of Staff'),
                    ('Department of Education');

                    -- Employee_Table (Employee_Name,Department_Number)
INSERT INTO		 	Employee_Table (Employee_Name,Department_Number)
VALUES			    ('john wick 1', 1),
					('john wick 2', 1),
                    ('john wick 3', 5),
                    ('john wick 4', 3),
                    ('john wick 5', 4),
                    ('john wick 6', 7),
                    ('john wick 7', 9), 
                    ('john wick 8', 8),
                    ('john wick 9', 1),
					('john wick 10', 1);
                  
	-- Employee_Skill_Table (Employee_Number, Skill_Code, Date Registered)

INSERT INTO		 	Employee_Skill_Table (Skill_Code, Date_Registered)
VALUES			    ('Java','2000-01-01'),
					('Python','2000-01-02'),
                    ('c','2000-03-03'),
                    ('PHP','2000-03-04'),
                    ('PHP','2000-04-05'),
                    ('Ruby','2000-04-06'),
                    ('SWIFT','2000-04-07'), 
                    ('Javad','2000-05-08'),
                    ('Java','2000-05-09'),
					('Javas','2000-05-01');
                    
-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
-- Hướng dẫn: sử dụng UNION

SELECT 				et.Employee_Number,	et.Employee_Name
FROM 				Employee_Table et
JOIN				Employee_Skill_Table est ON 	et.Employee_Number = est.Employee_Number
WHERE 				est.Skill_Code = 'java';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

SELECT 				et.Department_Number,	d.Department_Name,	COUNT(et.Department_Number)	 AS	 Person
FROM 				Department d
INNER JOIN			Employee_Table et 	ON 	et.Department_Number	=	d.Department_Number
GROUP BY			et.Department_Number
HAVING				COUNT(et.Department_Number)>3;

-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.          
-- Hướng dẫn: sử dụng GROUP B



SELECT 			et.Employee_Name , d.Department_Number , et.Employee_Number
FROM			Department 		d
JOIN			employee_table 	et
ON 				et.Department_Number = d.Department_Number
GROUP BY 		et.Employee_Name , d.Department_Number;



-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.    Hướng dẫn: sử dụng DISTINCT 
 

SELECT 			et.Employee_Number , et.Employee_Name , et.Department_Number , COUNT(est.Employee_Number) AS Employee_Skill_Count
FROM 			Employee_Table	 et
JOIN			Employee_Skill_Table est ON et.Employee_Number = est.Employee_Number
GROUP BY		est.Employee_Number
HAVING			COUNT(est.Employee_Number)>1;


