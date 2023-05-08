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

