insert into ENROLLMENT (Student_ID,Section_ID,Enroll_Date,Final_Grade)
value
(102,86,1/30/2007,"B"),
(102,89,1/30/2007,"A"),
(103,81,1/30/2007,NULL),
(104,81,1/30/2007,"A"),
(163,92,2/10/2007,NULL),
(223,104,2/16/2007,"C"),
(223,119,2/16/2007,NULL);

insert into SECTION (Section_ID,Course_ID,Course_Section_Name,Start_Date_Time,Location,Instructor_ID,Capacity)
values
(81,20,2,"2007-7-24 9:30:00","L210",103,15),
(86,25,2,"2007-6-10 9:30:00","L210",107,15),
(89,25,5,"2007-5-15 9:30:00","L509",103,25),
(92,25,8,"2007-6-13 9:30:00","L509",106,25),
(104,330,1,"2007-7-14 10:30:00","L511",104,25),
(119,142,1,"2007-7-14 9:30:00","L211",103,25),
(155,122,4,"2007-5-4 9:30:00","L210",107,15);

