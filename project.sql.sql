CREATE DATABASE ThesisManagement;

-- Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
	roll VARCHAR(100) NOT NULL,
    department VARCHAR(100),
	contact VARCHAR(100) NOT NULL,
    thesis_id INT UNIQUE
);

-- Advisors Table
CREATE TABLE Advisors (
    advisor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
	contact VARCHAR(100) NOT NULL,
    department VARCHAR(100)
);

-- Thesis Table
CREATE TABLE Thesis (
    thesis_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    abstract TEXT,
    status ENUM('Pending', 'Approved', 'Rejected'),
	submission_date DATE,
    student_id INT UNIQUE,
    advisor_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id), 
    FOREIGN KEY (advisor_id) REFERENCES Advisors(advisor_id)
);

-- CommitteeMembers Table
CREATE TABLE CommitteeMembers (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
	contact VARCHAR(100) NOT NULL,
	thesis_id INT,
	FOREIGN KEY (thesis_id) REFERENCES Thesis(thesis_id)
);

-- ProgressReports Table
CREATE TABLE ProgressReports (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
	progress_notes TEXT,
    submission_date DATE,
    thesis_id INT,
    FOREIGN KEY (thesis_id) REFERENCES Thesis(thesis_id) 
);
--Inserting SAMPLE DATA
INSERT INTO Students (student_id, name, email, roll, contact, department,thesis_id)
VALUES (NULL, 'Md Shohan', 'sahunshohan@gmail.com', '20-PHY-069','01738661570','Physics', 1),
 (NULL, 'Sakib', 'sakib@gmail.com', '20-PHY-10','01765432845','Physics', 2),
 (NULL, 'Nayon', 'nayon@gmail.com', '20-PHY-45', '01567423834', 'Physics', 3),
 (NULL, 'Al Amin','alamin@gmail.com',	'20-PHY-30','01367282883','Physics', 4),
 (NULL, 'Sabbir',	'sabbir@gmail.com',	'20-PHY-24','01745678722','Physics', 5);
 
INSERT INTO Advisors (advisor_id, name, email, contact, department)
VALUES (NULL, 'Dr Md Mahfuz Alam',	'mahfuzalam@gmail.com',	'01789534536','Physics'),
 (NULL, 'Dr Md Khorshed Alam','khorshedalam@gmail.com','01567682882',	'Physics'),
 (NULL, 'Dr Md Lokman Hossain',	'lokmanhossain@gmail.com',	'01767682882',	'Physics');
 
INSERT INTO Thesis (thesis_id, title, abstract, status, student_id, advisor_id, submission_date)
VALUES (1,'Semiconductor device','This research focuses on the design, fabrication, and performance analysis 
of a novel semiconductor device aimed at improving efficiency and reliability', 'Pending',	1,1,'2025-01-26'),
 (2, 'Electromagnetism','This thesis explores key principles of electromagnetism, including Maxwell’s
 equations, electromagnetic wave propagation, and their applications in modern technology',	'Pending', 2,2,'2025-01-23'),
  (3, 'Astrophysics', 'This thesis investigates [specific topic], using observational data and theoretical 
 modeling to explore [key research focus]',	'Approved',	3,2,'2025-01-20'),
  (4, 'Quantum Computing',	'Quantum computing is an emerging field that leverages the principles of quantum mechanics
 to perform computations beyond the capabilities of classical computers', 'Approved',4,	3,'2025-01-24'),
  (5, 'Biomedical Physics','Biomedical physics is an interdisciplinary field that applies principles of physics to
 biological and medical sciences.This field plays a crucial role in advancing medical diagnostics',	'Rejected',	5,3,'2025-01-19');
 
 INSERT INTO CommitteeMembers (member_id, name, email, contact, thesis_id)
 VALUES (NULL, 'Asaduzzman','asad@gmail.com','01757357352',	 1),
 (NULL, 'Asaduzzman','asad@gmail.com','01557357352', 2),
 (NULL, 'Arif',	'arif@gmail.com','01357357352',	3),
 (NULL, 'Kamrul','kamrul@gmail.com','01547357352', 4),
 (NULL, 'Kamrul','kamrul@gmail.com','01767357352', 5);
 
 INSERT INTO ProgressReports (report_id, progress_notes, submission_date, thesis_id) 
 VALUES (NULL, 'Completed initial simulations for device performance analysis','2025-01-29', 1),
 (NULL, 'performance nearly excellent','2025-01-29', 1),
 (NULL,  'Magnet produced by initial simulations', '2025-01-30', 2),
 (NULL,   'performance nearly good', '2025-01-30', 2),
 (NULL, 'Completed initial simulations for experimental analysis','2025-01-31',	3),
 (NULL, 'performance nearly bad','2025-02-01', 4),
 (NULL, 'Established experimental setup for [experiment/simulation]','2025-02-03', 5);
