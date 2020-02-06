/*
	File: SchoolTranscipt
	Author: Jad Yaghi
    CREATE DATABASE SchoolTranscript
*/
USE SchoolTranscript
GO
--Drop Statement
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'StudentCourses')
    DROP TABLE StudentCourses
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Students')
    DROP TABLE Students
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Courses')
    DROP TABLE Courses


--Create Tables
CREATE TABLE Students
(
	StudentID int
	CONSTRAINT PK_Students_StudentID
            PRIMARY KEY	
            IDENTITY (2020001, 1) NOT NULL,
	GivenName varchar(50) NOT NULL,
    Surname varchar(50)
        CONSTRAINT CK_StudentS_Surname 
            CHECK (Surname LIKE '__%')    -- % is a Wildcard for zero or more chara cters, while _ is a wildcard for single character
                                          -- [] are used to represent a range or a set of charaters that are allowed
                                          -- LIKE allows us to do a "pattern-match" of values
    NOT NULL,
    DateofBirth datetime 
        CONSTRAINT CK_Students_DateofBirth
            CHECK (DateofBirth <GETDATE())
    NOT NULL,
    Enrolled bit 
        CONSTRAINT DF_Students_Enrolled
            DEFAULT (1)     NOT NULL

)
CREATE TABLE Courses
(
	Number varchar(10)
	CONSTRAINT PK_Courses_Number
            PRIMARY KEY	 NOT NULL,
	Name varchar(50) NOT NULL,
    Credits decimal(3,1)
        CONSTRAINT CK_Courses_Credits
        CHECK (Credits>0 AND Credits <=6)    NOT NULL,
    [Hours] tinyint 
        CONSTRAINT CK_Courses_Hours
            CHECK ([Hours] BETWEEN 15 AND 180) --BETWEEN operator is inclusive 
            NOT NULL,
    Active bit 
        CONSTRAINT DF_Courses_Active
            DEFAULT(1)    NOT NULL,
    Cost money 
           CONSTRAINT Cost 
            CHECK (Cost >= 0)    
    NOT NULL
)
CREATE TABLE StudentCourses
(
	StudentID int        
        CONSTRAINT FK_StudentCourses_StudentID_Student_StudentID
            FOREIGN KEY REFERENCES 
            Students(StudentID)   NOT NULL,
    CourseNumber varchar(10)        
        CONSTRAINT FK_StudentCourses_CourseNumber_Courses_Number
            FOREIGN KEY REFERENCES
            Courses(Number)   NOT NULL,            
	[Year] tinyint NOT NULL,
    Term char(3) NOT NULL,
    FinalMark tinyint NULL,
    [Status] char(1) 
        CONSTRAINT [Status]
            CHECK ([Status] = 'E' OR [Status] = 'C' OR [Status] = 'W') -- or CHECK ([Status] IN ('E', 'C', 'W'))
                    NOT NULL,
                    --tablelevel constraint for compisite keys
    CONSTRAINT PK_StudentCourses_StudentID_CourseNumber --Table level Constraint  for composite keys
        PRIMARY KEY (StudentID, CourseNumber),
        -- tablelevel constraint involving more then one column
        CONSTRAINT CK_StudentCousres_FinalMark_Status
               CHECK (([Status] = 'C' AND FinalMark IS NOT NULL)
               OR
               ([Status] IN ('E', 'W') AND FinalMark IS NULL))
)

-- for all foriegn keys
    CREATE NONCLUSTERED INDEX IX_StudentCourses_StudentID
    ON StudentCourses(StudentID)

    CREATE NONCLUSTERED INDEX IX_StudentCourses_CourseNumber
    ON StudentCourses(CourseNumber)

    CREATE NONCLUSTERED INDEX TX_Students_Surnames
        ON Students(Surname)


--  Alter Tables statements

--1 Add PostalCode for Students Tables
ALTER TABLE Students
    ADD PostalCode char(6) NULL
    -- Adding this as a nullable column, because students already exist, and we dont have postalcode for those students
GO--Break Above code as a seperate batch
ALTER TABLE Students
    ADD CONSTRAINT CK_Students_PostalCode
        CHECK (PostalCode LIKE '[a-z][0-9][a-z][0-9][a-z][0-9]')-- may be case sensitive, incase do [a-zA-Z]
GO