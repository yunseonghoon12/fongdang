package kh.spring.fongdang.maker.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import kh.spring.fongdang.maker.model.service.MakerService;
import kh.spring.fongdang.member.domain.Member;

@Controller
@RequestMapping("/maker")
public class MakerController {

	private static final Logger logger = LoggerFactory.getLogger(MakerController.class);
	
	@Autowired
	private MakerService makerService;
	
	@Autowired
	private ApiRequestUtil apiRequestUtil;   

	@Autowired
	private FileUpload fileUpload;
	
	/* maker page 이동  */
	@GetMapping("/view") // "maker/Register" 이렇게 이동
	public ModelAndView insertPageMaker(ModelAndView mv, HttpSession session, HttpServletRequest req) {
		
		Maker maker = new Maker();
		Member member = (Member) session.getAttribute("loginInfo");
		
		if(member != null) { // 회원이 null 아니면 
			//메이커 등록시 등록된 메이커있는지 조회 
			maker = makerService.selectMaker(member.getEmail().toString());			
			
			if (maker != null) {
				mv.addObject("updateYn", "Y");
				
			}else {
				mv.addObject("updateYn", "N");
			}
		}
		
		mv.addObject("maker", maker);
		mv.addObject("message", req.getParameter("message"));
		mv.setViewName("maker/makerRegister"); // jsp페이지
		return mv;
	}

	/* maker 등록 */
	@PostMapping("/insert")
	public ResponseEntity<String> inserMaker(ModelAndView mv
			, Maker mamker
			, HttpServletRequest req
			, HttpSession session
			, RedirectAttributes rttr
			, MultipartHttpServletRequest multipart
	      ) {
		
		if (multipart.getFile("logo_file").getSize() > 0) {
			MultipartFile makerLogoFile = multipart.getFile("logo_file");
			String logoFile = fileUpload.saveFile(makerLogoFile, req);
			mamker.setMaker_license_copy(logoFile);
		}
		if (multipart.getFile("license_copy_file").getSize() > 0) {
			MultipartFile makerLicenseCopyFile = multipart.getFile("license_copy_file");
			String licenseFile = fileUpload.saveFile(makerLicenseCopyFile, req);
			mamker.setMaker_license_copy(licenseFile);			
		}
				
		Member member = (Member) session.getAttribute("loginInfo");
		
		if (member != null) {
			mamker.setEmail(member.getEmail());
		}
		
		try {
			String result = "";
			int i = makerService.insertMaker(mamker);
			if (i == 1) {
				result = "success";
			}else {
				result = "fail";
			}
	        return new ResponseEntity<>(result, HttpStatus.OK);
	    } catch (Exception e) {
	        return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_ACCEPTABLE);
	    }
	}

	/* 사업자등록번호 API */
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

	/* maker 수정등록 */	
	@PostMapping("/update")
	public ResponseEntity<String> updateMaker(ModelAndView mv
			, Maker mamker
			, HttpServletRequest req
			, HttpSession session
			, RedirectAttributes rttr
			, MultipartHttpServletRequest multipart
	      ) {
		
		if (multipart.getFile("logo_file").getSize() > 0) {
			MultipartFile makerLogoFile = multipart.getFile("logo_file");
			String logoFile = fileUpload.saveFile(makerLogoFile, req);
			mamker.setMaker_license_copy(logoFile);
		}
		if (multipart.getFile("license_copy_file").getSize() > 0) {
			MultipartFile makerLicenseCopyFile = multipart.getFile("license_copy_file");
			String licenseFile = fileUpload.saveFile(makerLicenseCopyFile, req);
			mamker.setMaker_license_copy(licenseFile);			
		}
		
		Member member = (Member) session.getAttribute("loginInfo");
		
		if (member != null) {
			mamker.setEmail(member.getEmail());	
		}
		try {
			String result = "";
			int i = makerService.updateMaker(mamker);
			if (i == 1) {
				result = "success";
			}else {
				result = "fail";
			}
	        return new ResponseEntity<>(result, HttpStatus.OK);
	    } catch (Exception e) {
	        return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_ACCEPTABLE);
	    }
		
	}
}
