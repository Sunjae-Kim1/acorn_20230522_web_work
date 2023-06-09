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

create table board_cafe(
	num number primary key,			-- 글 번호
	writer varchar2(100) not null,		-- 작성자 ( 로그인된 아이디 )
	title varchar2(100) not null,		-- 제목
	content clob,							-- 글 내용
	viewCount number,					-- 조회 수
	regdate date							-- 글 작성일
);

-- 게시글의 번호 시퀸스
create sequence board_cafe_seq;

update board_cafe
set viewCount=viewCount+1
where num = 13;