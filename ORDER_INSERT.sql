SET DEFINE OFF
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 2, 1, 'tlk@tlk.com',(select option_price from "OPTION" where p_no=2 and option_no=1), 1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'aaa@aaa.com', 65800.0,1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'zya@zya.com', 65800.0,1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'sjp@sjp.com', 65800.0,1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'wsc@wsc.com', 65800.0,1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'dmk@dmk.com', 65800.0,1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'gek@bbb.com', 65800.0,1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'mjk@mjk.com', 65800.0,1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'shl@shl.com',65800.0,1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'syl@syl.com', 65800.0,1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 1, 1, 'tlk@tlk.com', 65800.0, 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 3, 1, 'myp@myp.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 2, 2, 'hdn@hdn.com',(select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 2, 3, 'ejb@ejb.com',(select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 2, 4, 'yrk@yrk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 2, 5, 'jwm@jwm.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 4, 1, 'jks@jks.com',  (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 5, 1, 'dsn@dsn.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 6, 1, 'dms@dms.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 7, 1, 'jph@jph.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 8, 1, 'hnk@hnk.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 9, 1, 'csl@csl.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 10, 1, 'dwk@dwk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 11, 1, 'ysk@ysk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 12, 1, 'kws@kws.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 13, 1, 'dongwonkang@dwk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 14, 1, 'jyl@jyl.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 15, 1, 'jel@jel.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 16, 1, 'dsl@dsl.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 17, 1, 'sam@sam.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 18, 1, 'hsc@hsc.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 19, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 20, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 21, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 22, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 23, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 24, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN) 
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 25, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 26, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 27, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 28, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 29, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"),30, 1, 'aaa@aaa.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 31, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 32, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 33, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 34, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 35, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 36, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 37, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 38, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 39, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 40, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 41, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 42, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 43, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 44, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 45, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 45, 2, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 45, 3, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 45, 4, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 56, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 56, 2, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 56, 3, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 56, 4, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 56, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 57, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 58, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 59, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 60, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 61, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 62, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 63, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 64, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 65, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 65, 2, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 65, 3, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 65, 4, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 65, 5, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 66, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 66, 2, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 77, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 88, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 59, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 76, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 76, 2, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 97, 3, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1),1, to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 96, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 96, 2, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 85, 1, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 85, 3, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));
INSERT INTO "ORDER" (ORDER_NO, P_NO, OPTION_NO, EMAIL, TOTAL_PRICE, AMOUNT, PAYMENT_PLAN)
VALUES ((select nvl(max(order_no),0)+1 from "ORDER"), 85, 2, 'tlk@tlk.com', (select option_price from "OPTION" where p_no=2 and option_no=1), 1,to_date('2022.07.23', 'RRRR-MM-DD'));

commit;
