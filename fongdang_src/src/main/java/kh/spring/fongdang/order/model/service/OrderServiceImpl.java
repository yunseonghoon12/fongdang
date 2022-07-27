package kh.spring.fongdang.order.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.funding.domain.Product;
import kh.spring.fongdang.option.domain.Option;
import kh.spring.fongdang.order.domain.Order;
import kh.spring.fongdang.order.model.dao.OrderDao;

@Service
public class OrderServiceImpl implements OrderService{

		@Autowired
		private OrderDao dao;
		
		@Override
		public List<Option> selectOrder(int p_no) {
			return dao.selectOrder(p_no);
		}
		
		@Override
		public Product selectProduct(int p_no) {
			return dao.selectProduct(p_no);
		}
		
		@Override
		public int insertOrder(Order order) {
			return dao.insertOrder(order);
		}
}
