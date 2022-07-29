package kh.spring.fongdang.pay.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.pay.domain.Payment;

@Repository
public class PaymentDao {
	
	@Autowired
	private SqlSession session;
	
	public int insertPayment(Payment pay) {
		return session.insert("Payment.insertPayment",pay);
	}
	
}
