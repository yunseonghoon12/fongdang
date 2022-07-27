package kh.spring.fongdang.order.model.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.funding.domain.Product;
import kh.spring.fongdang.option.domain.Option;
import kh.spring.fongdang.order.domain.Order;


@Repository
public class OrderDao {
	@Autowired
	private SqlSession session;
	
	public List<Option> selectOrder(int p_no) {
		
		List<Option> result = session.selectList("Order.selectOrderOption", p_no);
		
		return result;
	}
	public Product selectProduct(int p_no) {
		return session.selectOne("Order.selectOrderProduct", p_no);
	}
	
	public int insertOrder(Order order) {
		return session.insert("Order.insertOrder",order);
	}
}
