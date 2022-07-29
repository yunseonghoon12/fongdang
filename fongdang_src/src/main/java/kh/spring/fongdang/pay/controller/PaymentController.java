package kh.spring.fongdang.pay.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.fongdang.pay.domain.Payment;
import kh.spring.fongdang.pay.model.service.PaymentService;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@Autowired
	private PaymentService service;
	
	@PostMapping("/pay")
	public ModelAndView insertPayment(ModelAndView mv, HttpSession session, HttpServletRequest req, Payment pay, RedirectAttributes rttr) {
		int result = service.insertPayment(pay);
		if(result == 0) {
			rttr.addFlashAttribute("msg","메롱");
			mv.setViewName("pay/payment");
			return mv;
		}
		mv.setViewName("redirect:/pay/payment");
		return mv;
	}
}
