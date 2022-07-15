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

import kh.spring.fongdang.member.model.service.MemberServiceImpl;
import kh.spring.fongdang.message.domain.Message;
import kh.spring.fongdang.message.model.service.MessageServiceImpl;
import kh.spring.fongdang.oauth.NaverLoginBO;
import kh.spring.fongdang.oauth.service.KakaoService;
import kh.spring.fongdang.common.FileUpload;

import kh.spring.fongdang.common.MailSendUtil;
import kh.spring.fongdang.funding.domain.Funding;
import kh.spring.fongdang.member.domain.Member;

@Controller
@RequestMapping("/member")
public class MemberController {	
	@Autowired
	private MemberServiceImpl service;
	@Autowired
	private MessageServiceImpl msgService;
	@Autowired 
	private FileUpload commonfile;	
	@Autowired 
	private MailSendUtil mailService;
	@Autowired
	private KakaoService kakao;
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
		// 로그인 상태 확인
		Member authInfo = (Member)session.getAttribute("loginInfo");
		System.out.println("[session_authInfo]\n\t" + authInfo);
		if(authInfo == null) {
			System.out.println("\n현재 로그아웃 상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		
		String email = authInfo.getEmail();		
//		1. 퐁당 회원 정보
		Member member = service.selectMember(email);	
		
//		2. 서포터가 신청한 펀딩 상품
		List<Funding> orderlist = service.selectMyOrderList(email);
		System.out.println("\n[orderlist]\n" + orderlist + "\n");
		
//		3. 메이커가 등록한 펀딩 상품
		List<Funding> makerFunding = service.selectMakerFunding(email);
		System.out.println("\n[maker_info]\n" + makerFunding + "\n");


		mv.addObject("member", member);
		mv.addObject("orderlist", orderlist);
		mv.addObject("makerFunding", makerFunding);		
		mv.setViewName("member/mypage");
		return mv;
	}
	@RequestMapping(value="/orderlist", method=RequestMethod.GET)
	public ModelAndView pageTotalOrderlist(ModelAndView mv
			, @RequestParam(value="page", defaultValue="1") String currentPageStr
			, HttpSession session) {
		// 로그인 상태 확인
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
		totalCnt = service.countOrderList(email);
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
		
		List<Funding> result= service.selectMyTotalOrderList(currentPage, orderLimit, email);

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
		// 로그인 상태 확인
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
		totalCnt = service.countMyProject(email);
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
		
		List<Funding> result= service.selectMyTotalProject(currentPage, projectLimit, email);		
		
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
		// 로그인 상태 확인
		Member authInfo = (Member)session.getAttribute("loginInfo");		
		
		if(authInfo == null) {
			System.out.println("\n현재 로그아웃 상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}		
		
		String email = authInfo.getEmail();		
		Member member = service.selectMember(email);		
		
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
			System.out.println("\n현재 로그아웃 상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
				
		mv.setViewName("member/withdraw");
		return mv;
	}
	
	@RequestMapping(value="/messagebox", method= RequestMethod.GET)
	public ModelAndView pageMyMessageBox(ModelAndView mv
//			, HttpServletRequest request
			, @RequestParam(value="message_type", defaultValue= "sender") String message_type
			, @RequestParam(value="page", defaultValue="1") String currentPageStr
			, HttpSession session) {
		List<Message> result = null;
		
		// 로그인 유효성 확인
		Member authInfo = (Member)session.getAttribute("loginInfo");
		if(authInfo == null) {
			System.out.println("\n현재 로그아웃 상태입니다.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}

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
			, @RequestParam(value="m_no", required=false) String m_no) {
		Message message = null;		
		
		System.out.println("\t\tm_no:\t" + m_no + "\n");
		
		
		message = msgService.selectMessage(m_no);
		
		mv.addObject("message", message);
		mv.setViewName("member/message");
		return mv;
	}
	@RequestMapping(value="/likelist", method= RequestMethod.GET)
	public ModelAndView pageMyFavorite(ModelAndView mv
			, @RequestParam(value="page", defaultValue="1") String currentPageStr
			, HttpSession session) {
		// 로그인 상태 확인
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
		totalCnt = service.countLikeList(email);
		
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
		likelist = service.selectLikelist(currentPage, fundingLimit, email);
		
		mv.addObject("likelist", likelist);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("currentPage", currentPage);
		mv.addObject("totalPageCnt", totalPageCnt);
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
			rCookie.setMaxAge(60 * 60 * 24 * 30); // 쿠키 유효 시간 30일
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
	
//	카카오 로그인
	@RequestMapping(value="/login/oauth/kakao", method=RequestMethod.GET)
	public String kakaoLogin(
			@RequestParam(value="code", required = false) String code
			, HttpServletRequest request
			, HttpSession session) {
		System.out.println("\n#############" + code);
		String access_Token = kakao.getAccessToken(code); 	
		
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("\n###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email") + "\n");
		
		Gson gson = new GsonBuilder()
				.setPrettyPrinting()
				.create();
		
		// TODO : 카카오 토큰 세션에 저장 이후 내 정보 구현하기 
		session.setAttribute("kakaoToken", access_Token);
		request.setAttribute("kakaoInfo", userInfo);
		System.out.println(gson.toJson(userInfo));
		return "member/testPage";
		
	}
	
	
// 네이버 로그인	
	@RequestMapping(value="/login/oauth/naver", method=RequestMethod.GET)
	public ModelAndView naverLogin(HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);		
		return new ModelAndView("member/register", "url", naverAuthUrl);
	}
	
	@RequestMapping(value="/login/oauth/naver/callback", method=RequestMethod.GET)
	 public String naverCallback(Model model
	    		,@RequestParam String code
				, @RequestParam String state
				, HttpSession session) throws IOException, ParseException {
//	        String message = "Simple Callback Page";
//	        return new ModelAndView("callback", "message", message);
	    	/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
			OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);			
			String access_token = oauthToken.getAccessToken(); // 토큰
			
			System.out.println("###########accessToken:\t" + access_token + "\n");		
			
			// 1. 로그인 사용자 정보를 읽어옴, json구조
			String apiResult = naverLoginBO.getUserProfile(oauthToken);		
			/** 
			apiResult json 구조		
			{	"resultcode":"00", 
				"message":"success", 
				"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}		
			**/
			
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
			
			System.out.println("###########nickname:\t" + nickname);
			System.out.println("###########email:\t" + email);
			System.out.println("###########name:\t" + name + "\n");
			// 4. 파싱 닉네임 세션으로 저장
			session.setAttribute("sessionId", nickname);
			
//			https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=CLIENT_ID&client_secret=CLIENT_SECRET&access_token=ACCESS_TOKEN
			session.setAttribute("access_token", access_token);
			
			model.addAttribute("result", apiResult);
			model.addAttribute("nickname", nickname);
			model.addAttribute("email", email);
			model.addAttribute("name", name);
			return "member/testPage";
	    }
// 구글 로그인
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		String kakaoToken =  (String)session.getAttribute("kakaoToken");
		System.out.println("\nToken :" + kakaoToken);
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/find/email", method=RequestMethod.POST)
	@ResponseBody
	public Member selectFindEmail(
			 @RequestParam(value="email", required = false) String email) {
		String msg = "";
		Member result = null;		
				
		result = service.selectFindEmail(email);
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
	public String mailCheck(@RequestParam(value="email", required = false) String email) {
		System.out.println("[이메일 인증요청]");
		System.out.println("email:\t" + email);
		return mailService.joinEmail(email);
	}
	
	@RequestMapping(value="/find/password", method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Member selectFindPwd(
			@RequestParam(value="email", required = false) String email) {
		System.out.println("받은 이메일:" + email);		
		Member member = null;
		
		member = service.selectFindPassword(email);
		if(member == null) {
			member = new Member();
		} 
		
		System.out.println("\n[member]\n\t" + member);
		return member;
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
