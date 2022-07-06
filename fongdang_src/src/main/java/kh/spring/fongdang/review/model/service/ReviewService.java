package kh.spring.fongdang.review.model.service;

import kh.spring.fongdang.review.domain.Review;

public interface ReviewService {
	public int insertReview(Review review);
	public int updateReview(Review review);
	public int deleteReview(int r_no);
	public int checkOrder(String email, int p_no);
}
