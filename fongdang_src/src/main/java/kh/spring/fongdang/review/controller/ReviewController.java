package kh.spring.fongdang.review.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.review.domain.Review;
import kh.spring.fongdang.review.model.service.ReviewService;


@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	private ReviewService service;

	@ResponseBody
	@PostMapping("/insert")
	public int insertReview(Review review, HttpSession session) {
		// 로그인 여부 확인
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { // 로그아웃 상태일 때
			return 0;
		} else {
			if(service.checkOrder(loginInfo.getEmail(), review.getP_no()) < 1) { //해당 상품에 대한 구매 여부 확인
				return 2;
			} else {
				review.setR_writer(loginInfo.getNickname());
				review.setProfile(loginInfo.getProfile());
				
				if(service.insertReview(review) < 1) {
					return -1;
				} else {
					return 1;
				}
			}
		}
		
//		if(service.checkOrder("aaa@aaa.com", review.getP_no()) < 1) {
//			return 2;
//		} else {
//			review.setR_writer("홍길동");
//			review.setProfile(null);
//			
//			return service.insertReview(review);
//		}
	}
	
	@ResponseBody
	@PostMapping("/update")
	public int updateReview(Review review, HttpSession session) {
		// 로그인 여부 확인
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { // 로그아웃 상태일 때
			return 0;
		} else {
			if(service.updateReview(review) < 1) {
				return -1;
			} else {
				return 1;
			}
		}
		
//		return service.updateReview(review);
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public int deleteReview(@RequestParam("r_no") int r_no, HttpSession session) {
		// 로그인 여부 확인
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { // 로그아웃 상태일 때
			return 0;
		} else {
			if(service.deleteReview(r_no) < 1) {
				return -1;
			} else {
				return 1;
			}
		}
		
//		return service.deleteReview(r_no);
	}
}
