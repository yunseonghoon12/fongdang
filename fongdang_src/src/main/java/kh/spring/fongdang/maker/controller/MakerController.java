package kh.spring.fongdang.maker.controller;

import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.fongdang.common.ApiRequestUtil;
import kh.spring.fongdang.maker.domain.Maker;
import kh.spring.fongdang.maker.model.service.MakerServiceImpl;
import kh.spring.fongdang.member.domain.Member;

@Controller
@RequestMapping("/maker")
public class MakerController {

	private static final Logger logger = LoggerFactory.getLogger(MakerController.class);
	
	@Resource(name="makerServiceImpl")
	private MakerServiceImpl makerServiceImpl;
	
	@Resource(name="apiRequestUtil")
	private ApiRequestUtil apiRequestUtil;   

//maker page 이동 
	@GetMapping("/Register") // "maker/Register" 이렇게 이동
	public ModelAndView insertPageMaker(ModelAndView mv) {
		mv.setViewName("maker/makerRegister"); // jsp페이지
		return mv;
	}

// maker insert 
	@PostMapping("/Register")
	public ModelAndView inserMaker(ModelAndView mv, Maker mamker, HttpServletRequest req, HttpSession session,
			RedirectAttributes rttr
//			, @RequestParam(name = "maker_logo_file", required = false) MultipartFile file1
	) {

		Member member = (Member) session.getAttribute("loginSSInfo");
		if (member == null) {
			rttr.addFlashAttribute("msg", "로그인 후 글쓰기 가능합니다.");
			mv.setViewName("redirect:/login"); //
			return mv;
		}

//     mamker.setMaker_logo(commonfile.saveFile(mamker.getMaker_logo_file(), req));
//     mamker.setMaker_license_copy(commonfile.saveFile(mamker.getMaker_license_copy_file(), req));
//	 Member member = (Member)session.getAttribute("loginInfo");
		if (member != null) {
			mamker.setEmail(member.getEmail());
			int result = makerServiceImpl.insertMaker(mamker);
		}
		mv.setViewName("redirect:/");
		return mv;
	}

	@PostMapping("/licenseCheck")
	public ResponseEntity<String> inserMaker(ModelAndView mv, HttpServletRequest req) {
		
		String url = "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=yokAkHtjTw0vyvU9zRTnifTovmWD2Zl8cR57jk85VMqARcRRe%2Fdbu%2B1Agt%2BN%2FU7SXynB4NukTFd4qE4k5%2FMGRQ%3D%3D";
		JSONObject jo = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		jarr.put(req.getParameter("bNo"));
		jo.put("b_no", jarr);
		
		String result = apiRequestUtil.requestPost(url, jo.toString());
		
		try {
	        return new ResponseEntity<>(result, HttpStatus.OK);
	    } catch (Exception e) {
	        return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_ACCEPTABLE);
	    }
	}

}
