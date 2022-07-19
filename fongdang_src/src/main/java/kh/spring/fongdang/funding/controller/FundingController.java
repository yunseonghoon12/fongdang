package kh.spring.fongdang.funding.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.funding.domain.Funding;
import kh.spring.fongdang.funding.model.service.FundingService;
import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.pick.domain.Pick;
import kh.spring.fongdang.pick.model.service.PickService;

@Controller
@RequestMapping("/funding")
public class FundingController {
	@Autowired
	private FundingService service;
	
	@Autowired
	private PickService pickService;
	
	private static final Logger logger = LoggerFactory.getLogger(FundingController.class);

//	@GetMapping("/info")
//	public ModelAndView selectFunding(ModelAndView mv, @RequestParam("p_no") int p_no) {
//		mv.addObject("funding", service.selectFunding(p_no));
//		mv.setViewName("funding/fundingInfo");
//
//		return mv;
//	}

	@GetMapping("/info/{p_no}")
	public ModelAndView selectFunding(ModelAndView mv, @PathVariable("p_no") int p_no, HttpSession session) {
		/*sun start*/
		
		Funding funding  = service.selectFunding(p_no);
		mv.addObject("funding", funding);
		Pick pick =new Pick();
		pick.setP_no(p_no);
		Member authInfo = (Member)session.getAttribute("loginInfo");
		if (authInfo != null) {
			pick.setEmail(authInfo.getEmail());
			String pickYn = pickService.selectPick(pick); 
			
			logger.debug("pickYn = " + pickYn);
			if ( pickYn == null) {
				mv.addObject("pick_yn", "N");
				mv.addObject("pick_update_yn", "N");
			}else {
				mv.addObject("pick_yn", pickYn);
				mv.addObject("pick_update_yn", "Y");
			}
			
		}else {
			mv.addObject("pick_yn", "N");
			mv.addObject("pick_update_yn", "N");
		}
		
		mv.addObject("pick_cnt",pickService.countPick(pick));
		mv.setViewName("funding/fundingInfo");
		/*sun end*/
		return mv;
	}

	@GetMapping("/info/before/{p_no}")
	public ModelAndView selectBeforeFunding(ModelAndView mv, @PathVariable("p_no") int p_no, HttpSession session) {
		// 로그인 완성 되면 주석 풀고 기능 확인
		// 로그인 여부 확인
		Member loginInfo = (Member) session.getAttribute("loginInfo");
		if (loginInfo == null) { // 로그아웃 상태일 때
			mv.addObject("funding", service.selectBeforeFunding(p_no, null));
		} else {
			mv.addObject("funding", service.selectBeforeFunding(p_no, loginInfo.getEmail()));
		}

		mv.setViewName("funding/beforeFundingInfo");
		
		return mv;
	}

//	@GetMapping("/info/before")
//	public ModelAndView selectBeforeFunding(ModelAndView mv, @RequestParam("p_no") int p_no, HttpSession session) {
//		// 로그인 완성 되면 주석 풀고 기능 확인
//		// 로그인 여부 확인
//		Member loginInfo = (Member) session.getAttribute("loginSsInfo");
//		if (loginInfo == null) { // 로그아웃 상태일 때
//			mv.addObject("funding", service.selectBeforeFunding(p_no, null));
//		} else {
//			mv.addObject("funding", service.selectBeforeFunding(p_no, loginInfo.getEmail()));
//		}
//
//		mv.addObject("funding", service.selectBeforeFunding(p_no, "aaa@aaa.com"));
//		mv.setViewName("funding/beforeFundingInfo");
//
//		return mv;
//	}

	@ResponseBody
	@PostMapping("/updateApproval")
	public int updateFundingApproval(Funding funding, HttpSession session) {
		// 로그인 여부 확인
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null || !(loginInfo.getMember_type().equals("A"))) { // 로그아웃 상태일 때
			return 0;
		} else {
			if(service.updateFundingApproval(funding) < 1) {
				return -1;
			} else {
				return 1;
			}
		}
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
	@GetMapping("/list/cateC1")
	public ModelAndView fundingCatelist1(ModelAndView mv, String C1) {
		mv.addObject("allProducts",service.selectCateProducts1(C1));
		
		mv.setViewName("funding/fundinglist");
		return mv;
	}
	@GetMapping("/list/cateC2")
	public ModelAndView fundingCatelist2(ModelAndView mv, String C2) {
		mv.addObject("allProducts",service.selectCateProducts2(C2));
		
		mv.setViewName("funding/fundinglist");
		return mv;
	}
	@GetMapping("/list/cateC3")
	public ModelAndView fundingCatelist3(ModelAndView mv, String C3) {
		mv.addObject("allProducts",service.selectCateProducts3(C3));
		
		mv.setViewName("funding/fundinglist");
		return mv;
	}
	@GetMapping("/list/cateC4")
	public ModelAndView fundingCatelist4(ModelAndView mv, String C4) {
		mv.addObject("allProducts",service.selectCateProducts4(C4));
		
		mv.setViewName("funding/fundinglist");
		return mv;
	}
	@GetMapping("/list/cateC5")
	public ModelAndView fundingCatelist5(ModelAndView mv, String C5) {
		mv.addObject("allProducts",service.selectCateProducts5(C5));
		
		mv.setViewName("funding/fundinglist");
		return mv;
	}
	@GetMapping("/list/cateC6")
	public ModelAndView fundingCatelist6(ModelAndView mv, String C6) {
		mv.addObject("allProducts",service.selectCateProducts6(C6));
		
		mv.setViewName("funding/fundinglist");
		return mv;
	}

	@GetMapping("/beforelist/cateC1")
	public ModelAndView fundingCatePrelist1(ModelAndView mv, String C1) {
		mv.addObject("preProducts",service.selectCatePreProducts1(C1));
		
		mv.setViewName("funding/beforeFundinglist");
		return mv;
	}
	@GetMapping("/beforelist/cateC2")
	public ModelAndView fundingCatePrelist2(ModelAndView mv, String C2) {
		mv.addObject("preProducts",service.selectCatePreProducts2(C2));
		
		mv.setViewName("funding/beforeFundinglist");
		return mv;
	}
	@GetMapping("/beforelist/cateC3")
	public ModelAndView fundingCatePrelist3(ModelAndView mv, String C3) {
		mv.addObject("preProducts",service.selectCatePreProducts3(C3));
		
		mv.setViewName("funding/beforeFundinglist");
		return mv;
	}
	@GetMapping("/beforelist/cateC4")
	public ModelAndView fundingCatePrelist4(ModelAndView mv, String C4) {
		mv.addObject("preProducts",service.selectCatePreProducts4(C4));
		
		mv.setViewName("funding/beforeFundinglist");
		return mv;
	}
	@GetMapping("/beforelist/cateC5")
	public ModelAndView fundingCatePrelist5(ModelAndView mv, String C5) {
		mv.addObject("preProducts",service.selectCatePreProducts5(C5));
		
		mv.setViewName("funding/beforeFundinglist");
		return mv;
	}
	@GetMapping("/beforelist/cateC6")
	public ModelAndView fundingCatePrelist6(ModelAndView mv, String C6) {
		mv.addObject("preProducts",service.selectCatePreProducts6(C6));
		
		mv.setViewName("funding/beforeFundinglist");
		return mv;
	}
	
}
