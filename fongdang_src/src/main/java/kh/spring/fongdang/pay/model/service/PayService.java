package kh.spring.fongdang.pay.model.service;

import java.util.List;

import kh.spring.fongdang.funding.domain.Product;
import kh.spring.fongdang.option.domain.Option;
import kh.spring.fongdang.order.domain.Order;
import kh.spring.fongdang.pay.domain.Pay;


public interface PayService {
	public Option selectPay(Order order);
	public Product selectProduct(Order order);
	//public List<Order> selectOrder(int order_no);
	public int insertPay(Pay pay);
}
