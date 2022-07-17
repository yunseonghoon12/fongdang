package kh.spring.fongdang.order.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.order.model.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService service;
	
	@PostMapping("/option")
	public ModelAndView insertOption(ModelAndView mv,@RequestParam("option_no") int option_no, @RequestParam("p_no") int p_no, HttpSession session) {
		mv.addObject("order",service.selectOption(p_no, option_no));
		mv.setViewName("order/order_option");
		
		return mv;
	}
	
}
