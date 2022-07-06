package kh.spring.fongdang.option.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.fongdang.funding.domain.Product;
import kh.spring.fongdang.maker.domain.Maker;
import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.option.domain.Option;
import kh.spring.fongdang.option.model.service.OptionServiceImpl;

@Controller
@RequestMapping("/option")
public class OptionController {
	@Autowired
	private OptionServiceImpl optionServiceImpl;

	// Option page 이동
	@GetMapping("/view")
	public ModelAndView insertPageOption(ModelAndView mv, HttpSession session) {
		String p_no = "";
		Member member = (Member) session.getAttribute("loginInfo");
		p_no = optionServiceImpl.selectOneGetPNo(member.getEmail());
		mv.addObject("p_no", p_no);
		mv.setViewName("option/option");// jsp페이지
		return mv;
	}

	// Option insert
	@PostMapping("/insert")
	public ResponseEntity<String> inserOption(ModelAndView mv
			, Option option
			, HttpSession session
			, RedirectAttributes rttr
			, HttpServletRequest req
			) {

		// 상품번호가 같이 들어간다. p_no
		try {
			String result = "";
			int i = optionServiceImpl.insertOption(option);
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
