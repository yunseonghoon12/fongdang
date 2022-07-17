package kh.spring.fongdang.order.model.service;

import java.util.List;

import kh.spring.fongdang.order.domain.Order;



public interface OrderService {

	
	public Order selectOption(int p_no, int option_no);
	

	public List<Order> selectOption();

	
}
