package kh.spring.fongdang.maker.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.fongdang.common.ApiRequestUtil;
import kh.spring.fongdang.common.FileUpload;
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

	@Resource(name="fileUpload")
	private FileUpload fileUpload;
	
//maker page 이동 
	@GetMapping("/view") // "maker/Register" 이렇게 이동
	public ModelAndView insertPageMaker(ModelAndView mv, HttpSession session) {
		
		Maker maker = new Maker();
		Member member = (Member) session.getAttribute("loginInfo");
		//maker = makerServiceImpl.selectMaker(member.getEmail());
		mv.addObject("maker", maker);
		mv.setViewName("maker/makerRegister"); // jsp페이지
		return mv;
	}

// maker insert 
	@PostMapping("/insert")
	public ResponseEntity<String> inserMaker(ModelAndView mv
			, Maker mamker
			, HttpServletRequest req
			, HttpSession session
			, RedirectAttributes rttr
			, MultipartHttpServletRequest multipart

	      ) {
		MultipartFile makerLogoFile = multipart.getFile("logo_file");
		MultipartFile makerLicenseCopyFile = multipart.getFile("license_copy_file");
		
		
		String logoFile = fileUpload.saveFile(makerLogoFile, req);
		String licenseFile = fileUpload.saveFile(makerLicenseCopyFile, req);
		 
		logger.debug("=============================s===="+session.getAttribute("loginInfo").toString());
		
		Member member = (Member) session.getAttribute("loginInfo");
		
		logger.debug("================================="+ member.toString());
		

		if (member != null) {
			mamker.setEmail(member.getEmail());
			mamker.setMaker_license_copy_file(logoFile);
			mamker.setMaker_license_copy_file(licenseFile);
		}
		try {
			String result = "";
			int i = makerServiceImpl.insertMaker(mamker);
			if (i == 1) {
				result = "success";
			}else {
				result = "fail";
			}
	        return new ResponseEntity<>(result, HttpStatus.OK);
	    } catch (Exception e) {
	        return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_ACCEPTABLE);
	    }
		
		
		
//		rttr.addFlashAttribute("msg", "메이커 정보 저장되었습니다.");
//		mv.setViewName("product/product");// 상품등록 페이지 이동 
//		return mv;
	}

	// 사업자등록번호 API 
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
