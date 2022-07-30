package kh.spring.fongdang.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.spring.fongdang.member.model.service.MemberService;
import kh.spring.fongdang.message.domain.Message;
import kh.spring.fongdang.message.model.service.MessageService;
import kh.spring.fongdang.oauth.model.bo.KakaoLoginBO;
import kh.spring.fongdang.oauth.model.bo.NaverLoginBO;
import kh.spring.fongdang.oauth.model.dto.SnsInfo;
import kh.spring.fongdang.oauth.model.service.SnsInfoService;
import kh.spring.fongdang.alarm.model.service.AlarmService;
import kh.spring.fongdang.common.FileUpload;
import kh.spring.fongdang.common.MailSendUtil;
import kh.spring.fongdang.funding.domain.Funding;
import kh.spring.fongdang.member.domain.Member;


@Controller
@RequestMapping("/member")
public class MemberController {	
	@Autowired
	private MemberService member_service;
	@Autowired
	private MessageService msgService;
	@Autowired
	private SnsInfoService sns_Service;
	@Autowired
	private AlarmService alarmservice;
	@Autowired 
	private FileUpload commonfile;	
	@Autowired 
	private MailSendUtil mailService;
	@Autowired
	private KakaoLoginBO kakaoLoginBO;
	@Autowired
	private NaverLoginBO naverLoginBO;		
	
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
		// 회원 로그인 상태 확인
		Member authInfo = (Member)session.getAttribute("loginInfo");
		System.out.println("[session_authInfo]\n\t" + authInfo);
		
