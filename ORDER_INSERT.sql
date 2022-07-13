SET DEFINE OFF
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 2, 1, 'tlk@tlk.com', '홍길동10', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'aaa@aaa.com', '홍길동1', '1011112222', '서울1', 65800.0, to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'zya@zya.com', '홍길동2', '1011112223', '서울2', 65800.0, to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'sjp@sjp.com', '홍길동3', '1011112224', '서울3', 65800.0, to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'wsc@wsc.com', '홍길동4', '1011112225', '서울4', 65800.0, to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'dmk@dmk.com', '홍길동5', '1011112226', '서울5', 65800.0, to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'gek@bbb.com', '홍길동6', '1011112227', '서울6', 65800.0, to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'mjk@mjk.com', '홍길동7', '1011112228', '서울7', 65800.0, to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'shl@shl.com', '홍길동8', '1011112229', '서울8', 65800.0, to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'syl@syl.com', '홍길동9', '1011112230', '서울9', 65800.0, to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'tlk@tlk.com', '홍길동10', '1011112231', '서울10', 65800.0, to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 3, 1, 'myp@myp.com', '홍길동12', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 2, 2, 'hdn@hdn.com', '홍길동13', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 2, 3, 'ejb@ejb.com', '홍길동14', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 2, 4, 'yrk@yrk.com', '홍길동15', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 2, 5, 'jwm@jwm.com', '홍길동16', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 4, 1, 'jks@jks.com', '홍길동19', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 5, 1, 'dsn@dsn.com', '홍길동20', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 6, 1, 'dms@dms.com', '홍길동21', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 7, 1, 'jph@jph.com', '홍길동22', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 8, 1, 'hnk@hnk.com', '홍길동23', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 9, 1, 'csl@csl.com', '홍길동24', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 10, 1, 'dwk@dwk.com', '홍길동25', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 11, 1, 'ysk@ysk.com', '홍길동26', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 12, 1, 'kws@kws.com', '홍길동27', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 13, 1, 'dongwonkang@dwk.com', '홍길동28', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 14, 1, 'jyl@jyl.com', '홍길동29', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 15, 1, 'jel@jel.com', '홍길동30', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 16, 1, 'dsl@dsl.com', '홍길동31', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 17, 1, 'sam@sam.com', '홍길동32', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 18, 1, 'hsc@hsc.com', '홍길동33', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 19, 1, 'tlk@tlk.com', '홍길동34', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 20, 1, 'tlk@tlk.com', '홍길동35', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 21, 1, 'tlk@tlk.com', '홍길동36', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 22, 1, 'tlk@tlk.com', '홍길동37', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 23, 1, 'tlk@tlk.com', '홍길동38', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 24, 1, 'tlk@tlk.com', '홍길동39', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 25, 1, 'tlk@tlk.com', '홍길동40', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 26, 1, 'tlk@tlk.com', '홍길동41', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 27, 1, 'tlk@tlk.com', '홍길동42', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 28, 1, 'tlk@tlk.com', '홍길동43', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 29, 1, 'tlk@tlk.com', '홍길동44', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"),30, 1, 'aaa@aaa.com', '홍길동45', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 31, 1, 'tlk@tlk.com', '홍길동46', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 32, 1, 'tlk@tlk.com', '홍길동47', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 33, 1, 'tlk@tlk.com', '홍길동48', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 34, 1, 'tlk@tlk.com', '홍길동49', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 35, 1, 'tlk@tlk.com', '홍길동50', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 36, 1, 'tlk@tlk.com', '홍길동51', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 37, 1, 'tlk@tlk.com', '홍길동52', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 38, 1, 'tlk@tlk.com', '홍길동53', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 39, 1, 'tlk@tlk.com', '홍길동54', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 40, 1, 'tlk@tlk.com', '홍길동55', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 41, 1, 'tlk@tlk.com', '홍길동66', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 42, 1, 'tlk@tlk.com', '홍길동77', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 43, 1, 'tlk@tlk.com', '홍길동78', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 44, 1, 'tlk@tlk.com', '홍길동79', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 45, 1, 'tlk@tlk.com', '홍길동80', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 45, 2, 'tlk@tlk.com', '홍길동33', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 45, 3, 'tlk@tlk.com', '홍길동44', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 45, 4, 'tlk@tlk.com', '홍길동55', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 56, 1, 'tlk@tlk.com', '홍길동67', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 56, 2, 'tlk@tlk.com', '홍길동87', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 56, 3, 'tlk@tlk.com', '홍길동56', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 56, 4, 'tlk@tlk.com', '홍길동35', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 56, 1, 'tlk@tlk.com', '홍길동87', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 57, 1, 'tlk@tlk.com', '홍길동98', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 58, 1, 'tlk@tlk.com', '홍길동55', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 59, 1, 'tlk@tlk.com', '홍길동47', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 60, 1, 'tlk@tlk.com', '홍길동87', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 61, 1, 'tlk@tlk.com', '홍길동89', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 62, 1, 'tlk@tlk.com', '홍길동90', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 63, 1, 'tlk@tlk.com', '홍길동45', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 64, 1, 'tlk@tlk.com', '홍길동99', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 65, 1, 'tlk@tlk.com', '홍길동46', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 65, 2, 'tlk@tlk.com', '홍길동100', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 65, 3, 'tlk@tlk.com', '홍길동103', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 65, 4, 'tlk@tlk.com', '홍길동104', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 65, 5, 'tlk@tlk.com', '홍길동105', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 66, 1, 'tlk@tlk.com', '홍길동106', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 66, 2, 'tlk@tlk.com', '홍길동107', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 77, 1, 'tlk@tlk.com', '홍길동108', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 88, 1, 'tlk@tlk.com', '홍길동109', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 59, 1, 'tlk@tlk.com', '홍길동110', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 76, 1, 'tlk@tlk.com', '홍길동120', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 76, 2, 'tlk@tlk.com', '홍길동130', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 97, 3, 'tlk@tlk.com', '홍길동140', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 96, 1, 'tlk@tlk.com', '홍길동150', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 96, 2, 'tlk@tlk.com', '홍길동160', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 85, 1, 'tlk@tlk.com', '홍길동170', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 85, 3, 'tlk@tlk.com', '홍길동180', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, ORDER_NAME, ORDER_PHONE, ORDER_ADDRESS, TOTAL_PRICE, PAYMENT_PLAN, PAY_METHOD) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 85, 2, 'tlk@tlk.com', '홍길동190', '1011112231', '서울10', (select option_price from "OPTION" where p_no=2 and option_no=1), to_date('2022.07.23', 'RRRR-MM-DD'), '카드');

commit;