-- Insert Examples
USE [A01-School]
GO -- Execute the code up to this point as a single batch

/*  Notes:
    The syntax for the INSERT statement is

    INSERT INTO TableName(Comma, Separated, ListOf, ColumnNames)
    VALUES ('A', 'Value', 'Per', 'Column')

    The line above will insert a single row of data. Typically, this
    syntax is used for hard-coded values.
    To insert multiple rows of hard-coded values, follow this pattern:

    INSERT INTO TableName(Comma, Separated, ListOf, ColumnNames)
    VALUES ('A', 'Value', 'Per', 'Column'),
           ('Another', 'Row', 'Of', 'Values')
    
	when inserting values , you can use subqueires for individual values if returning a single value

	INSERT INTO TableName(Comma, seperated ,line,col)
	VALUES	('A','(SELECT SingleValue FROM SomeTable)','PER','COL')

    Another syntax for the INSERT statement is to use a SELECT clause in place
    of the VALUES clause. This is used for zero-to-many possible rows to insert.

    INSERT INTO TableName(Comma, Separated, ListOf, ColumnNames)
    SELECT First, Second, Third, LastColumn
    FROM   SomeTable
*/

-- Insert Examples
-- 1. Let's add a new course called "Expert SQL". It will be a 90 hour course with a cost of $450.00
INSERT INTO Course(CourseId, CourseName, CourseHours, CourseCost)
VALUES ('DMIT777', 'Expert SQL', 90, 450.00)

-- 2. Let's add a new staff member, someone who's really good at SQL
-- SELECT * FROM STAFF
INSERT INTO Staff(FirstName, LastName, DateHired, PositionID)
SELECT 'Dan', 'Gilleland', GETDATE(), PositionID
       --, PositionDescription
FROM   Position
WHERE  PositionDescription = 'Instructor'
-- 2b. Let's get another instructor
INSERT INTO Staff(FirstName, LastName, DateHired, PositionID)
VALUES ('Shane', 'Bell', GETDATE(), 
        (SELECT PositionID
        FROM   Position
        WHERE  PositionDescription = 'Instructor'))
-- 2.c. We have an open position in the staff.
SELECT  PositionDescription
FROM    Position
WHERE   PositionID NOT IN (SELECT PositionID FROM Staff)
--      Add Sheldon Murray as the new Assistant Dean.
-- TODO: Student Answer Here....
INSERT INTO Staff (FirstName,LastName,DateHired,PositionID)
VALUES ('Sheldon','Murray',GETDATE(),
		(SELECT PositionID
        FROM   Position
        WHERE  PositionDescription = 'Assistant Dean'))
-- 3. There are three additional clubs being started at the school:
--      - START - Small Tech And Research Teams
--      - CALM - Coping And Lifestyle Management
--      - RACE - Rapid Acronym Creation Experts
--    SELECT * FROM Club
INSERT INTO Club(ClubId, ClubName)
VALUES ('START', 'Small Tech And Research Teams'),
       ('CALM', 'Coping And Lifestyle Management'),
       ('RACE', 'Rapid Acronym Creation Experts')

-- ======= Practice ========
-- 4. In your web browser, use https://randomuser.me/ to get information on three
--    people to add as new students. Write separate insert statement for each new student.
-- TODO: Student Answer Here....

INSERT INTO Student(FirstName,LastName,Gender,StreetAddress,City,Province,PostalCode,Birthdate,BalanceOwing)
VALUES ('Neil','Soto','m','9855 W Campbell Ave','Edm','AB','y7t8u9','1967-01-07 00:00:00','400.5'),
		('Rita','Ortiz','f','8894 Nowlin Rd','Edm','AB','r7e9i7','1964-07-11 00:00:00','550.5'),
		('Mark','Lucas','m','687 First Street','Edm','AB','e6f8j6','1988-05-10 00:00:00','660.5')

-- 5. Enroll each of the students you've added into the DMIT777 course.
--    Use 'Dan Gilleland' as the instructor. At this point, their marks should be NULL.
-- TODO: Student Answer Here....
sp_help Registration
INSERT INTO Registration(StudentID,CourseId,Semester,Mark,WithdrawYN,StaffID)
VALUES ((SELECT StudentID FROM Student WHERE FirstName +' ' + LastName = 'Neil Soto' ),'DMIT777', 'spring','20','N',(SELECT StaffID FROM Staff WHERE FirstName + ' '+ LastName = 'Dan Gilleland'))