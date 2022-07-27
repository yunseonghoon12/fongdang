package kh.spring.fongdang.ask.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.fongdang.alarm.model.service.AlarmServiceImpl;
import kh.spring.fongdang.ans.model.service.AnsServiceImpl;
import kh.spring.fongdang.ask.domain.Ask;
import kh.spring.fongdang.ask.model.service.AskServiceImpl;
import kh.spring.fongdang.member.domain.Member;

@Controller
@RequestMapping("/customerCenter")
public class AskController {
	@Autowired
	private AskServiceImpl service;
	@Autowired
	private AnsServiceImpl ansservice;
	@Autowired
	private AlarmServiceImpl alarmservice;

	@RequestMapping(value = "/ask", method = RequestMethod.GET)
	public ModelAndView selectAsk(ModelAndView mv, HttpSession session, Ask ask, RedirectAttributes rttr,
			@RequestParam(value="email", required = false) String email) {

		Member member = (Member) session.getAttribute("loginInfo");
		if (member == null) {
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		ask.setEmail(member.getEmail());
		email = ask.getEmail();
		
		mv.addObject("alarm",alarmservice.countAlarm(email));
		mv.addObject("ask", service.selectAsk(email));
		mv.setViewName("customerCenter/ask");
		return mv;
	}

	@RequestMapping(value = "/doAsk", method = RequestMethod.GET)
	public ModelAndView pageDoAsk(ModelAndView mv,HttpSession session) {
		Member member = (Member) session.getAttribute("loginInfo");
		if (member != null) {
			String email = member.getEmail();
			mv.addObject("alarm",alarmservice.countAlarm(email));
			}
		mv.setViewName("customerCenter/doAsk");
		return mv;
	}

	@PostMapping("/doAsk")
	public ModelAndView insertDoAsk(ModelAndView mv, HttpSession session, HttpServletRequest req, Ask ask,
			RedirectAttributes rttr) {

		Member member = (Member) session.getAttribute("loginInfo");

		if (member == null) {
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		int result = service.insertAsk(ask);

		if (result == 0) {
			rttr.addFlashAttribute("msg", "글 등록에 실패하였습니다.");
			mv.setViewName("customerCenter/ask");
			return mv;
		} 

			mv.setViewName("redirect:/customerCenter/ask");
			return mv;
	}
	
	@PostMapping("/deleteAsk.do")
	public ModelAndView deleteAsk(ModelAndView mv, HttpSession session, int ask_no,
			RedirectAttributes rttr) {

		Member member = (Member) session.getAttribute("loginInfo");

		if (member == null) {
			mv.setViewName("redirect:/member/login");
			return mv;
		}

		mv.addObject("deleteAsk",service.deleteAsk(ask_no));
		mv.addObject("deleteAsk",ansservice.deleteAns(ask_no));

		mv.setViewName("redirect:/customerCenter/ask");
		return mv;
	}
	
	@RequestMapping(value = "/road", method = RequestMethod.GET)
	public ModelAndView pageRoad(ModelAndView mv, HttpSession session) {
		Member member = (Member) session.getAttribute("loginInfo");
		if (member != null) {
		String email = member.getEmail();
		mv.addObject("alarm",alarmservice.countAlarm(email));
		}
		mv.setViewName("customerCenter/road");
		return mv;		
	}
	
}