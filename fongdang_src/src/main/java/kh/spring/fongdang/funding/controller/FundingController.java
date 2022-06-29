package kh.spring.fongdang.funding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
