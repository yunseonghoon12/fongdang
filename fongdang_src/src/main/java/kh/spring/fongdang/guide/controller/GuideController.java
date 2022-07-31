package kh.spring.fongdang.guide.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/guide")
public class GuideController {
	
	
	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public ModelAndView guide(ModelAndView mv, HttpSession session) {
		mv.setViewName("customerCenter/guide");
		return mv;
	}
}
