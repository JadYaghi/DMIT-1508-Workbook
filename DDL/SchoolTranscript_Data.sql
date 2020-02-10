/*
    SchoolTranscript_Data.sql
    Jad Yaghi
*/
USE SchoolTranscript
GO

INSERT INTO Students(GivenName, Surname, DateofBirth)-- notice no Enrolled column
VALUES ('Jad', 'Yaghi', '19990611 00:00:000'),
        ('Jod', 'Yoghi', '19870611 04:20:000'),
        ('Jed', 'Yeghi', '19990801 09:30:000'),
        ('Jid', 'Yighi', '20000214 00:00:000'),
        ('Jud', 'Yughi', '18890611 00:11:000')


SELECT * FROM Students

INSERT INTO Courses(Number, [Name], Credits, [Hours],Cost)
VALUES  ('KNIT-1111','Knitting 101','2','20','1000'),
        ('BAKC-2222','Baking for Children','2.5','25','1259'),
        ('BARC-3333','Cheese and You','1','15','700'),
        ('ADSR-4444','Adv Surgery','5','150','2000'),
        ('OHFU-5555','Joke Course','6','180','9999999')
/*        
INSERT INTO Students(Givenname, Surname, DateofBirth)
VALUES ('Dan','G' ,'19720514','10:34:090 PM') - should fail bc of check constraint
*/

SELECT Number, [Name], Credits,[Hours]
FROM Courses
WHERE [Name] LIKE '%Adv%'

SELECT GivenName, Surname,DateofBirth
FROM Students
WHERE Surname LIKE 'Y%'
ORDER BY Surname

DELETE FROM Students