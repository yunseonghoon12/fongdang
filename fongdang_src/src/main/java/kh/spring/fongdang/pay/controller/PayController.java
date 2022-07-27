package kh.spring.fongdang.pay.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.order.domain.Order;
import kh.spring.fongdang.pay.model.service.PayService;

@Controller
@RequestMapping("/pay")
public class PayController {
	@Autowired
	private PayService payService;
	
	@PostMapping("/view")
	public ModelAndView selectPay(ModelAndView mv, Order order, HttpSession session) {
		Member loginInfo = (Member)session.getAttribute("lofinInfo");
		if(loginInfo == null) {
			System.out.println("비로그인");
		}
		mv.addObject("pay",payService.selectPay(order));
		mv.setViewName("pay/pay");
		return mv;
	}
}
