package kh.spring.fongdang.option.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.option.domain.Option;
import kh.spring.fongdang.option.model.service.OptionServiceImpl;

@Controller
@RequestMapping("/option")
public class OptionController {
	@Autowired
	private OptionServiceImpl service;

	// Option page 이동
	@GetMapping("/option.pag")
	public ModelAndView insertPageOption(ModelAndView mv) {
		mv.setViewName("option/option");// jsp페이지
		return mv;
	}

	// Option insert
	@PostMapping("/option.do")
	public ModelAndView inserOption(ModelAndView mv
			,Option option
			) {

		
		int result = service.insertOption(option);// DB 인설트 
		mv.setViewName("redirect:/");// 메인
		return mv;
	}

}
