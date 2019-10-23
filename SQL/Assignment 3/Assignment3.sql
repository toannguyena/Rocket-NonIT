-- SQL – Assignment 3 --
-- Exercise 1: Tiếp tục với Database quản lý Fresher--
-- Question 1: Thêm ít nhất 10 bản ghi vào table
-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau
-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau:
-- tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là
-- những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
--  ET_IQ + ET_Gmath>=20
--  ET_IQ>=8
--  ET_Gmath>=8
--  ET_English>=18

-- Question 1: Thêm ít nhất 10 bản ghi vào table

USE fresher;

INSERT INTO trainee
    (`Full_Name`,`Birth_Date`,`Gender`,`ET_IQ`,`ET_Gmath`,`ET_English`,`Training_Class`,`Evaluation_Notes`,`VTI_Accoun`)
VALUES
    ('NGUYEN VAN A',	'19951220',		'male',		20,		15,		18,		'A12',		'A',	'1BC1'),
    ('TRUONG THI A',	'19960606',		'female',	15,		15,		19,		'A02',		'B',	'1BC2'),
    ('NGUYEN VAN B',	'19901221',		'male',		10,		11,		18,		'A12',		'C',	'1BC3'),
    ('NGUYEN VAN C',	'19901221',		'male',		16,		11,		18,		'A09',		'D',	'1BC4'),
    ('TRUONG THI B',	'19960218',		'female',	19,		18,		17,		'A09',		'E',	'1BC5'),
    ('NGUYEN VAN D',	'19921212',		'male',		11,		15,		18,		'A02',		'F',	'1BC6'),
    ('NGUYEN VAN A',	'19930102',		'male',		15,		15,		19,		'A02',		'G',	'1BC7'),
    ('TRUONG THI B',	'19980202',		'female',	20,		15,		18,		'A12',		'H',	'1BC8'),
    ('TRUONG THI C',	'19960101',		'female',	20,		19,		18,		'A1',		'K',	'1BC9'),
    ('NGUYEN VAN A',	'19980202',		'male',		20,		20,		20,		'A12',		'I',	'1Bd1');

-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau

SELECT 		Month (Birth_Date), COUNT(traineeID)
FROM	 	`trainee`
GROUP BY 	MONTH (Birth_Date);

-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là
-- những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
--  ET_IQ + ET_Gmath>=20
--  ET_IQ>=8
--  ET_Gmath>=8
--  ET_English>=18

SELECT		 	*
FROM 			`trainee`
WHERE 			ET_IQ + ET_Gmath>=20 AND ET_IQ>=8 AND ET_Gmath>=8 AND ET_English>=18;

-- Question 5: xóa thực tập sinh có TraineeID = 3 
COMMIT;
DELETE  
FROM 		`trainee`
WHERE 		`TraineeID`=3;

-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database 

UPDATE 		`trainee`
SET 		Training_Class = 'A02'  
WHERE 		TraineeID = 5;







