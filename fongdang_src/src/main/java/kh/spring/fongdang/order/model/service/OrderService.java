package kh.spring.fongdang.order.model.service;

import java.util.List;

import kh.spring.fongdang.order.domain.Order;



public interface OrderService {

	
	public List<Order> selectOrder(int p_no);

	
}
