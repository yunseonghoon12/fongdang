package kh.spring.fongdang.funding.model.dao;

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
	
	public Funding selectBeforeFunding(int p_no) {
		return session.selectOne("Funding.selectBeforeFunding", p_no);
	}
}
