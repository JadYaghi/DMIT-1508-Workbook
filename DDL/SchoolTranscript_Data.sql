/*
    SchoolTranscript_Data.sql
    Jad Yaghi
*/
USE SchoolTranscript
GO

INSERT INTO Students(StudentID,GivenName, Surname, DateofBirth)
VALUES (123456, 'Jad', 'Yaghi', '19990611 00:00:000')

SELECT * FROM Students