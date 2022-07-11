package kh.spring.fongdang.funding.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.funding.model.service.FundingService;
import kh.spring.fongdang.funding.model.service.ProductService;

@Controller
@RequestMapping("/funding")
public class FundingController {
	@Autowired
	private ProductService service;
	@Autowired
	private FundingService fundingService;
	
	/*
	 * @GetMapping("/info") public ModelAndView selectFunding(ModelAndView
	 * mv, @RequestParam("p_no") int p_no) { mv.addObject("funding",
	 * fundingService.selectFunding(p_no)); mv.setViewName("funding/fundingInfo");
	 * 
	 * return mv; }
	 */
	@GetMapping("/info/{p_no}")
	public ModelAndView selectFunding(ModelAndView mv, @PathVariable("p_no") int p_no) {
		mv.addObject("funding", fundingService.selectFunding(p_no));
		mv.setViewName("funding/fundingInfo");
		
		return mv;
	}
	
	@GetMapping("/info/before")
	public ModelAndView selectBeforeFunding(ModelAndView mv,  @RequestParam("p_no") int p_no) {
		mv.addObject("funding", fundingService.selectBeforeFunding(p_no));
		mv.setViewName("funding/beforeFundingInfo");
		
		return mv;
	}
	
	@GetMapping("/list")
	public ModelAndView fundinglist(ModelAndView mv) {
		mv.addObject("allProducts",fundingService.selectAllProducts());
		mv.setViewName("funding/fundinglist");
		return mv;
	
	}
	@GetMapping("/beforelist")
	public ModelAndView main(ModelAndView mv) {
		mv.addObject("preProducts",fundingService.selectPreProducts());
		mv.setViewName("funding/beforeFundinglist");
		return mv;
	}
	 
}
