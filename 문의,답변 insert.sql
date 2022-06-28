desc ask;
delete from ask;
select * from ask;

--ASK
INSERT INTO ASK VALUES(NVL(MAX(aks_no), 0) + 1), 'gek@bbb.com', '문의 드립니다','기타','언제배송되나요?', DEFAULT ,DEFAULT);

desc answer;
delete from answer;
select * from answer;

--ANSWER
INSERT INTO ANSWER VALUES(NVL(MAX(aks_no), 0) + 1),29,'안됩니다',DEFAULT);
INSERT INTO ANSWER VALUES(SEQUENCE_ANS_ANS_NO.nextval,30,'내일 도착합니다',DEFAULT);
INSERT INTO ANSWER VALUES(SEQUENCE_ANS_ANS_NO.nextval,31,'내일 도착합니다',DEFAULT);
INSERT INTO ANSWER VALUES(SEQUENCE_ANS_ANS_NO.nextval,32,'취소 해드렸습니다',DEFAULT);
INSERT INTO ANSWER VALUES(SEQUENCE_ANS_ANS_NO.nextval,33,'내일 도착합니다',DEFAULT);
INSERT INTO ANSWER VALUES(SEQUENCE_ANS_ANS_NO.nextval,34,'내일 도착합니다',DEFAULT);