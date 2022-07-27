package kh.spring.fongdang.order.model.service;

import java.util.List;

import kh.spring.fongdang.funding.domain.Product;
import kh.spring.fongdang.option.domain.Option;
import kh.spring.fongdang.order.domain.Order;



public interface OrderService {

	public Product selectProduct(int p_no);
	public List<Option> selectOrder(int p_no);
	public int insertOrder(Order order);
	
}
