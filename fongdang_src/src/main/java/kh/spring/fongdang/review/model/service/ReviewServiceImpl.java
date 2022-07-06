package kh.spring.fongdang.review.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.review.domain.Review;
import kh.spring.fongdang.review.model.dao.ReviewDao;


@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao dao;
	
	@Override
	public int insertReview(Review review) {
		return dao.insertReview(review);
	}

	@Override
	public int updateReview(Review review) {
		return dao.updateReview(review);
	}

	@Override
	public int deleteReview(int r_no) {
		return dao.deleteReview(r_no);
	}

	@Override
	public int checkOrder(String email, int p_no) {
		return dao.checkOrder(email, p_no);
	}

}
