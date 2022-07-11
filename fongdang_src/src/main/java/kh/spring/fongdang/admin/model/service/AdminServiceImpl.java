package kh.spring.fongdang.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.admin.domain.Sales;
import kh.spring.fongdang.admin.model.dao.AdminDao;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao dao;

	@Override/* 펀딩정산 List 조회  */
	public List<Sales> selectSalesLiset() {
		return dao.selectSalesLiset();
	}

	@Override
	public Sales selectOneSales(String pno) {
		return dao.selectOneSales(pno);
	}


}
