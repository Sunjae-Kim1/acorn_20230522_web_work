create table users(
	id varchar2(100) primary key,
	pwd varchar2(100) not null,
	email varchar2(100),
	profile varchar2(100),
	regdate date
);

create table board_file(
	num number primary key,
	writer varchar2(100) not null,
	title varchar2(100) not null,
	orgFileName varchar2(100) not null, -- 원본 파일명
	saveFileName varchar2(100) not null, -- 서버에 저장된 파일명
	fileSize number not null, -- 파일 크기
	regdate date
);

create sequence board_file_seq;