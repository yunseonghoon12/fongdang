package kh.spring.fongdang.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.admin.model.service.AdminServiceImpl;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminServiceImpl service;
	
	@RequestMapping(value="/memberManagement", method= RequestMethod.GET)
	ModelAndView pageMemberManagement(ModelAndView mv) {
		mv.setViewName("admin/memberManagement");
		return mv;
	}
}
