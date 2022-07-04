package kh.spring.fongdang.funding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/funding")
public class FundingController {
	@GetMapping("/info")
	public String pageFunding() {
		return "funding/fundingInfo";
	}
	
	@GetMapping("/before/info")
	public String pageBeforeFunding() {
		return "funding/beforeFundingInfo";
	}
	
	@GetMapping(value = "/list")
	public String pageFundinglist() {
		return "funding/fundinglist";
	}
	@GetMapping("/beforelist")
	public String pageBeforeFundinglist() {
		return "funding/beforeFundinglist";
	}
	
}
