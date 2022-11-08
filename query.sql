set sql_safe_updates = 1;

-- create table --
CREATE TABLE `login` (
  `id` varchar(20) NOT NULL,
  `pw` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `post` (
  `num` int NOT NULL,
  `textTitle` varchar(45) DEFAULT NULL,
  `textWriting` varchar(500) DEFAULT NULL,
  `textDate` datetime DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `author` (`author`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`author`) REFERENCES `login` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table post (
	id int,
	textTitle varchar(45),
    textWriting varchar(500),
    textDate datetime,
    author varchar(20),
    primary key (id),
    foreign key (author) references login(id)
);

-- alter table --
alter table post change column id num int;
alter table login add `admin` int default 0;

-- insert values --
	-- 유저 추가 --
insert into login (id, pw, `name`, `admin`) 
	values('admin', 'admin', 'admin', 1);
	
    -- 게시물 추가 -- 
insert into post (num, textTitle, textWriting, textDate, author) 
	values(1, 'example title', 'example writing', curdate(), 'admin');
    
    
-- update values --
	-- 유저 정보 수정 --
update login set `admin` = 1 where id = 'admin';

    
-- select --
select * from login;
select  * from post;