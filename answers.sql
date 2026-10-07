create database  if not exists education_db;

use education_db;
drop table student;
drop table course;

create table if not exists Course(course_id int auto_increment primary key ,course_name varchar(100) not null unique,duration float,fee int); 

create table if not exists Student(student_id int auto_increment primary key,student_name varchar(100) not null,email varchar(100) unique,age int,gender varchar(100),mark int ,course_id int ,foreign key(course_id)references Course(course_id));

insert into  Course (course_name, duration, fee) values  ('Python Full Stack', 6, 35000),('MERN Stack', 5, 40000),('Data Science', 6, 45000),
('Django', 3, 25000),('Java Full Stack', 6, 38000);


insert into Student (student_name, email, age, gender, mark, course_id) values ('Arun','arun@gmail.com', 21, 'Male', 85, 1),('Meera','meera@gmail.com', 22, 'Female', 92, 2),
('Rahul','rahul@gmail.com', 20, 'Male', 78, 1),('Anjali','anjali@gmail.com', 23, 'Female', 88, 3),('Vishnu','vishnu@gmail.com', 21, 'Male', 74, 4),
('Neha','neha@gmail.com', 22, 'Female', 95, 2),('Amal','amal@gmail.com', 20, 'Male', 81, 5),('Diya','diya@gmail.com', 21, 'Female', 89, 1),
('Rohan','rohan@gmail.com', 24, 'Male', 67, 4),('Fathima','fathima@gmail.com', 22, 'Female', 91, 3);


select * from student where mark >80 order by mark desc;

select min(mark) as minimum_mark,max(mark) as maximum_mark ,avg(mark) as average_mark from student;

select * from student order by mark desc limit 5;

select student_name,mark from student  where age between 18 and 25 order by age;

select course_name,count(student.course_id) as number_of_students from  student join course where student.course_id = course.course_id group by student.course_id;


select course_name from course where course_id in (select course_id from student group by course_id having count(course_id)>2);


select student_name,mark,course_name from student inner join course on student.course_id = course.course_id;

select course_name,student_name from course left join student on course.course_id = student.course_id;


select student_name from student where mark > (select avg(mark) from student);

select student_name,mark,course_name from student join course on student.course_id = course.course_id  where mark = (select max(mark) from student where mark<(select max(mark) from student));
