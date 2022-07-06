package kh.spring.fongdang.funding.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
	
	
//	오픈 전 상품 N개 불러오기
	public List<Product> selectPreProducts(int n) {
		return sqlSession.selectList("Product.selectPreProducts",null,new RowBounds(0,n));
	}

// 상품 리스트 전부 불러오기
	public List<Product> selectAllProducts() {
		return sqlSession.selectList("Product.selectAllProducts");
	}
	 
	
}
