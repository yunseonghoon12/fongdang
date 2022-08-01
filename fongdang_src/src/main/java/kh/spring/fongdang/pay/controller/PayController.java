package kh.spring.fongdang.pay.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.funding.domain.Product;
import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.option.domain.Option;
import kh.spring.fongdang.order.domain.Order;
import kh.spring.fongdang.pay.domain.Pay;
import kh.spring.fongdang.pay.model.service.PayService;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private PayService service;
	
	@PostMapping(value ="/payment")
	public ModelAndView selectPay(ModelAndView mv, Order order, HttpSession session) {
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			System.out.println("비로그인");
			
		}
		order.setEmail(loginInfo.getEmail());
		Option option = service.selectPay(order);
		Product pay = service.selectProduct(order);
		//List<Order> order = service.selectOrder(order);
		mv.addObject("order",order);
		mv.addObject("lol",option);
		mv.addObject("pay", pay);
		mv.setViewName("pay/pay");
		return mv;
	}
	@ResponseBody
	@PostMapping(value = "/pay")
	public int pay(Order order,HttpServletRequest req, HttpSession session) {
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { 
			return 0;
		}else {
			
			return 1;
			
		}
		
	}	
	@ResponseBody
	@PostMapping(value = "/insert")
	public int insertOrder(Pay pay,HttpServletRequest req, HttpSession session) {
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { 
			return 0;
		}else {
			
			int result = service.insertPay(pay);
			if(result < 1) {
				return -1;
			}else {
			return 1;
		}
		}
	}	
}
