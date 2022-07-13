package kh.spring.fongdang.funding.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.funding.model.service.FundingService;

@Controller
@RequestMapping("/funding")
public class FundingController {
	@Autowired
	private FundingService service;
	
	/*
	 * @GetMapping("/info") public ModelAndView selectFunding(ModelAndView
	 * mv, @RequestParam("p_no") int p_no) { mv.addObject("funding",
	 * fundingService.selectFunding(p_no)); mv.setViewName("funding/fundingInfo");
	 * 
	 * return mv; }
	 */
	@GetMapping("/info/{p_no}")
	public ModelAndView selectFunding(ModelAndView mv, @PathVariable("p_no") int p_no) {
		mv.addObject("funding", service.selectFunding(p_no));
		mv.setViewName("funding/fundingInfo");
		
		return mv;
	}
	
	@GetMapping("/info/before")
	public ModelAndView selectBeforeFunding(ModelAndView mv,  @RequestParam("p_no") int p_no, HttpSession session) {
		// 로그인 완성 되면 주석 풀고 기능 확인
		// 로그인 여부 확인
//		Member loginInfo = (Member)session.getAttribute("loginSsInfo");
//		if(loginInfo == null) { // 로그아웃 상태일 때
//			mv.addObject("funding", service.selectBeforeFunding(p_no, null));
//		} else {
//			mv.addObject("funding", service.selectBeforeFunding(p_no, loginInfo.getEmail()));
//		}
				
		mv.addObject("funding", service.selectBeforeFunding(p_no, "aaa@aaa.com"));
		mv.setViewName("funding/beforeFundingInfo");
		
		return mv;
	}
	
	@GetMapping("/list")
	public ModelAndView fundinglist(ModelAndView mv) {
		mv.addObject("allProducts", service.selectAllProducts());
		mv.setViewName("funding/fundinglist");
		return mv;
	
	}
	
	@GetMapping("/beforelist")
	public ModelAndView main(ModelAndView mv) {
		mv.addObject("preProducts", service.selectPreProducts());
		mv.setViewName("funding/beforeFundinglist");
		return mv;
	}
	 
}
