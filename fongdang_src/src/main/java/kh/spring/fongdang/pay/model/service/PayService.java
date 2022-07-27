package kh.spring.fongdang.pay.model.service;

import kh.spring.fongdang.order.domain.Order;
import kh.spring.fongdang.pay.domain.Pay;

public interface PayService {

	public Pay selectPay(Order order);
}
