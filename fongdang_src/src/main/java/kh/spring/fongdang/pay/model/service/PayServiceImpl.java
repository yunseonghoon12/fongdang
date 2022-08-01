package kh.spring.fongdang.pay.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.funding.domain.Product;
import kh.spring.fongdang.option.domain.Option;
import kh.spring.fongdang.order.domain.Order;
import kh.spring.fongdang.pay.domain.Pay;
import kh.spring.fongdang.pay.model.dao.PayDao;

@Service
public class PayServiceImpl implements PayService{
	
	@Autowired
	private PayDao dao;
	
	@Override
	public Option selectPay(Order order) {
		return dao.selectPay(order);
	};
/*	@Override
	public List<Order> selectOrder(Order order) {
		return dao.selectOrder(order);
	};*/
	@Override
	public Product selectProduct(Order order){
		return dao.selectProduct(order);
	}
	@Override
	public int insertPay(Pay pay) {
		return dao.insertPay(pay);
	};
}
