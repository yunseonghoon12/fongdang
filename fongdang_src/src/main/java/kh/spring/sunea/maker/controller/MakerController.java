package kh.spring.sunea.maker.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.sunea.common.FileUpload;
import kh.spring.sunea.maker.domain.Maker;
import kh.spring.sunea.maker.model.service.MakerServiceImpl;

@Controller
@RequestMapping("/maker")
public class MakerController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private MakerServiceImpl service;
	
	@Autowired
	private FileUpload commonfile;
	
	@RequestMapping(value = "maker", method = RequestMethod.GET)
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

        mamker.setMaker_logo(commonfile.saveFile(mamker.getMaker_logo_file(), req));
        mamker.setMaker_bankbook_copy(commonfile.saveFile(mamker.getMaker_bankbook_copy_file(), req));
        mamker.setMaker_license_copy(commonfile.saveFile(mamker.getMaker_license_copy_file(), req));
		int result = service.insertMaker(mamker);
        
		mv.setViewName("redirect:/");
		return mv;
	}

}
