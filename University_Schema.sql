-- Create the University database
Create Database University
Go 

Use University
GO

-- Create Departments table
Create Table Departments (
    DepartmentID   int         CONSTRAINT [PK_Departments] Primary Key, -- Unique identifier for each department 
    DepartmentName varchar(25) NOT NULL,
    HeadProfessor  int -- ID of the professor heading the department (Foreign Key)
)
Go 

-- Create Courses table
Create Table Courses (
    CourseID     int         CONSTRAINT [PK_Courses] Primary Key, -- Unique identifier for each course
    CourseName   varchar(50) NOT NULL, 
    DepartmentID int, -- Foreign key to Departments 
    ProfessorID  int -- Foreign key to Professors
)
GO

-- Create Professors table
Create Table Professors (
    ProfessorID  int         CONSTRAINT [PK_Prof] Primary Key, -- Unique identifier for each professor
    FirstName    varchar(30) NOT NULL,
    LastName     varchar(30) NOT NULL,
    Gender       varchar(1)  CONSTRAINT Check_Gender CHECK (Gender IN ('M', 'F')), -- Gender with CHECK constraint for 'M' or 'F'
    DateOfBirth  date, 
    DepartmentID int, -- Foreign key to Departments
    JoinDate     date -- Date the professor joined the university
)
GO

-- Create Students table
Create Table Students (
    StudentID    int         CONSTRAINT [PK_Student] Primary Key, -- Unique identifier for each student
    FirstName    varchar(30) NOT NULL,
    LastName     varchar(30) NOT NULL,
    YearofEnroll int         NOT NULL, 
    ProfessorID  int -- Foreign key to Professors table
)
GO

-- Create ResearchProjects table 
Create Table ResearchProjects (
    ProjectID   int            CONSTRAINT [PK_Projects] Primary Key, -- Unique identifier for each project
    ProjectName varchar(50)    NOT NULL, 
    Budget      decimal(15, 2)
)
GO

-- Create table for many-to-many relationship between Students and Courses
Create Table StudentsCourses (
    StudentID int CONSTRAINT [FK_students] Foreign Key REFERENCES Students(StudentID), -- Foreign key to Students
    CourseID  int CONSTRAINT [FK_Courses]  Foreign Key REFERENCES Courses(CourseID), -- Foreign key to Courses
    CONSTRAINT [PK_SC] Primary Key (StudentID, CourseID) -- Composite primary key on both StudentID and CourseID
)
GO

-- Create table for many-to-many relationship between Professors and ResearchProjects
Create Table ProfProjects (
    ProjectID   int CONSTRAINT [FK_Projects]  Foreign Key REFERENCES ResearchProjects(ProjectID), -- Foreign key to Projects
    ProfessorID int CONSTRAINT [FK_Professors] Foreign Key REFERENCES Professors(ProfessorID), -- Foreign key to Professors
    CONSTRAINT [PK_PP] Primary Key (ProjectID, ProfessorID) -- Composite primary key on both ProjectID and ProfessorID
)
GO

-- Adding a foreign key to the Departments table to link each department's HeadProfessor to the Professors table
Alter Table Departments ADD Constraint [FK_HeadProf] Foreign Key (HeadProfessor)
REFERENCES Professors(ProfessorID)
GO

-- Adding a foreign key to the Courses table to link each course to the professors table
Alter Table Courses ADD Constraint [FK_Associates] Foreign Key (ProfessorID) 
REFERENCES Professors(ProfessorID)
GO

-- Adding a foreign key to the Courses table to associate each course with a department
Alter Table Courses ADD Constraint [FK_DepartmentCourse] Foreign Key (DepartmentID) 
REFERENCES Departments(DepartmentID)
GO

-- Adding a foreign key to the Professors table to link each professor to a department
Alter Table Professors ADD Constraint [FK_DepProfessor] Foreign Key (DepartmentID) 
REFERENCES Departments(DepartmentID)
GO

-- Adding a foreign key to the Students table to link each student to their advising professor
Alter Table Students ADD Constraint [FK_Adviser] Foreign Key (ProfessorID) 
REFERENCES Professors(ProfessorID)
GO

-- Adding a new column 'Rank' to the Professors table to store the rank of the professor (Assistant, Associate, Full Professor)
Alter Table Professors ADD Rank char(50)
GO

-- Adding a new column 'Date of birth' to the Students table
Alter table Students Add DateOfBirth date
