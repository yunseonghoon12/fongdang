package kh.spring.fongdang.option.controller;

import java.util.List;

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
import kh.spring.fongdang.funding.model.service.ProductService;
import kh.spring.fongdang.maker.domain.Maker;
import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.option.domain.Option;
import kh.spring.fongdang.option.model.service.OptionService;
import kh.spring.fongdang.option.model.service.OptionServiceImpl;

@Controller
@RequestMapping("/option")
public class OptionController {
	@Autowired
	private OptionService optionService;
	@Autowired
	private ProductService productService;
	
	/* Option page 이동*/
	@GetMapping("/view")
	public ModelAndView insertPageOption(ModelAndView mv, HttpSession session, HttpServletRequest req) {
		int p_no = 0;
		Member member = (Member) session.getAttribute("loginInfo");
		p_no = optionService.selectOneGetPNo(member.getEmail());// 조회문 
		
		Option option = new Option();
		if (req.getParameter("option_no") != null) {
			option.setOption_no(Integer.parseInt(req.getParameter("option_no")));			
			option.setP_no(Integer.parseInt(req.getParameter("p_no")));
			Option optionResult = optionService.selectOption(option);
			mv.addObject("option", optionResult);
			mv.addObject("updateYn", "Y");
		}else {
			mv.addObject("updateYn", "N");
		}
		
		mv.addObject("p_no", p_no);
		mv.setViewName("option/option");// jsp페이지
		return mv;
	}

	/* Option 등록 */
	@PostMapping("/insert")
	public ResponseEntity<String> inserOption(ModelAndView mv
			, Option option
			, HttpSession session
			, RedirectAttributes rttr
			, HttpServletRequest req
			) {

	
		try {
			String result = "";
			
			int option_no = optionService.selectOptionNo(option.getP_no());
			
			if (option_no > 5) {
				return new ResponseEntity<>("over", HttpStatus.OK);
			}
			
			option.setOption_no(option_no);
			int i = optionService.insertOption(option);
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
	
	@GetMapping("/viewList")
	public ModelAndView selectOptionList(ModelAndView mv, HttpSession session, HttpServletRequest req) {
		
		int p_no = 0;
		Member member = (Member) session.getAttribute("loginInfo");
		p_no = optionService.selectOneGetPNo(member.getEmail());// 조회문 
		if (p_no == 0) {
			mv.setViewName("redirect:../product/view");// jsp 화면
			mv.addObject("message", "상품을 등록해주세요.");
			
			return mv;
		}
		List<Option> optionList = optionService.selectOptionList(p_no);
		
		if (optionList.size() > 0) {
			mv.addObject("optionList", optionList);
			mv.setViewName("option/optionList");// jsp페이지	
		}else {
			mv.setViewName("redirect:../option/view");// jsp 화면
		}
		
		return mv;
	}
	
	/* Option 삭제 */
	@PostMapping("/delete")
	public ResponseEntity<String> deleteOption(ModelAndView mv
			, Option option
			, HttpSession session
			, RedirectAttributes rttr
			, HttpServletRequest req
			) {

	
		try {
			String result = "";
			//삭제구현
			int i = optionService.deleteOption(option);
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
