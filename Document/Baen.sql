create database Baendb;
use Baendb;

create table user
(
	uno int primary key auto_increment comment '회원번호',
	uid varchar(100) comment '아이디',
	upw varchar(100) comment '비밀번호',
	uname varchar(50) comment '이름',
	ugender varchar(2) comment '성별',
	uemail varchar(100) comment '이메일',
	uadd varchar(100) comment '주소',
	ucell varchar(20) comment '핸드폰번호'
);

create table board
(
	bno int primary key auto_increment comment '게시물번호',
	uno int comment '회원번호',
	btitle varchar(200) comment '제목',
	bkind varchar(4) comment '구분',
	bkindT varchar(4) comment '텐트',
	bkindCP varchar(4) comment '캠핑용품',
	bkindCK varchar(4) comment '취사용품',
	bkindL varchar(4) comment '랜턴/램프',
	bnote text comment '내용',
	bwdate datetime default now() comment '작성일',
	bhit int default 0 comment '조회수'
);

create table attach
(
	ano int primary key auto_increment comment '첨부번호',
	uno int comment '회원번호',
	bno int comment '게시물번호',
	pname varchar(255) comment '물리파일명',
	fname varchar(255) comment '논리파일명'
);

create table reply
(
	rpno int primary key auto_increment comment '댓글번호',
	bno int comment '게시물번호',
	rpuno int comment '댓글작성자번호',
	rpnote text comment '댓글내용',
	rpdate datetime default now() comment '작성일자'
);

insert into user (uid,upw,uname)
values ('abc','123','홍길동');