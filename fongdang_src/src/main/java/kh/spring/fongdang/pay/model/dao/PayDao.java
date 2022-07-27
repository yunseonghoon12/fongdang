package kh.spring.fongdang.pay.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.order.domain.Order;
import kh.spring.fongdang.pay.domain.Pay;

@Repository
public class PayDao {
	@Autowired
	private SqlSession session;
	
	public Pay selectPay(Order order) {
		Pay pay = session.selectOne("Pay.selectPay",order);
		return pay;
	}
	
}