		if(authInfo == null) {
			System.out.println("\n현재 로그아웃 상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		
		String email = authInfo.getEmail();		
//		1. 서포터 회원 정보
		Member member = member_service.selectMember(email);	
		
//		2. 서포터가 신청한 펀딩 상품
		List<Funding> orderlist = member_service.selectMyOrderList(email);
		System.out.println("\n[orderlist]\n" + orderlist + "\n");
		
//		3. 메이커가 등록한 펀딩 상품
		List<Funding> makerFunding = member_service.selectMakerFunding(email);		
		if(!makerFunding.isEmpty()) {
			System.out.println("〓〓〓〓〓〓〓〓〓〓〓메이커를 등록한 회원입니다.〓〓〓〓〓〓〓");
			System.out.println("\n[maker_info]\n" + makerFunding + "\n");
			mv.addObject("makerFunding", makerFunding);
		}		

//		4. 소셜 회원 체크 : 소셜 로그인시 얻은 토큰을 통해 확인	
		String access_token1 = (String)session.getAttribute("kakaoToken");
		String access_token2 = (String)session.getAttribute("naverToken");		
		
		mv.addObject("alarm",alarmservice.countAlarm(email));
		mv.addObject("kakaoToken", access_token1);
		mv.addObject("naverToken", access_token2);		
		mv.addObject("member", member);
		mv.addObject("orderlist", orderlist);				
		mv.setViewName("member/mypage");
		return mv;
	}
	@RequestMapping(value="/orderlist", method=RequestMethod.GET)
	public ModelAndView pageTotalOrderlist(ModelAndView mv
			, @RequestParam(value="page", defaultValue="1") String currentPageStr
			, HttpSession session) {
		// 회원 로그인 상태 확인
		Member authInfo = (Member)session.getAttribute("loginInfo");
		System.out.println("[session_authInfo]\n\t" + authInfo);
		if(authInfo == null) {
			System.out.println("\n현재 로그아웃 상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		
		String email = authInfo.getEmail();	
		
		int currentPage = 1;		
		int orderLimit = 6;		
		
		try {
			if( currentPageStr != null )
				currentPage = Integer.parseInt(currentPageStr);
		}catch (NumberFormatException e) {
			e.printStackTrace();
		}		 
		
		final int pageSize = 6;  // 한페이지에 보여줄 행
		final int pageBlock = 3;  // 페이징에 나타날 페이지수
		int startPage=0;
		int endPage=0;
		int startNum=0;
		int endNum=0;
		
		int totalCnt = 0; // 총 글 수
		totalCnt = member_service.countOrderList(email);
		System.out.println("\n주문 상품 수 :\t" + totalCnt); 
		
		/* Paging 처리 */
		int totalPageCnt = (totalCnt/pageSize) + (totalCnt%pageSize==0 ? 0 : 1);
		if(currentPage%pageBlock == 0) {
			startPage = ((currentPage/pageBlock)-1)*pageBlock + 1;
		} else {
			startPage = (currentPage/pageBlock)*pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if(endPage>totalPageCnt) {
			endPage = totalPageCnt;
		}
		System.out.println("page:"+ startPage +"~"+endPage);
		
		/* rownum 처리 */
		startNum = (currentPage-1)*pageSize + 1;
		endNum = startNum + pageSize -1;
		if(endNum>totalCnt) {
			endNum = totalCnt;
		}
		System.out.println("rnum:"+ startNum +"~"+endNum);	
		
		List<Funding> result= member_service.selectMyTotalOrderList(currentPage, orderLimit, email);

		mv.addObject("alarm",alarmservice.countAlarm(email));
		mv.addObject("orderlist", result);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("currentPage", currentPage);
		mv.addObject("totalPageCnt", totalPageCnt);
		mv.setViewName("member/myOrderlist");
		return mv;		
	}
	
	@RequestMapping(value="/myproject", method= RequestMethod.GET)
	public ModelAndView pageMyProject(ModelAndView mv
			, @RequestParam(value="page", defaultValue="1") String currentPageStr
			, HttpSession session) {
		// 회원 로그인 상태 확인
		Member authInfo = (Member)session.getAttribute("loginInfo");
		System.out.println("[session_authInfo]\n\t" + authInfo);
		if(authInfo == null) {
			System.out.println("\n현재 로그아웃 상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		
		String email = authInfo.getEmail();	
		
		int currentPage = 1;		
		int projectLimit = 6;		
		
		try {
			if( currentPageStr != null )
				currentPage = Integer.parseInt(currentPageStr);
		}catch (NumberFormatException e) {
			e.printStackTrace();
		}		 
		
		final int pageSize = 6;  // 한페이지에 보여줄 행
		final int pageBlock = 3;  // 페이징에 나타날 페이지수
		int startPage=0;
		int endPage=0;
		int startNum=0;
		int endNum=0;
		
		int totalCnt = 0; // 총 글 수
//		주문 개수
		totalCnt = member_service.countMyProject(email);
		System.out.println("\n오픈한 프로젝트 수 :\t" + totalCnt); 
		
		/* Paging 처리 */
		int totalPageCnt = (totalCnt/pageSize) + (totalCnt%pageSize==0 ? 0 : 1);
		if(currentPage%pageBlock == 0) {
			startPage = ((currentPage/pageBlock)-1)*pageBlock + 1;
		} else {
			startPage = (currentPage/pageBlock)*pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if(endPage>totalPageCnt) {
			endPage = totalPageCnt;
		}
		System.out.println("page:"+ startPage +"~"+endPage);
		
		/* rownum 처리 */
		startNum = (currentPage-1)*pageSize + 1;
		endNum = startNum + pageSize -1;
		if(endNum>totalCnt) {
			endNum = totalCnt;
		}
		System.out.println("rnum:"+ startNum +"~"+endNum);	
		
		List<Funding> result= member_service.selectMyTotalProject(currentPage, projectLimit, email);		
		
		mv.addObject("alarm",alarmservice.countAlarm(email));
		mv.addObject("project", result);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("currentPage", currentPage);
		mv.addObject("totalPageCnt", totalPageCnt);
		mv.setViewName("member/myfundingProject");
		return mv;
	}
	
	@RequestMapping(value="/myProfile", method= RequestMethod.GET)
	public ModelAndView pageSettupInfo(ModelAndView mv			
			, HttpSession session) {
		// 회원 로그인 상태 확인
		Member authInfo = (Member)session.getAttribute("loginInfo");		
		
		if(authInfo == null) {
			System.out.println("\n현재 로그아웃 상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}		
		
		String email = authInfo.getEmail();		
		Member member = member_service.selectMember(email);		
		mv.addObject("alarm", alarmservice.countAlarm(email));
		mv.addObject("member", member);
		mv.setViewName("member/myProfile");
		return mv;
	}
	
	@RequestMapping(value="/withdraw", method= RequestMethod.GET)
	public ModelAndView pageMemberWithdraw(ModelAndView mv
			, HttpSession session) {
		// 회원 로그인 상태 확인
		Member authInfo = (Member)session.getAttribute("loginInfo");
		if(authInfo == null) {
			System.out.println("\n현재 로그아웃 상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		String email = authInfo.getEmail();		
		mv.addObject("alarm",alarmservice.countAlarm(email));		
		mv.setViewName("member/withdraw");
		return mv;
	}
	
	@RequestMapping(value="/messagebox", method= RequestMethod.GET)
	public ModelAndView pageMyMessageBox(ModelAndView mv
			, @RequestParam(value="message_type", defaultValue= "send") String message_type
			, @RequestParam(value="page", defaultValue="1") String currentPageStr
			, HttpSession session) {
		List<Message> result = null;
		
		// 회원 로그인 상태 확인
		Member authInfo = (Member)session.getAttribute("loginInfo");
		if(authInfo == null) {
			System.out.println("\n현재 로그아웃 상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		String email = authInfo.getEmail();		
		String receiver = authInfo.getEmail();
		String sender = authInfo.getEmail();
		
		int currentPage = 1;		
		int messageLimit = 6;		
		
		try {
			if(currentPageStr !=null && !currentPageStr.equals("nothing"))
				currentPage = Integer.parseInt(currentPageStr);
		}catch (NumberFormatException e) {
			e.printStackTrace();
		}		 
		
		final int pageSize = 6;  // 한페이지에 보여줄 행
		final int pageBlock = 3;  // 페이징에 나타날 페이지수
		int startPage=0;
		int endPage=0;
		int startNum=0;
		int endNum=0;
		
		int totalCnt = 0; // 총 글 수
		if(message_type.equals("receive")) {
			totalCnt = msgService.countMyReceiveMessage(receiver);			
		} else {
			totalCnt = msgService.countMySendMessage(sender);			
		}
		System.out.println("\n메시지 총 수 :\t" + totalCnt); 
		
		/* Paging 처리 */
		int totalPageCnt = (totalCnt/pageSize) + (totalCnt%pageSize==0 ? 0 : 1);
		if(currentPage%pageBlock == 0) {
			startPage = ((currentPage/pageBlock)-1)*pageBlock + 1;
		} else {
			startPage = (currentPage/pageBlock)*pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if(endPage>totalPageCnt) {
			endPage = totalPageCnt;
		}
		System.out.println("page:"+ startPage +"~"+endPage);
		
		/* rownum 처리 */
		startNum = (currentPage-1)*pageSize + 1;
		endNum = startNum + pageSize -1;
		if(endNum>totalCnt) {
			endNum = totalCnt;
		}
		System.out.println("rnum:"+ startNum +"~"+endNum);	
		
		if(message_type.equals("receive")) {
			result = msgService.selectReceiveList(currentPage, messageLimit, receiver);			
		} else {
			result = msgService.selectSendList(currentPage, messageLimit, sender);
		}	
		mv.addObject("alarm",alarmservice.countAlarm(email));		
		mv.addObject("messageList", result);
		mv.addObject("message_type", message_type);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("currentPage", currentPage);
		mv.addObject("totalPageCnt", totalPageCnt);
		mv.setViewName("member/messagebox");
		return mv;
	}
	
	@RequestMapping(value="/messagebox/msg", method= RequestMethod.GET)
	public ModelAndView pageMessage(ModelAndView mv
			, Message message
			, @RequestParam(value="m_no", required=false) String m_no
			, HttpSession session) {
		// 회원 로그인 상태 확인
		Member authInfo = (Member)session.getAttribute("loginInfo");
		if(authInfo == null) {
			System.out.println("\n현재 로그아웃 상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		System.out.println("\t\t=>메세지 번호:\t" + m_no + "\n");
		message = msgService.selectMessage(m_no);
		String email = authInfo.getEmail();		
		
		mv.addObject("alarm",alarmservice.countAlarm(email));		
		mv.addObject("message", message);
		mv.setViewName("member/message");
		return mv;
	}
	
	@RequestMapping(value="/likelist", method= RequestMethod.GET)
	public ModelAndView pageMyFavorite(ModelAndView mv
			, @RequestParam(value="page", defaultValue="1") String currentPageStr
			, HttpSession session) {
		// 회원 로그인 상태 확인
		Member authInfo = (Member)session.getAttribute("loginInfo");
		if(authInfo == null) {
			System.out.println("\n현재 로그아웃 상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		
		String email = authInfo.getEmail();
		int currentPage = 1;		
		int fundingLimit = 6;		
		
		try {
			if(currentPageStr !=null)
				currentPage = Integer.parseInt(currentPageStr);
		}catch (NumberFormatException e) {
			e.printStackTrace();
		}		 
		
		final int pageSize = 6;  // 한페이지에 보여줄 행
		final int pageBlock = 3;  // 페이징에 나타날 페이지수
		int startPage=0;
		int endPage=0;
		int startNum=0;
		int endNum=0;
		
		int totalCnt = 0; // 총 글 수		
		totalCnt = member_service.countLikeList(email);
		
		System.out.println("\n좋아요 상품 수 :\t" + totalCnt); 
		
		/* Paging 처리 */
		int totalPageCnt = (totalCnt/pageSize) + (totalCnt%pageSize==0 ? 0 : 1);
		if(currentPage%pageBlock == 0) {
			startPage = ((currentPage/pageBlock)-1)*pageBlock + 1;
		} else {
			startPage = (currentPage/pageBlock)*pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if(endPage>totalPageCnt) {
			endPage = totalPageCnt;
		}
		System.out.println("page:"+ startPage +"~"+endPage);
		
		/* rownum 처리 */
		startNum = (currentPage-1)*pageSize + 1;
		endNum = startNum + pageSize -1;
		if(endNum>totalCnt) {
			endNum = totalCnt;
		}
		System.out.println("rnum:"+ startNum +"~"+endNum);	
		
		List<Funding> likelist = null;
		likelist = member_service.selectLikelist(currentPage, fundingLimit, email);
	
		mv.addObject("alarm",alarmservice.countAlarm(email));		
		mv.addObject("likelist", likelist);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("currentPage", currentPage);
		mv.addObject("totalPageCnt", totalPageCnt);
		mv.setViewName("member/favorite");
		return mv;
	}	
	@RequestMapping(value="/duplication/check", method= RequestMethod.GET )
	@ResponseBody
	public String duplicatedEmailCheck(Member member
			, @RequestParam(value="email", defaultValue = "none") String email) {
		System.out.println("email:\t" + email);
		String msg = "";
		
		if(email.equals("none")) {
			System.out.println("\t=>이메일을 입력하세요.\n");
			msg = "null";
			return msg;
		}
		member = null;
		member = member_service.selectMember(email);
		
		System.out.println("************* 입력한 이메일이 존재하는지 확인합니다 *************");
		if(member == null) {
			System.out.println("===>중복된 이메일이 없습니다.\n");
			msg = "pass";
		} else {
			System.out.println("===>이미 존재하는 이메일입니다.\n");
			msg = "fail";
		}		
		return msg;
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
			rCookie.setMaxAge(60 * 60 * 24 * 30); // 쿠키 유효 시간 30일
		} else {
			rCookie.setMaxAge(0);
		}
		
		Member result = member_service.selectLogin(member);
		if(result == null) {
			rttr.addFlashAttribute("msg", "이메일 또는 비밀번호가 일치하지 않습니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		session.setAttribute("loginInfo", result);		

		mv.setViewName("redirect:/");
		response.addCookie(rCookie);
		return mv;		
	}
	
//	카카오 로그인	
	@RequestMapping(value="/login/oauth/kakao", method=RequestMethod.GET)
	public String kakaoLogin(Model model
			, SnsInfo sns_info
			, Member new_snsUser
			, @RequestParam(value="code", required = false) String code
			, HttpSession session) {
		String msg = "";		
		
		System.out.println("\n[code]\n\t=>" + code);
		String access_token = kakaoLoginBO.getAccessToken(code); 	
		
		HashMap<String, Object> userInfo = kakaoLoginBO.getUserInfo(access_token);
		if(userInfo == null) {			
			msg = "동의항목에 모두 동의해야 소셜 계정을 이용할 수 있습니다. 계속해서 오류 발생시 관리자에게 문의해주세요";
			model.addAttribute("msg", msg);
			return "member/errorPage";		
		}
		System.out.println("##################[KAKAO LOGIN]##################");
		System.out.println("\t\t=>[KAKAO]access_Token:\t" + access_token);
		System.out.println("\t\t=>nickname:\t" + userInfo.get("nickname"));
		System.out.println("\t\t=>email:\t" + userInfo.get("email") + "\n");		
		
		Gson gson = new GsonBuilder()
				.setPrettyPrinting()
				.create();
		System.out.println("[userInfo]\n\t"+gson.toJson(userInfo));
		
		// TODO : 카카오 토큰 세션에 저장 이후 내 정보 구현하기 
		String email = (String)userInfo.get("email");
		String nickname = (String)userInfo.get("nickname");
		String name = (String)userInfo.get("nickname");
		String sns_type = "KAKAO";
		
		sns_info.setSns_email(email);
		sns_info.setSns_name(name);
		sns_info.setSns_nickname(nickname);
		sns_info.setSns_type(sns_type);
		
		/** 1) 기존 회원인지 체크 **/
		Member member = null; 
		member = member_service.selectMember(email);
		System.out.println("\n************** 기존 회원인지 체크 **************");
		if(member == null) {	
			/** 2) 기존 회원이 아닌 경우 **/
			System.out.println("\t=>퐁당 회원이 아닙니다.\n");
			new_snsUser.setEmail(email);
			new_snsUser.setNickname(nickname);
			new_snsUser.setName(name);
			
			/** 2-1) 우선 테이블(MEMBER)에 받아온 소셜 정보를 추가 **/
			int result1 = member_service.insertMember(new_snsUser);				
			if(result1 == 0) {
				System.out.println(">>>>>퐁당 회원 가입 실패\n" + result1);
			} else {
				System.out.println(">>>>>퐁당 회원 가입 성공\n" + result1 + "\n");
			}			
			/** 2-2) 소셜 테이블(SNS_INFO)에 소셜정보들을 따로 보관 **/
			int result2 = sns_Service.insertSnsUser(sns_info);			
			if(result2 == 0) {
				System.out.println("#######KAKAO 회원정보 입력 실패");
			} else {
				System.out.println("#######KAKAO 회원정보 입력 성공");
			}			
			
			member = member_service.selectMember(email);
		} else {
			/** 3) 기존 회원인 경우 **/
			System.out.println("=>기존에 가입한 퐁당 회원입니다.\n" + member + "\n");
			System.out.println("###############메인 페이지로 이동합니다.");			
			
		}
		System.out.println("\n세션에 가져갈 회원정보\n[member]\n\t=>" + member + "\n");
		
		session.setAttribute("kakaoToken", access_token);	// 페이지에 보낼 소셜 정보가 담긴 세션		
		session.setAttribute("loginInfo", member);			// 페이지에 보낼 회원 정보가 담긴 세션	
				
		return "redirect:/" ;	
	}
	
	@RequestMapping("/login/getNaverAuthUrl")
	@ResponseBody
	public String getNaverAuthUrl(HttpSession session) {
		// 네이버 로그인을 위한 토큰 발급
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);	
		System.out.println("\n##################naverAuthUrl:\t" + naverAuthUrl);			
		
		return naverAuthUrl;
	}
	
	@RequestMapping(value="/login/oauth/naver/callback", method=RequestMethod.GET)
	 public String naverCallback(Model model
	    		, @RequestParam String code
				, @RequestParam String state
				, SnsInfo sns_info
				, Member new_snsUser
				, HttpSession session) throws IOException, ParseException {
	    	/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
			OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);			
			String access_token = oauthToken.getAccessToken(); // 토큰
			String msg = "";
			
			// 1. 로그인 사용자 정보를 읽어옴, json구조
			String apiResult = naverLoginBO.getUserProfile(oauthToken);		
			if(apiResult == null) {
				msg = "동의항목에 모두 동의해야 소셜 계정을 이용할 수 있습니다. 계속해서 오류 발생시 관리자에게 문의해주세요";
				model.addAttribute("msg", msg);
				return "member/errorPage";
			}
			
			// 2. String형식인 apiResult를 json형태로 바꿈
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject)obj;			
			
			// 3. 데이터 파싱
			JSONObject response_obj = (JSONObject)jsonObj.get("response");		
			// response의 nickname 값 파싱
			
			String nickname = (String)response_obj.get("nickname");
			String email = (String)response_obj.get("email");
			String name = (String)response_obj.get("name");		
			String sns_type = "NAVER";
			
			System.out.println("\n##################[NAVER LOGIN]##################");
			System.out.println("\t=>[NAVER]accessToken:\t" + access_token);		
			System.out.println("\t=>nickname:\t" + nickname);
			System.out.println("\t=>email:\t" + email);
			System.out.println("\t=>name:\t\t" + name + "\n");
			
			sns_info.setSns_email(email);
			sns_info.setSns_name(name);
			sns_info.setSns_nickname(nickname);
			sns_info.setSns_type(sns_type);
			
			/** 1) 기존 회원 확인인지 체크 **/
			Member member = null; 
			member = member_service.selectMember(email);
			System.out.println("\n************** 기존 회원인지 체크 **************");
			if(member == null) { 
				/** 2) 기존 회원이 아닌 경우 **/
				System.out.println("\t=>퐁당 회원이 아닙니다.\n");
				new_snsUser.setEmail(email);
				new_snsUser.setName(name);
				new_snsUser.setNickname(nickname);
				/** 2-1) 테이블(MEMBER)에 받아온 소셜 정보를 추가 **/
				int result1 = member_service.insertMember(new_snsUser);
				if(result1 == 0) {
					System.out.println(">>>>>퐁당 회원 가입 실패\n" + result1);
				} else {
					System.out.println(">>>>>퐁당 회원 가입 성공\n" + result1 + "\n");
				}			
				/** 2-2) 소셜 테이블(SNS_INFO)에 소셜정보들을 따로 관리 **/
				int result2 = sns_Service.insertSnsUser(sns_info);			
				if(result2 == 0) {
					System.out.println("#######NAVER 회원정보 입력 실패");
				} else {
					System.out.println("#######NAVER 회원정보 입력 성공");
				}			
				
				member = member_service.selectMember(email);				
			} else {
				/** 1-2) 기존 회원인 경우 **/
				System.out.println("=>기존에 가입한 퐁당 회원입니다.\n" + member + "\n");
				System.out.println("###############메인 페이지로 이동합니다.");			
				
			}
			System.out.println("\n세션에 가져갈 회원정보\n[member]\n\t=>" + member + "\n");
			
			session.setAttribute("loginInfo", member);			// 페이지에 보낼 회원 정보가 담긴 세션
			session.setAttribute("naverToken", access_token);	// 페이지에 보낼 소셜 정보가 담긴 세션
			session.setAttribute("oauthToken", oauthToken);	 	// 소셜 계정의 정보가 담긴 세션
			return "redirect:/";
	    }

	
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws IOException {
		OAuth2AccessToken oauthToken = (OAuth2AccessToken)session.getAttribute("oauthToken");
		String access_token = (String)session.getAttribute("naverToken");		
		System.out.println("\n\n[NAVER에서 로그인시 받은 access_token]\n\t=>" + access_token + "\n");
		
		if(oauthToken != null) {	
			naverLoginBO.deleteInfo(oauthToken, access_token);
		}
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/find/email", method=RequestMethod.POST)
	@ResponseBody
	public Member selectFindEmail(
			 @RequestParam(value="email", required = false) String email) {
		String msg = "";
		Member result = null;		
				
		result = member_service.selectFindEmail(email);
		if(result == null) {
			result = new Member();		
			msg = "퐁당에 등록되지 않은 이메일입니다.";
		} else {
			msg = "회원으로 등록된 이메일 아이디입니다.";					
		}
		System.out.println("\n[이메일 인증요청]");
		System.out.println(email+ "는 " + msg);
		System.out.println("\n[member:\t" + result);
		
		return result;
	}
	
	@RequestMapping(value="/authentication", method=RequestMethod.POST, produces="application/text;charset=utf8" )
	@ResponseBody
	public String mailCheck(
			@RequestParam(value="email", required = false) String email) {
		System.out.println("[이메일 인증요청]");
		System.out.println("email:\t" + email);
		return mailService.joinEmail(email);
	}
	
	@RequestMapping(value="/find/password", method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Member selectFindPwd(
			@RequestParam(value="email", required = false) String email) {
		System.out.println("인증요청 이메일:\t" + email);		
		Member member = null;
		
		member = member_service.selectFindPassword(email);
		if(member == null) {
			member = new Member();
		} 
		
		System.out.println("\n[member]\n" + member + "\n");
		return member;
	}
	
	@RequestMapping(value="/find/email/confirm", method=RequestMethod.POST)
	@ResponseBody
	public int isExistMember(
			@RequestParam(value="email", required = false) String email) {
		System.out.println("인증요청 이메일:\t" + email);		
		Member member = null;
		SnsInfo social_member = null;

		
		social_member = sns_Service.selectSnsUser(email);	
		System.out.println("\n[social_member]\n" + social_member + "\n");		
		if(social_member != null) { 
			// 1. 소셜 회원인 경우
			System.out.println("checked as a social member");
			return 1;
		}
		
		member = member_service.selectFindPassword(email);
		System.out.println("\n[member]\n" + member + "\n");		
		if(member != null) { 
			// 2. 기존 회원 경우
			System.out.println("checked as a existing member"); 
			return 0;
		} else { 
			// 3. 가입하지 않은 회원인 경우
			System.out.println("member is not exist");
			return -1;
		} 
	}
	
	@RequestMapping(value="/register.do", method= RequestMethod.POST)
	public ModelAndView insertMember(ModelAndView mv
			, @RequestParam(value="chk_agree", defaultValue="false") Boolean agree
			, Member member
			, RedirectAttributes rttr) {				
		
		int result = 0;
		result = member_service.insertMember(member);
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
		result = member_service.withdrawMember(email);
		if(result == 0) {
			rttr.addFlashAttribute("msg", "회원탈퇴에 실패했습니다.");
			mv.setViewName("redirect:/");
			return mv;
		}
				
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@RequestMapping(value="/update", method= RequestMethod.POST)
	public ModelAndView updateMember(ModelAndView mv
			, Member member
			, @RequestParam(name="profile", required=false) String existProfile
			, @RequestParam(name="uploadfile", required=false) MultipartFile file
			, HttpServletRequest req
			, RedirectAttributes rttr) {
		int result = 0;
		
		System.out.println("\n---------- updateMember() ----------");
		System.out.println("profile:\t" + member.getProfile());		
		System.out.println("email:\t\t\t" + member.getEmail());
		System.out.println("password:\t\t" + member.getPassword());
		System.out.println("nickname:\t\t" + member.getNickname());
		System.out.println("intro:\t\t\t" + member.getIntro());
		System.out.println("------------------------------------");			
						
		
		if(file != null && file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
			String profile = commonfile.saveFile(file, req);
			if(profile != null) {
				if(member.getProfile() != null && !member.getProfile().equals("")) {
					commonfile.removeFile(member.getProfile(), req);
				}
			}
			System.out.println("파일 저장 완료!");				
			member.setProfile(profile);
		}
		
		result = member_service.updateMember(member);
		if(result == 0) {
			rttr.addFlashAttribute("msg", "프로필 수정에 실패하였습니다.");
			mv.setViewName("redirect:/member/myProfile");
			return mv;
		}				
		
		mv.setViewName("redirect:/member/myfongdang");
		return mv;
	}	
	
}
