package kh.spring.fongdang.funding.model.service;


import kh.spring.fongdang.funding.domain.Product;

public interface ProductService {
	
	/* 상품 등록 */
	public int insertProduct(Product product);
	
	/* 상품 등록 저장된 내용 조회  */
	public Product selectOneGetMakerName(String makerName );

	/* 상품 등록 수정시 업데이트  */
	public int updateProduct(Product product);
}
