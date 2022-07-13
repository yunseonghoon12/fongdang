package kh.spring.fongdang.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.admin.domain.Sales;
import kh.spring.fongdang.admin.model.service.AdminServiceImpl;



@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminServiceImpl service;
	
	@RequestMapping(value="/", method= RequestMethod.GET)
	ModelAndView pageMemberManagement(ModelAndView mv) {
		mv.setViewName("admin/memberManagement");
		return mv;
	}
	@RequestMapping(value="ask", method= RequestMethod.GET)
	ModelAndView pageAskManagement(ModelAndView mv) {
		mv.setViewName("admin/askManagement");
		return mv;
	}

	@GetMapping("/sales/list")
	public ModelAndView selectSalesLiset(ModelAndView mv) {
		List<Sales> saleslist = service.selectSalesLiset();
		mv.addObject("salesList", saleslist);
	 
		return mv;
	}

	@PostMapping("/sales/read")
    public ModelAndView selectOneSales(ModelAndView mv
    		, @RequestParam(name = "pno", defaultValue = "0") int pno) {
		if (pno == 0) {
			mv.setViewName("redirect:sales/list");
			return mv;
		}
		// DB
		//Sales result = service.selectOneSales(pno);
		//mv.addObject("seles", result);
   
		return mv;
	}
	
	
}
