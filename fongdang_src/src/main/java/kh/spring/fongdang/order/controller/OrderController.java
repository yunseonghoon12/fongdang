package kh.spring.fongdang.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.funding.domain.Product;
import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.option.domain.Option;
import kh.spring.fongdang.order.domain.Order;
import kh.spring.fongdang.order.model.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService service;
	
	@GetMapping("/option/{p_no}")
	public ModelAndView selectOrder(ModelAndView mv, @PathVariable("p_no") int p_no, HttpSession session) {
		
		
		
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { 
			 System.out.println("비로그인");
		        
		}
		List<Option> option = service.selectOrder(p_no);
		Product product = service.selectProduct(p_no);
		mv.addObject("order", option);
		mv.addObject("product",product);
		mv.setViewName("order/order_option");
		return mv;
	}
	@ResponseBody
	@PostMapping(value = "/insert")
	public int insertOrder(Order order,HttpServletRequest req, HttpSession session) {
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { 
			return 0;
		}else {
			order.setEmail(loginInfo.getEmail());
			int result = service.insertOrder(order);
			if(result < 1) {
				return -1;
			}else {
			return 1;
		}
		}
	}	
	}
	/*@PostMapping("/insert")
	public ModelAndView insertOption(ModelAndView mv, HttpSession session) {
		Member member = (Member) session.getAttribute("loginInfo");
		mv.addObject("order",service.insertOrder() );
		mv.setViewName("order/order_option");// jsp페이지
		return mv;
	}*/

