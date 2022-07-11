package kh.spring.fongdang.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.admin.domain.Sales;

@Repository
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;
	
	
	
	/* 펀딩정산 List 조회  */
	public List<Sales> selectSalesLiset() {
		return sqlSession.selectList("Sales.selectSalesLiset");
	}
	
	/* 펀딩정산 상세 N개 조회  */
	public Sales selectOneSales(String pno) {
		return sqlSession.selectOne("Sales.selectOneSales");
	}
}
