CREATE DATABASE Quanlysinhvien;
USE quanlysinhvien;

create table Class (
ClassId int not null auto_increment primary key,
ClassName varchar(60) not null,
StatusDate datetime not null,
status bit
);

create table Student (
StudentId int not null auto_increment primary key,
StudentName varchar(30) not null,
Address varchar(50),
Phone varchar(20),
status bit,
ClassId int not null,
foreign key (ClassId) references Class(ClassId)
);

create table Subject (
SubId int not null auto_increment primary key,
SubName varchar(30) not null,
Credit tinyint not null default(1) check (Credit >=1),
status bit
);

create table Mark (
MarkId int not null auto_increment primary key,
SubId int not null,
StudentId int not null,
Mark float default 0 check (Mark between 0 and 100),
ExamTimes tinyint default (1),
unique (SubId, StudentId),
foreign key (SubId) references Subject (SubId),
foreign key (StudentId) references Student (StudentId)
);

INSERT INTO Class 
VALUES 
	(1, 'A1', '2008-12-20', 1), 
	(2, 'A2', '2008-12-22', 1), 
	(3, 'B3', current_date, 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId) 
VALUES  ('Hung', 'Ha Noi', '0912113113', 1, 1),
		('Hoa', 'Hai phong', '09772221', 1, 1),
		('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES	(1, 1, 8, 1),
		(1, 2, 10, 2),
        (2, 1, 12, 1);