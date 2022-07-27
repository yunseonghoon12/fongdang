package kh.spring.fongdang.pay.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.order.domain.Order;
import kh.spring.fongdang.pay.domain.Pay;
import kh.spring.fongdang.pay.model.dao.PayDao;

@Service
public class PayServiceImpl {
	
	@Autowired
	private PayDao dao;
	
	public Pay selectPay(Order order) {
		return dao.selectPay(order);
	}
}
