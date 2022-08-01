package kh.spring.fongdang.guide.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.alarm.model.service.AlarmServiceImpl;
import kh.spring.fongdang.member.domain.Member;

@Controller
@RequestMapping("/guide")
public class GuideController {
	
	@Autowired
	private AlarmServiceImpl alarmservice;
	
	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public ModelAndView guide(ModelAndView mv, HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginInfo");
		if (member != null) {
			String email = member.getEmail();
			mv.addObject("alarm",alarmservice.countAlarm(email));
			}
		
		mv.setViewName("customerCenter/guide");
		return mv;
	}
}
