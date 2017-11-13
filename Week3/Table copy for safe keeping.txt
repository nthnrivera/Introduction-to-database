-- Nathan Rivera
-- Week 3 Lab

-- Drop Tables if they exist

set foreign_key_checks = 0;

drop table if exists ZIPCODE;
drop table if exists INSTRUCTOR;
drop table if exists STUDENT;
drop table if exists COURSE;
drop table if exists SECTION;
drop table if exists ENROLLMENT;

set foreign_key_checks = 1;



create table ZIPCODE
(

Zip		integer	(11),
City	VARCHAR	(25)	NOT NULL,
State	CHAR	(2)		NOT NULL,
constraint pk_zip primary key (Zip)
);

create table INSTRUCTOR
(

Instructor_ID		integer(6),
Salutation			varchar(5),
First_Name			varchar(25)	not null,
Last_Name			varchar(25) not null,
Street_Address		varchar(50),
Zip					integer(11) not null,
constraint pk_instructor_id primary key (Instructor_ID)
);




create table STUDENT
(
Student_ID			integer(6),
Salutation			varchar(5),
First_Name			varchar(25)	not null,
Last_Name			varchar(25)	not null,
Street_Address		varchar(50),
Zip					integer(11)	not null,
Phone				varchar(15)	not null,
Employer			varchar(50),
Registration_Date	date		not null,
constraint pk_student_id primary key (Student_ID)
);




create table COURSE
(
Course_ID		integer(6),
Description		varchar(50)	not null,
Cost			decimal(8,2),
-- on the Data Dictionary it says that Prerequisite is a FK however there are no other tables that have this entry so i cannot create a FK for or from it
Prerequisite	integer(6),
constraint pk_course_id primary key (Course_ID)
);



create table SECTION
(
Section_ID			integer(8),
Course_Section_Name	integer(6)	not null,
Start_Date_Time		datetime	not null,
Location			varchar(10),
Capacity			integer(3),
Instructor_ID		integer(6)	not null,
Course_ID			integer(6)	not null,
constraint pk_section_id primary key (Section_ID)
);

create table ENROLLMENT
(
Section_ID	integer(8),
Student_ID 	integer(6),
Enroll_Date	date		not null,
Final_Grade	char(1),
constraint pk_section_id_enrollment primary key (Section_ID, Student_ID)
);

alter table INSTRUCTOR add constraint fk_zip_instructor foreign key (Zip) references ZIPCODE (Zip);
alter table STUDENT add constraint fk_zip_student foreign key (Zip) references ZIPCODE (Zip);
alter table SECTION add constraint fk_instructor_id_section foreign key (Instructor_ID) references INSTRUCTOR (Instructor_ID);
alter table SECTION add constraint fk_course_id_section foreign key (Course_ID) references COURSE (Course_ID);
alter table ENROLLMENT add constraint fk_section_id_enrollment foreign key (Section_ID) references SECTION (Section_ID);


insert into ZIPCODE (Zip,City,State) 
values 
(7024,"Ft. Lee","NJ"),
(7047,"North Bergen","NJ"),
(10005,"New York","NY"),
(10015,"New York","NY"),
(10025,"New York","NY"),
(10035,"New York","NY"),
(11419,"Richmond Hill","NY"),
(11435,"Jamaica","NY");

insert into STUDENT (Student_ID, Salutation, First_Name, Last_Name, Street_Address, Phone, Employer, Registration_Date, Zip) 
values
(102,"Mr.","Fred","Crocitto","101-09 120th St.",718-555-5555,"Albert Hildegard Co.",1/22/2007,11419),
(103,"Ms.","J.","Landry","7435 Boulevard East #45",201-555-5555,"Albert Hildegard Co.",1/22/2007,7047),
(104,"Ms.","Laetia","Enison","144-61 87th Ave",718-555-5555,"Albert Hildegard Co.",1/22/2007,11435),
(105,"Mr.","Angel","Moskowitz","320 John St.",201-555-5555,"Alex. & Alexander",1/22/2007,7024),
(163,"Ms.","Nicole","Gillen","4301 N Ocean #103",904-555-5555,"Oil of America Corp.",2/2/2007,10025),
(223,"Mr.","Frank","Pace","13 Burlington Dr.",203-555-5555,"Board Utilities",2/8/2007,10025),
(399,"Mr.","Jerry","Abdou","460 15th St. #4",718-555-5555,"Health Mgmt.Systems",2/23/2007,10025);

insert into INSTRUCTOR (Instructor_ID, Salutation, First_Name, Last_Name, Street_Address, Zip)
values
(101,"Mr","Fernand","Hanks","100 East 87th",10015),
(102,"Mr","Tom","Wojick","518 West 120th",10025),
(103,"Ms","Nina","Schorin","210 West 101st",10025),
(104,"Mr","Gary","Pertez","34 Sixth Ave",10035),
(105,"Ms","Anita","Morris","34 Maiden Lane",10015),
(106,"Rev","Todd","Smythe","210 West 101st",10025),
(107,"Dr","Marilyn","Frantzen","254 Bleeker",10005);

insert into COURSE (Course_ID,Description,Cost,Prerequisite)
values
(330,"Network Administration",1195,130),
(310,"Operating Systems",1195,NULL),
(142,"Project Management",1195,20),
(140,"Systems Analysis",1195,20),
(130,"Intro to Unix",1195,310),
(25,"Intro to Programming",1195,140),
(20,"Intro to Information Systems",1195,NULL);



Select * from ZIPCODE;

Select * from INSTRUCTOR;

select * from STUDENT;

select * from COURSE;

Select * from SECTION;

Select * from Enrollment;
