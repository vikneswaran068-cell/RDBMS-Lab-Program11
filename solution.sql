DROP DATABASE IF EXISTS CollegeDB;
CREATE DATABASE CollegeDB;
USE CollegeDB;
 CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);


INSERT INTO Department VALUES (1, 'Computer Science');
INSERT INTO Department VALUES (2, 'Information Technology');
INSERT INTO Department VALUES (3, 'Electronics');


INSERT INTO Student VALUES (101, 'Arun', 1);
INSERT INTO Student VALUES (102, 'Priya', 2);
INSERT INTO Student VALUES (103, 'Rahul', 1);
INSERT INTO Student VALUES (104, 'Divya', 3);

-- Insert sample values into Course
INSERT INTO Course VALUES (201, 'Database Management');
INSERT INTO Course VALUES (202, 'Operating Systems');
INSERT INTO Course VALUES (203, 'Computer Networks');
INSERT INTO Course VALUES (204, 'Web Programming');

-- Insert sample values into Enrollment
INSERT INTO Enrollment VALUES (1, 101, 201);
INSERT INTO Enrollment VALUES (2, 101, 202);
INSERT INTO Enrollment VALUES (3, 102, 204);
INSERT INTO Enrollment VALUES (4, 103, 201);
INSERT INTO Enrollment VALUES (5, 103, 203);
INSERT INTO Enrollment VALUES (6, 104, 203);

CREATE VIEW StudentDetails AS
SELECT
    S.StudentName,
    C.CourseName,
    D.DepartmentName
FROM Student S
JOIN Enrollment E
    ON S.StudentID = E.StudentID
JOIN Course C
    ON E.CourseID = C.CourseID
JOIN Department D
    ON S.DepartmentID = D.DepartmentID;

SELECT * FROM StudentDetails;
