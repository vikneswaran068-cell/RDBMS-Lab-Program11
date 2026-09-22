-DROP DATABASE IF EXISTS COLLEGEDB;
CREATE DATABASE CollegeDB;
USE CollegeDB;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

CREATE TABLE Enrollment(
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT
);

INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Information Technology');

INSERT INTO Student VALUES
(101, 'Arun', 1),
(102, 'Priya', 2);

INSERT INTO Course VALUES
(201, 'Database Management'),

(202, 'Web Development');

INSERT INTO Enrollment VALUES
(301, 101, 201),
(302, 102, 202);

CREATE VIEW StudentDetails AS
SELECT
    s.StudentName,
    
    c.CourseName,
    d.DepartmentName
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID
JOIN Department d ON s.DepartmentID = d.DepartmentID;
- Lab Program 11
-- Create the StudentDetails view.
--
-- The view must display:
-- StudentName
-- CourseName
-- DepartmentName
--
-- Required view name:
-- StudentDetails

USE CollegeDB;

-- Write your solution below.

