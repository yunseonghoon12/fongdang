package kh.spring.fongdang.order.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.order.model.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService service;
	
	@PostMapping("/option")
	public ModelAndView selectOrder(ModelAndView mv, @RequestParam("p_no") int p_no, HttpSession session) {
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { // 로그아웃 상태일 때
			
		} else {
			mv.addObject("order",service.selectOrder(p_no));
			mv.setViewName("order/order_option");
		}
		return mv;
		
	}
}	
	/*@PostMapping("/insert")
	public ModelAndView insertOption(ModelAndView mv, HttpSession session) {
		Member member = (Member) session.getAttribute("loginInfo");
		mv.addObject("order",service.insertOrder() );
		mv.setViewName("order/order_option");// jsp페이지
		return mv;
	}*/

