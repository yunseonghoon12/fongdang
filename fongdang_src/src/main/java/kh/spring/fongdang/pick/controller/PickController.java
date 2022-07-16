package kh.spring.fongdang.pick.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.pick.domain.Pick;
import kh.spring.fongdang.pick.model.service.PickService;


@Controller
@RequestMapping("/pick")
public class PickController {
	
	@Autowired
	private PickService service;
	
	
	// pick insert 
	@PostMapping("/input") 
	public ModelAndView inserPick(ModelAndView mv
			,Pick pick
			) {
		int result= service.insertPick(pick);
		mv.setViewName("redirect:/"); //jsp 페이지 펀딩상세조회페이지
		return mv;
	}
	
	// pick delete 
	@PostMapping("/output")
	public ModelAndView delete(ModelAndView mv
			,Pick pick
			,@RequestParam(name = "p_no", required = false) String p_no){
		
		int result= service.deletePick(p_no);
		
		mv.setViewName("redirect:/"); //jsp 페이지 펀딩상세조회페이지
		return mv;
	}
	

}
