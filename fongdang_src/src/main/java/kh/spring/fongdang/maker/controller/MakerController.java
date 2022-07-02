package kh.spring.fongdang.maker.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.graalvm.compiler.core.GraalCompiler.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.client.OkHttp3ClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.fongdang.maker.domain.Maker;
import kh.spring.fongdang.maker.model.service.MakerServiceImpl;
import kh.spring.fongdang.member.domain.Member;

@Controller
@RequestMapping("/maker")
public class MakerController {

	@Autowired
	private MakerServiceImpl service;

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
			int result = service.insertMaker(mamker);
		}
		mv.setViewName("redirect:/");
		return mv;
	}
	
	
	
//	public static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");
//	@PostMapping("/Register")
//	public String inserMaker(ModelAndView mv, Maker mamker, HttpServletRequest req) {
//
//		return "";
//	}

}
