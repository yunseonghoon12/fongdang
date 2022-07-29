package kh.spring.fongdang.pay.model.service;

import java.util.List;

import kh.spring.fongdang.option.domain.Option;
import kh.spring.fongdang.pay.domain.Pay;


public interface PayService {
	public List<Option> selectPay(int order_no);
	public int insertPay(Pay pay);
}
