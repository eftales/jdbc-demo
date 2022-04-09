
start transaction;
SET AUTOCOMMIT=0;
commit;


start transaction;
create database if not exists myjdbc;
use myjdbc;

drop table if exists students;
drop table if exists teachers;

create table `teachers` (
    `id` int unsigned auto_increment,
    `name` varchar(10) not null,
    `classname` varchar(20) ,
    `salary` int unsigned not null,

    unique (`id`),
    unique (`name`),

     primary key(`id`,`classname`)
);

create index teachers_name on teachers(`name`);
insert into teachers values (null,'t1','math',100);
insert into teachers values (null,'t2','math',100);
insert into teachers values (5,'t3','math',100);
insert into teachers values (null,'t4','math',100); -- 会自动在上一条记录的基础上 +1
select * from teachers ;

create table `students`(
    `id` int unsigned auto_increment primary key,
    `name` varchar(10) not null unique,
	`classname` varchar(20) not null,
    `score` int unsigned not null,
    `teacherid` int unsigned not null,

    foreign key(`teacherid`, `classname`) references `teachers`(`id`,`classname`) -- 外键必须是其他表的主键
);

create index students_name on students(`name`);

insert into students values (null,'s1','math',100,1);
insert into students values (null,'s2','math',100,2);
insert into students values (null,'s5','math',100,5);
update students set score=500 where  name='s5';
select * from students where score like '1%'; -- like 也可以用在整数类型上
select * from students
order by `name` desc, score;

commit;