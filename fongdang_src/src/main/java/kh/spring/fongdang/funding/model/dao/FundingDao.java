package kh.spring.fongdang.funding.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.funding.domain.Funding;

@Repository
public class FundingDao {
	@Autowired
	private SqlSession session;
	
	public Funding selectFunding(int p_no) {
		Funding result = session.selectOne("Funding.selectFunding", p_no);
		result.setReview_list(session.selectList("Funding.selectFundingReviewList", p_no));

		return result;		
	}
	
	public Funding selectBeforeFunding(int p_no, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("p_no", p_no);
		map.put("email", email);
		
		Funding result = session.selectOne("Funding.selectBeforeFunding", p_no);
		result.setSms(session.selectOne("Funding.selectSms", map));
		
		return result;
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
