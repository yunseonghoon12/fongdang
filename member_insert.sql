desc member;
delete from member;
select * from member;

-- member insert문
insert into member(email, name, password, nickname, member_type) values('admin', '김철수', 'admin', '관리자', 'A');
insert into member(email, name, password, nickname) values('aaa@aaa.com', '홍길동', 'aaa', '홍길동');
insert into member(email, name, password, nickname) values('bbb@bbb.com', '안지영', 'bbb', '안지영');
commit;