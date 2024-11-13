use University
Go

-- Insert data into Research_Projects
INSERT INTO ResearchProjects (ProjectID, ProjectName, Budget) VALUES
(50001, 'AI Research in Healthcare', 200000.00),
(50002, 'Renewable Energy Solutions', 150000.00),
(50003, 'Advanced Robotics', 300000.00),
(50004, 'Behavioral Economics', 100000.00),
(50005, 'Environmental Sustainability', 120000.00);

-- Insert data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Electrical Engineering'),
(3, 'Mechanical Engineering'),
(4, 'Business Administration'),
(5, 'Biology');

-- Insert data into Courses
INSERT INTO Courses (CourseID, CourseName, DepartmentID) VALUES
(1001, 'Introduction to Programming', 1),
(1002, 'Data Structures', 1),
(2001, 'Circuit Analysis', 2),
(2002, 'Digital Electronics', 2),
(3001, 'Thermodynamics', 3),
(3002, 'Fluid Mechanics', 3),
(4001, 'Principles of Management', 4),
(5001, 'General Biology', 5);

-- Insert data into Professors
INSERT INTO Professors (ProfessorID, FirstName, LastName, DateOfBirth, Gender, Rank, DepartmentID, JoinDate) VALUES
(101, 'Alice', 'Smith', '1975-05-10', 'F', 'Professor', 1, '2005-08-01'),
(102, 'Bob', 'Johnson', '1968-11-22', 'M', 'Associate Professor', 2, '2003-01-15'),
(103, 'Carol', 'Williams', '1980-07-19', 'F', 'Assistant Professor', 3, '2010-09-10'),
(104, 'David', 'Brown', '1973-03-30', 'M', 'Professor', 4, '2001-06-20'),
(105, 'Eve', 'Davis', '1985-12-05', 'F', 'Lecturer', 5, '2015-01-10');

-- Insert the Head Prof into Departments
Update Departments set HeadProfessor = 101 Where DepartmentID = 1; -- Computer Science
UPDATE Departments SET HeadProfessor = 102 WHERE DepartmentID = 2; -- Electrical Engineering
UPDATE Departments SET HeadProfessor = 103 WHERE DepartmentID = 3; -- Mechanical Engineering
UPDATE Departments SET HeadProfessor = 104 WHERE DepartmentID = 4; -- Business Administration
UPDATE Departments SET HeadProfessor = 105 WHERE DepartmentID = 5; -- Biology

-- Insert data into Students
INSERT INTO Students (StudentID, FirstName, LastName, YearofEnroll, ProfessorID, DateOfBirth) VALUES
(1, 'John', 'Doe', 2018, 101, '2000-04-15'),
(2, 'Jane', 'Smith', 2017, 102, '1999-08-24'),
(3, 'Mike', 'Johnson', 2019, 103, '2001-12-12'),
(4, 'Sara', 'Williams', 2020, 104, '2002-03-09'),
(5, 'Tom', 'Brown', 2018, 105, '2001-05-20');

-- Insert data into StudentsCourses (associative table for many-to-many relationship)
INSERT INTO StudentsCourses (StudentID, CourseID) VALUES
(1, 1001), -- John Doe enrolled in Introduction to Programming
(1, 1002), -- John Doe enrolled in Data Structures
(2, 2001), -- Jane Smith enrolled in Circuit Analysis
(3, 3001), -- Mike Johnson enrolled in Thermodynamics
(4, 4001), -- Sara Williams enrolled in Principles of Management
(5, 5001);  -- Tom Brown enrolled in General Biology

-- Insert data into ProfProjects
INSERT INTO ProfProjects (ProfessorID, ProjectID) VALUES
(101, 50001), -- Alice Smith works on AI Research in Healthcare
(102, 50002), -- Bob Johnson works on Renewable Energy Solutions
(103, 50003), -- Carol Williams works on Advanced Robotics
(104, 50004), -- David Brown works on Behavioral Economics
(105, 50005), -- Eve Davis works on Environmental Sustainability
(101, 50003), -- Alice Smith also works on Advanced Robotics
(102, 50001); -- Bob Johnson also works on AI Research in Healthcare
