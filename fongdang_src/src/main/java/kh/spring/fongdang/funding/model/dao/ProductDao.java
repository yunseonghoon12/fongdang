package kh.spring.fongdang.funding.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.funding.domain.Product;

@Repository
public class ProductDao {

	@Autowired
	private SqlSession sqlSession;
// 상품 등록 (insert)	
	public int insertProduct(Product product) {
		return sqlSession.insert("Product.insertProduct",product);
	}	
	public Product selectOneGetMakerName(String makerName){
		return sqlSession.selectOne("Product.selectOneGetMakerName",makerName);
	}
	public int updateProduct(Product product) {
		return sqlSession.insert("Product.updateProduct",product);
	}
}
