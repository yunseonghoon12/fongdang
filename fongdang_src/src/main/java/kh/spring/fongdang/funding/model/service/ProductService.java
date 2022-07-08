package kh.spring.fongdang.funding.model.service;

import java.util.List;

import kh.spring.fongdang.funding.domain.Product;

public interface ProductService {
	
	/* 상품 등록 */
	public int insertProduct(Product product);
	
	public String selectOneGetMakerName(String makerName );

}
