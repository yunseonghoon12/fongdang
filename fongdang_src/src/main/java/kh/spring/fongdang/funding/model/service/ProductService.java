package kh.spring.fongdang.funding.model.service;


import kh.spring.fongdang.funding.domain.Product;

public interface ProductService {
	
	/* 상품 등록 */
	public int insertProduct(Product product);
	
	public Product selectOneGetMakerName(String makerName );

	public int updateProduct(Product product);
}
