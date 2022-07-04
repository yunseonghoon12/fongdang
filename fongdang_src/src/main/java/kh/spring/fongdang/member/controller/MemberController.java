package kh.spring.fongdang.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.fongdang.member.model.service.MemberServiceImpl;
import kh.spring.fongdang.common.FileUpload;
import kh.spring.fongdang.member.domain.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberServiceImpl service;
	@Autowired 
	private FileUpload commonfile; 
	
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
	public ModelAndView pageMyInfo(ModelAndView mv
			, HttpSession session) {
		// 로그인 상태 확인
		Member authInfo = (Member)session.getAttribute("loginInfo");
		System.out.println("[session_authInfo]\n\t" + authInfo);
		if(authInfo == null) {
			System.out.println("\n로그아웃상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		String email = authInfo.getEmail();		
		Member member = service.selectMember(email);		
		
		mv.addObject("member", member);
		mv.setViewName("member/mypage");
		return mv;
	}
	
	@RequestMapping(value="/myProfile", method= RequestMethod.GET)
	public ModelAndView pageSettupInfo(ModelAndView mv			
			, HttpSession session) {
		// 로그인 상태 확인
		Member authInfo = (Member)session.getAttribute("loginInfo");		
		
		if(authInfo == null) {
			System.out.println("\n로그아웃상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}		
		String email = authInfo.getEmail();		
		Member member = service.selectMember(email);		
		/*
			세션값으로 페이지에 멤버 정보를 나타내면 회원 정보 수정 후 세션종료될때까지 바로 업데이트 되지 않음
		 */
		mv.addObject("member", member);
		mv.setViewName("member/myProfile");
		return mv;
	}
	
	@RequestMapping(value="/withdraw", method= RequestMethod.GET)
	public ModelAndView pageMemberWithdraw(ModelAndView mv
			, HttpSession session) {
		// 로그인 상태 확인
		Member authInfo = (Member)session.getAttribute("loginInfo");
		if(authInfo == null) {
			System.out.println("\n로그아웃상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
				
		mv.setViewName("member/withdraw");
		return mv;
	}
	
	@RequestMapping(value="/messagebox", method= RequestMethod.GET)
	public ModelAndView pageMyMessage(ModelAndView mv
			, HttpSession session) {
		// 로그인 상태 확인
		Member authInfo = (Member)session.getAttribute("loginInfo");
		if(authInfo == null) {
			System.out.println("\n로그아웃상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		
		mv.setViewName("member/messagebox");
		return mv;
	}
	
	@RequestMapping(value="/likelist", method= RequestMethod.GET)
	public ModelAndView pageMyFavorite(ModelAndView mv,
			HttpSession session) {
		// 로그인 상태 확인
		Member authInfo = (Member)session.getAttribute("loginInfo");
		if(authInfo == null) {
			System.out.println("\n로그아웃상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
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
	
	@RequestMapping(value="/withdraw", method= RequestMethod.POST)
	public ModelAndView withdrawMember(ModelAndView mv
			, @RequestParam(value="email", defaultValue="nothing") String email
			, RedirectAttributes rttr) {
		System.out.println("email:\t" + email);
		
		if(email == "nothing") {
			rttr.addFlashAttribute("msg", "세션의 이메일을 받아오지 못했습니다.");
			mv.setViewName("redirect:/");
			return mv;
		}		
		
		int result = 0;
		result = service.withdrawMember(email);
		if(result == 0) {
			rttr.addFlashAttribute("msg", "회원탈퇴에 실패했습니다.");
			mv.setViewName("redirect:/");
			return mv;
		}
		
		/* rttr.addFlashAttribute("msg", "회원탈퇴가 성공적으로 요청되었습니다."); */
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@RequestMapping(value="/update", method= RequestMethod.POST)
	public ModelAndView updateMember(ModelAndView mv
			, Member member
			, @RequestParam(name="uploadfile", required=false) MultipartFile multiFile
			, HttpServletRequest req
			, RedirectAttributes rttr) {
		int result = 0;
		
		System.out.println("\n---------- updateMember() ----------");
		System.out.println("original_profile:\t" + member.getOriginal_profile());
		System.out.println("rename_profile:\t" + member.getRename_profile());
		System.out.println("email:\t\t\t" + member.getEmail());
		System.out.println("password:\t\t" + member.getPassword());
		System.out.println("nickname:\t\t" + member.getNickname());
		System.out.println("intro:\t\t\t" + member.getIntro());
		System.out.println("------------------------------------");		
				
		if(member.getOriginal_profile() == null || member.getOriginal_profile().equals("") ) {
			if(member.getRename_profile() !=null && !member.getRename_profile().equals("")) {
				commonfile.removeFile(member.getRename_profile(), req);
			}
			member.setOriginal_profile(null);
			member.setRename_profile(null);			
		}
		if(multiFile != null && multiFile.getOriginalFilename() != null && !multiFile.getOriginalFilename().equals("") ) {
			String rename_filename = commonfile.saveFile(multiFile, req);
			if(rename_filename != null) {  // 저장 성공하면
				if(member.getRename_profile() !=null && !member.getRename_profile().equals("")) {
					commonfile.removeFile(member.getRename_profile(), req);
				}
				member.setOriginal_profile(multiFile.getOriginalFilename());
				member.setRename_profile(rename_filename);				
			}
		}
		
		result = service.updateMember(member);
		if(result == 0) {
			rttr.addFlashAttribute("msg", "프로필 수정에 실패하였습니다.");
			mv.setViewName("redirect:/member/myProfile");
			return mv;
		}		
		
		/* rttr.addFlashAttribute("msg", "프로필 수정에 성공했습니다."); */
		/* 꼭 url 주소 입력하기 */
		mv.setViewName("redirect:/member/myfongdang");
		return mv;
	}	
	
}
