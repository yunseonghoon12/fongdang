package kh.spring.fongdang.pay.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.pay.domain.Payment;
import kh.spring.fongdang.pay.model.dao.PaymentDao;

@Service
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	private PaymentDao dao;
	
	@Override
	public int insertPayment(Payment pay) {
		return dao.insertPayment(pay);
	}
}
