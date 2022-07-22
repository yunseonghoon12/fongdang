package kh.spring.fongdang;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.funding.model.service.FundingService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private FundingService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView main(ModelAndView mv) {
		mv.addObject("preProducts",service.selectPreProducts(6));
		mv.addObject("rankProducts",service.selectRankProducts(5));
		mv.addObject("reFundingProducts",service.reFundingProducts(3));
		mv.addObject("endProducts",service.endProducts(3));
		mv.addObject("bestProducts",service.bestProducts(3));

		//mv.addObject("todo", "다른 목록들");
		mv.setViewName("main");
		return mv;
	}
}
