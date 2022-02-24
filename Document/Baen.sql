create database Baendb;
use Baendb;

create table user
(
	uno int primary key auto_increment comment 'ȸ����ȣ',
	uid varchar(100) comment '���̵�',
	upw varchar(100) comment '��й�ȣ',
	uname varchar(50) comment '�̸�',
	ugender varchar(2) comment '����',
	uemail varchar(100) comment '�̸���',
	uadd varchar(100) comment '�ּ�',
	ucell varchar(20) comment '�ڵ�����ȣ'
);

create table board
(
	bno int primary key auto_increment comment '�Խù���ȣ',
	uno int comment 'ȸ����ȣ',
	btitle varchar(200) comment '����',
	bkind varchar(4) comment '����',
	bkindT varchar(4) comment '��Ʈ',
	bkindCP varchar(4) comment 'ķ�ο�ǰ',
	bkindCK varchar(4) comment '����ǰ',
	bkindL varchar(4) comment '����/����',
	bnote text comment '����',
	bwdate datetime default now() comment '�ۼ���',
	bhit int default 0 comment '��ȸ��'
);

create table attach
(
	ano int primary key auto_increment comment '÷�ι�ȣ',
	uno int comment 'ȸ����ȣ',
	bno int comment '�Խù���ȣ',
	pname varchar(255) comment '�������ϸ�',
	fname varchar(255) comment '�����ϸ�'
);

create table reply
(
	rpno int primary key auto_increment comment '��۹�ȣ',
	bno int comment '�Խù���ȣ',
	rpuno int comment '����ۼ��ڹ�ȣ',
	rpnote text comment '��۳���',
	rpdate datetime default now() comment '�ۼ�����'
);

insert into user (uid,upw,uname)
values ('abc','123','ȫ�浿');