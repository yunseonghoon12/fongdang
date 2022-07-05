package kh.spring.fongdang.funding.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.funding.model.service.ProductService;

@Controller
@RequestMapping("/funding")
public class FundingController {
	@Autowired
	private ProductService service;
	
	@GetMapping("/info")
	public String pageFunding() {
		return "funding/fundingInfo";
	}
	
	@GetMapping("/before/info")
	public String pageBeforeFunding() {
		return "funding/beforeFundingInfo";
	}
	
	@GetMapping("/list")
	public ModelAndView fundinglist(ModelAndView mv) {
		mv.addObject("allProducts",service.selectAllProducts());
		mv.setViewName("funding/fundinglist");
		return mv;
	
	}
	@GetMapping("/beforelist")
	public String pageBeforeFundinglist() {
		return "funding/beforeFundinglist";
	}
	
}
