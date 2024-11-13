# University Database Project

This project contains a SQL database designed for managing various aspects of a university. It includes tables for departments, courses, professors, students, research projects, and associations for many-to-many relationships.

## Files

- **University_Schema.sql**: Defines the database schema, including tables and constraints.
- **University_Data.sql**: Populates the tables with sample data.

## Database Structure

The database contains the following tables:

1. **Departments**: Manages department details, including the head professor.
   - **DepartmentID** (Primary Key)
   - **DepartmentName**
   - **HeadProfessor** (Foreign Key to **Professors**)

2. **Courses**: Lists available courses by department.
   - **CourseID** (Primary Key)
   - **CourseName**
   - **DepartmentID** (Foreign Key to **Departments**)
   - **ProfessorID** (Foreign Key to **Professors**)

3. **Professors**: Stores professor information, including rank and department association.
   - **ProfessorID** (Primary Key)
   - **FirstName**
   - **LastName**
   - **Gender**
   - **DateOfBirth**
   - **Rank**
   - **DepartmentID** (Foreign Key to **Departments**)
   - **JoinDate**

4. **Students**: Manages student details, including advisor (professor) assignment.
   - **StudentID** (Primary Key)
   - **FirstName**
   - **LastName**
   - **YearOfEnroll**
   - **ProfessorID** (Foreign Key to **Professors**)
   - **DateOfBirth**

5. **ResearchProjects**: Tracks research projects and budgets.
   - **ProjectID** (Primary Key)
   - **ProjectName**
   - **Budget**

6. **StudentsCourses**: Manages the many-to-many relationship between students and courses.
   - **StudentID** (Foreign Key to **Students**)
   - **CourseID** (Foreign Key to **Courses**)
   - Composite Primary Key: **StudentID**, **CourseID**

7. **ProfProjects**: Manages the many-to-many relationship between professors and research projects.
   - **ProfessorID** (Foreign Key to **Professors**)
   - **ProjectID** (Foreign Key to **ResearchProjects**)
   - Composite Primary Key: **ProfessorID**, **ProjectID**

## Relationships

- **One-to-One**: Each department has one head professor (managed via **HeadProfessor** in the **Departments** table).
- **One-to-Many**: Professors can lead multiple research projects.
- **Many-to-Many**: Students can enroll in multiple courses, and professors can be involved in multiple research projects.

## Usage

### Setting Up the Database

1. **Create the Schema**: Run `University_Schema.sql` to set up the tables and constraints.
2. **Insert Data**: Execute `University_Data.sql` to populate tables with sample data.

### Sample Queries

- **Retrieve all students in a department**:
  ```sql
  SELECT s.FirstName, s.LastName
  FROM Students s
  JOIN Departments d ON s.ProfessorID = d.HeadProfessor
  WHERE d.DepartmentName = 'Computer Science';

- **List professors and their research projects:**
    ```sql
    Copy code
    SELECT p.FirstName, p.LastName, r.ProjectName
    FROM Professors p
    JOIN ProfProjects pp ON p.ProfessorID = pp.ProfessorID
    JOIN ResearchProjects r ON pp.ProjectID = r.ProjectID;

### Notes
 - Run the schema file before inserting data to avoid constraint violations.
 - Adjust University_Data.sql to customize the data as needed.