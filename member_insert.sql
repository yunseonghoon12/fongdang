desc member;
delete from member;
select * from member;

-- member insert문
insert into member(email, name, password, nickname, member_type) values('admin', '관리자', 'admin', '관리자', 'A');
insert into member(email, name, password, nickname) values('aaa@aaa.com', '홍길동', 'aaaa', '홍길동');
insert into member(email, name, password, nickname) values('zya@zya.com', '안지영', 'bbbb', '볼빨간사춘기');
insert into member(email, name, password, nickname) values('sjp@sjp.com', '박서준', 'cccc', '쏜절친');
insert into member(email, name, password, nickname) values('wsc@wsc.com', '최우식', 'dddd', '최우서');
insert into member(email, name, password, nickname) values('dmk@dmk.com', '김다미', 'eeee', '마녀1여주');
insert into member(email, name, password, nickname) values('gek@bbb.com', '김고은', 'ffff', '치인트여주');
commit;