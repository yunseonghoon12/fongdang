package kh.spring.fongdang.funding.model.service;

import java.util.List;

import kh.spring.fongdang.funding.domain.Product;

public interface ProductService {
	
	/* 상품 등록 */
	public void insertProduct(Product product);
	
	/* 펀딩 예정 상품 N개 불러오기*/
	public List<Product> selectPreProducts(int n);
	/* 펀딩 예정 상품 불러오기*/
	public List<Product> selectPreProducts();
	
	/* 펀딩 상품 불러오기*/
	public List<Product> selectAllProducts();
}
