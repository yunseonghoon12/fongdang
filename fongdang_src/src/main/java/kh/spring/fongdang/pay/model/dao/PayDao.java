package kh.spring.fongdang.pay.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.option.domain.Option;
import kh.spring.fongdang.pay.domain.Pay;

@Repository
public class PayDao {
	@Autowired
	private SqlSession session;
	
	public List<Option> selectPay(int order_no) {
		return session.selectList("Pay.selectPay",order_no);
	}
	public int insertPay(Pay pay) {
		return session.insert("Pay.insertPay",pay);
	}
}
