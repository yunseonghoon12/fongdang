package kh.spring.fongdang.pay.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.funding.domain.Product;
import kh.spring.fongdang.option.domain.Option;
import kh.spring.fongdang.order.domain.Order;
import kh.spring.fongdang.pay.domain.Pay;

@Repository
public class PayDao {
	@Autowired
	private SqlSession session;
	
	public Option selectPay(Order order) {
		return session.selectOne("Pay.selectPay",order);
	}
	public Product selectProduct(Order order){
		return session.selectOne("Pay.selectProduct",order);
	}
	/*public List<Order> selectOrder(Order order){
		return session.selectList("Pay.selectOrder",order);
	}*/
	public int insertPay(Pay pay) {
		
		
		return session.insert("Pay.insertPay",pay);
	}
}
