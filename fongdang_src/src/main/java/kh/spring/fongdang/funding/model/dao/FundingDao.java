package kh.spring.fongdang.funding.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	//	목표 % 상위 N개 불러오기
	public List<Funding> selectRankProducts(int n) {
		return session.selectList("Funding.selectRankProducts",null,new RowBounds(0,n));
	}
	//	리펀딩상품 N개 불러오기
	public List<Funding> reFundingProducts(int n) {
		return session.selectList("Funding.reFundingProducts",null,new RowBounds(0,n));
	}
	//	기간 만료상품 N개 불러오기
	public List<Funding> endProducts(int n) {
		return session.selectList("Funding.endProducts",null,new RowBounds(0,n));
	}
	//	BEST상품 N개 불러오기
	public List<Funding> bestProducts(int n) {
		return session.selectList("Funding.bestProducts",null,new RowBounds(0,n));
	}
	
	//	오픈 전 상품 전부 불러오기
	public List<Funding> selectPreProducts() {
		return session.selectList("Funding.selectPreProducts");
	}

	// 상품 리스트 전부 불러오기
	public List<Funding> selectAllProducts(Map<String, String> map) {
		return session.selectList("Funding.selectAllProducts", map);
	}
	
	// 상품 카테고리 불러오기
	public List<Funding> selectCateProducts1(String C1) {
		return session.selectList("Funding.selectCateProducts1",C1);
	}
	public List<Funding> selectCateProducts2(String C2) {
		return session.selectList("Funding.selectCateProducts2",C2);
	}
	public List<Funding> selectCateProducts3(String C3) {
		return session.selectList("Funding.selectCateProducts3",C3);
	}
	public List<Funding> selectCateProducts4(String C4) {
		return session.selectList("Funding.selectCateProducts4",C4);
	}
	public List<Funding> selectCateProducts5(String C5) {
		return session.selectList("Funding.selectCateProducts5",C5);
	}
	public List<Funding> selectCateProducts6(String C6) {
		return session.selectList("Funding.selectCateProducts6",C6);
	}
	
	// 예정상품 카테고리 불러오기
	public List<Funding> selectCatePreProducts1(String C1) {
		return session.selectList("Funding.selectCatePreProducts1",C1);
	}
	public List<Funding> selectCatePreProducts2(String C2) {
		return session.selectList("Funding.selectCatePreProducts2",C2);
	}
	public List<Funding> selectCatePreProducts3(String C3) {
		return session.selectList("Funding.selectCatePreProducts3",C3);
	}
	public List<Funding> selectCatePreProducts4(String C4) {
		return session.selectList("Funding.selectCatePreProducts4",C4);
	}
	public List<Funding> selectCatePreProducts5(String C5) {
		return session.selectList("Funding.selectCatePreProducts5",C5);
	}
	public List<Funding> selectCatePreProducts6(String C6) {
		return session.selectList("Funding.selectCatePreProducts6",C6);
	}

	/* 상품 카테고리 검색하기 */
	public List<Funding> selectSearchList(String search_category) {
		return session.selectList("Funding.selectSearchList",search_category);
	}

	
	
	
	public int updateFundingApproval(Funding funding) {
		return session.update("Funding.updateFundingApproval", funding);
	}
	
	public int countApprovalList() {
		return session.selectOne("Funding.countApprovalList");
	}
	
	public List<Funding> selectApprovalList(int startRnum, int endRnum) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRnum", startRnum);
		map.put("endRnum", endRnum);
		
		return session.selectList("Funding.selectApprovalList", map);
	}
}
