package kh.spring.fongdang.maker.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.fongdang.maker.domain.Maker;
import kh.spring.fongdang.maker.model.service.MakerServiceImpl;


@Controller
@RequestMapping("/maker")
public class MakerController {
	
	
 @Autowired
 private MakerServiceImpl service;
 
 @RequestMapping(value="maker", method=RequestMethod.GET)
 public ModelAndView insertPageMaker(ModelAndView mv) {
	 mv.setViewName("maker/maker");
	 return mv;
 }
	
 @PostMapping("/insert")
	public ModelAndView inserMaker(ModelAndView mv
			,Maker mamker
			,HttpServletRequest req
			,HttpSession session
			,RedirectAttributes rttr
			) throws Throwable {

//     mamker.setMaker_logo(commonfile.saveFile(mamker.getMaker_logo_file(), req));
//     mamker.setMaker_bankbook_copy(commonfile.saveFile(mamker.getMaker_bankbook_copy_file(), req));
//     mamker.setMaker_license_copy(commonfile.saveFile(mamker.getMaker_license_copy_file(), req));
		int result = service.insertMaker(mamker);
     
		mv.setViewName("redirect:/");
		return mv;
	}
 
	
}
