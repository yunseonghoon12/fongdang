desc member;
delete from member;
select * from member;

-- member insert문
set define off;

insert into member(email, name, password, nickname, member_type) values('admin', '관리자', 'admin', '관리자', 'A');
insert into member(email, name, password, nickname) values('aaa@aaa.com', '홍길동', 'aaa001', '홍길동');
insert into member(email, name, password, nickname) values('zya@zya.com', '안지영', 'zya002', '볼빨간사춘기');
insert into member(email, name, password, nickname) values('sjp@sjp.com', '박서준', 'sjp003', '쏜절친');
insert into member(email, name, password, nickname) values('wsc@wsc.com', '최우식', 'wsc004', '최우서');
insert into member(email, name, password, nickname) values('dmk@dmk.com', '김다미', 'dmk005', '마녀여주');
insert into member(email, name, password, nickname) values('gek@bbb.com', '김고은', 'gek006', '치인트여주');
insert into member(email, name, password, nickname) values('mjk@mjk.com', '김민준', 'mjk007', '민둥민둥');
insert into member(email, name, password, nickname) values('shl@shl.com', '이서연', 'shl008', '잇어연');
insert into member(email, name, password, nickname) values('syl@syl.com', '이수영', 'syl009', '수영국대');

insert into member(email, name, password, nickname) values('tlk@tlk.com', '김태리', 'tlk010', '태리태리');
insert into member(email, name, password, nickname) values('jhn@jhn.com', '남주혁', 'jhn011', '스타트업남주');
insert into member(email, name, password, nickname) values('myp@myp.com', '박민영', 'myp012', '존예민영');
insert into member(email, name, password, nickname) values('hdn@hdn.com', '나희도', 'hdn013', '펜싱부에이스');
insert into member(email, name, password, nickname) values('ejb@ejb.com', '백이진', 'ejb014', '만화방알바생');
insert into member(email, name, password, nickname) values('yrk@yrk.com', '고유림', 'yrk015', '우주소녀연기자');
insert into member(email, name, password, nickname) values('jwm@jwm.com', '문지웅', 'jwm016', '문지방찧기');
insert into member(email, name, password, nickname) values('swj@swj.com', '지승완', 'swj017', 'DJ완승');
insert into member(email, name, password, nickname) values('jml@jml.com', '이주명', 'jml018', 'YG존예배우');
insert into member(email, name, password, nickname) values('jks@jks.com', '신재경', 'jks019', '보도국장');

insert into member(email, name, password, nickname) values('dsn@dsn.com', '남도산', 'dsn020', 'SW엔지니어');
insert into member(email, name, password, nickname) values('dms@dms.com', '서달미', 'dms021', '경력직신입');
insert into member(email, name, password, nickname) values('jph@jph.com', '한지평', 'jph022', 'SH캐피탈팀장');
insert into member(email, name, password, nickname) values('hnk@hnk.com', '강한나', 'hnk023', '한나강');
insert into member(email, name, password, nickname) values('csl@csl.com', '이철산', 'csl024', '매생이집둘째');
insert into member(email, name, password, nickname) values('dwk@dwk.com', '김도완', 'dwk025', '완도산김');
insert into member(email, name, password, nickname) values('ysk@ysk.com', '김용산', 'ysk026', '도철산듀오리더');
insert into member(email, name, password, nickname) values('kws@kws.com', '송강우', 'kws027', '강우주의보');
insert into member(email, name, password, nickname) values('dongwonkang@dwk.com', '강동원', 'dwk028', '동원훈련엔참치');
insert into member(email, name, password, nickname) values('jel@jel.com', '이지은', 'jel029', '이렇게좋은날');

insert into member(email, name, password, nickname) values('jyl@jyl.com', '이주영', 'jyl030', '라이징스타');
insert into member(email, name, password, nickname) values('dsl@dsl.com', '이동석', 'dsl031', '트럭만물상');
insert into member(email, name, password, nickname) values('sam@sam.com', '민선아', 'sam032', '서울태생주부');
insert into member(email, name, password, nickname) values('hsc@hsc.com', '최한수', 'hsc033', '푸를은행지점장');
insert into member(email, name, password, nickname) values('ehj@ehj.com', '정은희', 'ehj034', '흥많은장사꾼');
insert into member(email, name, password, nickname) values('jmh@jmh.com', '한지민', 'jmh035', '한지민');
insert into member(email, name, password, nickname) values('yol@yol.com', '이영옥', 'yol036', '애기해녀');
insert into member(email, name, password, nickname) values('wbk@wbk.com', '김우빈', 'wbk037', '김우박');
insert into member(email, name, password, nickname) values('jjp@jjp.com', '박정준', 'jjp038', '청년선장');
insert into member(email, name, password, nickname) values('mrk@mrk.com', '고미란', 'mrk039', '미란다');

insert into member(email, name, password, nickname) values('jhp@jhp.com', '박지환', 'jhp040', '매력있는배우');
insert into member(email, name, password, nickname) values('yjc@yjc.com', '최영준', 'yjc041', '발넒은배우');
insert into member(email, name, password, nickname) values('hsb@hsb.com', '배현성', 'hsb042', '전교2등학생');
insert into member(email, name, password, nickname) values('ysb@ysb.com', '배윤서', 'ysb043', '전교3등학생');
insert into member(email, name, password, nickname) values('sgs@sgs.com', '손석구', 'sgs044', '차도남구씨');
insert into member(email, name, password, nickname) values('mjy@mjy.com', '염미정', 'mjy045', '아직미정');
insert into member(email, name, password, nickname) values('jwk@jwk.com', '김지원', 'jwk046', '배우지원');
insert into member(email, name, password, nickname) values('sdm@sdm.com', '마석도', 'sdm047', '도마위의석도');
insert into member(email, name, password, nickname) values('hsk@hsk.com', '강해상', 'hsk048', '과거의구씨');
insert into member(email, name, password, nickname) values('imj@imj.com', '전일만', 'imj049', '10분만더자요');

insert into member(email, name, password, nickname) values('ebp@ebp.com', '박은빈', 'ebp050', '상냥한은빈쌤');
insert into member(email, name, password, nickname) values('sas@sas.com', '신시아', 'sas051', '마녀시즌2여주');
insert into member(email, name, password, nickname) values('eunsus@ess.com', '서은수', 'eunsus052', '22년라이징스타');
insert into member(email, name, password, nickname) values('zingu@zingu.com', '진구', 'zingu053', '진또배기연기란');
insert into member(email, name, password, nickname) values('jsl@naver.com', '이종석', 'jsl054', '주먹만한얼굴');
insert into member(email, name, password, nickname) values('yeonsu1125@ysk.com', '구연수', 'yeonsu055', '국수달인');
insert into member(email, name, password, nickname) values('choe123@choe.com', '최웅', 'choe056', '일러스트레이터');
insert into member(email, name, password, nickname) values('jieung@gmail.com', '김지웅', 'jieung057', '방송국PD');
insert into member(email, name, password, nickname) values('hwj5095@naver.com', '전혜원', 'hwj058', '작가만10년');
insert into member(email, name, password, nickname) values('jinzu5959@naver.com', '박진주', 'jinzu059', '술집사장님');
commit;





