package kh.spring.fongdang.pay.domain;

import kh.spring.fongdang.order.domain.Order;

public class PaySumCalc {

		public static int PaySumCalc(Order order_no) {
			int totalPrice = order_no.getTotal_price();
			int amount = order_no.getAmount();
			int PaySum = totalPrice * amount + 3000;
			
			return PaySum;
		}
	
}
