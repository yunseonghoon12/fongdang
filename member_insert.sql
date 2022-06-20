desc member;
delete from member;
select * from member;

-- member insert문
insert into member(email, name, password, nickname, member_type) values('admin', '관리자', 'admin', '관리자', 'A');
insert into member(email, name, password, nickname) values('aaa@aaa.com', '홍길동', 'aaa', '홍길동');
insert into member(email, name, password, nickname) values('zya@zya.com', '안지영', 'bbb', '볼빨간사춘기');
insert into member(email, name, password, nickname) values('sjp@sjp.com', '박서준', 'bbb', '쏜절친');
insert into member(email, name, password, nickname) values('wsc@wsc.com', '최우식', 'bbb', '최우서');
insert into member(email, name, password, nickname) values('dmk@dmk.com', '김다미', 'bbb', '마녀1여주');
insert into member(email, name, password, nickname) values('gek@bbb.com', '김고은', 'bbb', '치인트여주');
commit;