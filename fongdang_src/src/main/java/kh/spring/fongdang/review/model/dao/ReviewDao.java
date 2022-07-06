package kh.spring.fongdang.review.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.review.domain.Review;


@Repository
public class ReviewDao {
	@Autowired
	private SqlSession session;
	
	public int insertReview(Review review) {
		return session.insert("Review.insertReview", review);
	}
	
	public int updateReview(Review review) {
		return session.update("Review.updateReview", review);
	}
	
	public int deleteReview(int r_no) {
		return session.delete("Review.deleteReview", r_no);
	}
	
	public int checkOrder(String email, int p_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("p_no", p_no);
		
		return session.selectOne("Review.checkOrder", map);
	}
}
