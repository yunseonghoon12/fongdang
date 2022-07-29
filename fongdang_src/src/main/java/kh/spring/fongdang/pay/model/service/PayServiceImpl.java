package kh.spring.fongdang.pay.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.option.domain.Option;
import kh.spring.fongdang.pay.domain.Pay;
import kh.spring.fongdang.pay.model.dao.PayDao;

@Service
public class PayServiceImpl implements PayService{
	
	@Autowired
	private PayDao dao;
	
	@Override
	public List<Option> selectPay(int order_no) {
		return dao.selectPay(order_no);
	};
	@Override
	public int insertPay(Pay pay) {
		return dao.insertPay(pay);
	};
}
