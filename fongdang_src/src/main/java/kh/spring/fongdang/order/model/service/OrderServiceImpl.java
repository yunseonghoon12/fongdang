package kh.spring.fongdang.order.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.order.model.dao.OrderDao;
import kh.spring.fongdang.order.domain.Order;

@Service
public class OrderServiceImpl implements OrderService{

		@Autowired
		private OrderDao dao;
		
		@Override
		public List<Order> selectOrder(int p_no) {
			return dao.selectOrder(p_no);
		}

}
