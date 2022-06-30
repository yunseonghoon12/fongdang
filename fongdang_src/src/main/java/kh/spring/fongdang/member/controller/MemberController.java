package kh.spring.fongdang.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.fongdang.member.model.service.MemberServiceImpl;
import kh.spring.fongdang.member.domain.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberServiceImpl service;
	
//	페이지 이동 메서드
	@RequestMapping(value="/login", method= RequestMethod.GET)
	public ModelAndView pageLogin(ModelAndView mv
			, Member member
			, @CookieValue(value="REMEMBER", required= false) Cookie rCookie) {
		if(rCookie != null) {
			member.setEmail(rCookie.getValue());
			member.setRemember_email(true);
		}		
		mv.addObject("member", member);
		mv.setViewName("member/login");
		return mv;
	}
	
	@RequestMapping(value="/findInfo", method= RequestMethod.GET)
	public ModelAndView pageFindInfo(ModelAndView mv) {
		mv.setViewName("member/findInfo");
		return mv;
	}
	
	@RequestMapping(value="/register", method= RequestMethod.GET)
	public ModelAndView pageMemberRegister(ModelAndView mv) {
		mv.setViewName("member/register");
		return mv;
	}
	
	@RequestMapping(value="/registerForm", method= RequestMethod.GET)
	public ModelAndView pageMemberRegisterForm(ModelAndView mv) {
		mv.setViewName("member/registerForm");
		return mv;
	}
	
	@RequestMapping(value="/myfongdang", method= RequestMethod.GET)
	public ModelAndView pageMyInfo(ModelAndView mv) {
		mv.setViewName("member/mypage");
		return mv;
	}
	
	@RequestMapping(value="/myprofile", method= RequestMethod.GET)
	public ModelAndView pageSettupInfo(ModelAndView mv) {
		mv.setViewName("member/myProfile");
		return mv;
	}
	
	@RequestMapping(value="/withdraw", method= RequestMethod.GET)
	public ModelAndView pageMemberWithdraw(ModelAndView mv) {
		mv.setViewName("member/withdraw");
		return mv;
	}
	
	@RequestMapping(value="/messagebox", method= RequestMethod.GET)
	public ModelAndView pageMyMessage(ModelAndView mv) {
		mv.setViewName("member/messagebox");
		return mv;
	}
	
	@RequestMapping(value="/likelist", method= RequestMethod.GET)
	public ModelAndView pageMyFavorite(ModelAndView mv) {
		mv.setViewName("member/favorite");
		return mv;
	}	
	
	
	@RequestMapping(value="/login", method= RequestMethod.POST)
	public ModelAndView selectLogin(ModelAndView mv
			, Member member
			, RedirectAttributes rttr
			, HttpSession session	
			, HttpServletResponse response
			) {		
		// 쿠키 설정
		Cookie rCookie = new Cookie("REMEMBER", member.getEmail());
		rCookie.setPath("/");
		if(member.isRemember_email()) {
			rCookie.setMaxAge(60 * 60 * 24 * 30);
		} else {
			rCookie.setMaxAge(0);
		}
		
		Member result = service.selectLogin(member);
		if(result == null) {
			rttr.addFlashAttribute("msg", "이메일 또는 비밀번호가 일치하지 않습니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		session.setAttribute("loginInfo", result);		
		
		rttr.addFlashAttribute("msg", result.getName()+"님이 로그인 하였습니다.");
		mv.setViewName("redirect:/");
		response.addCookie(rCookie);
		return mv;		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
//		TODO: 메인화면으로 url 지정하기 6.28_yjk
		return "redirect:/";
	}
	
	@RequestMapping(value="/register.do", method= RequestMethod.POST)
	public ModelAndView insertMember(ModelAndView mv
			, @RequestParam(value="chk_agree", defaultValue="false") Boolean agree
			, Member member
			, RedirectAttributes rttr) {				
		
		int result = 0;
		result = service.insertMember(member);
		if(result == 0) {			
			rttr.addFlashAttribute("msg", "회원가입에 실패했습니다.");
			mv.setViewName("redirect:/");
			return mv;
		}
		
		System.out.println("\n---------- insertMember() ----------");
		System.out.println("chk_agree:\t" + agree);
		System.out.println("name:\t\t" + member.getName());
		System.out.println("nickname:\t" + member.getNickname());
		System.out.println("email:\t\t" + member.getEmail());
		System.out.println("password:\t" + member.getPassword());
		System.out.println("------------------------------------");
		rttr.addFlashAttribute("msg", "회원 가입이 완료되었습니다.");
//		TODO: 메인화면으로 url 지정하기 6.28_yjk
		mv.setViewName("redirect:/");
		return mv;		
	}
}
