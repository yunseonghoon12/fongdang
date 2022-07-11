package kh.spring.fongdang.admin.model.service;

import java.util.List;

import kh.spring.fongdang.admin.domain.Sales;


public interface AdminService {

	
	/* 펀딩정산 List 조회  */
	public List<Sales> selectSalesLiset();
	
	/* 펀딩정산 상세 N개 조회  */
	public Sales selectOneSales(String pno);
}
