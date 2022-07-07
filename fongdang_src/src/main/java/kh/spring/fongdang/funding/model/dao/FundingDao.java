package kh.spring.fongdang.funding.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.funding.domain.Funding;
import kh.spring.fongdang.funding.domain.Product;

@Repository
public class FundingDao {
	@Autowired
	private SqlSession session;
	
	public Funding selectFunding(int p_no) {
		Funding result = session.selectOne("Funding.selectFunding", p_no);
		result.setReview_list(session.selectList("Funding.selectFundingReviewList", p_no));

		return result;		
	}
	
	public Funding selectBeforeFunding(int p_no) {
		return session.selectOne("Funding.selectBeforeFunding", p_no);
	}
	
//	오픈 전 상품 N개 불러오기
	public List<Funding> selectPreProducts(int n) {
		return session.selectList("Funding.selectPreProducts",null,new RowBounds(0,n));
	}
//	오픈 전 상품 전부 불러오기
	public List<Funding> selectPreProducts() {
		return session.selectList("Funding.selectPreProducts");
	}

// 상품 리스트 전부 불러오기
	public List<Funding> selectAllProducts() {
		return session.selectList("Funding.selectAllProducts");
	}
	
}
