package kh.spring.fongdang.funding.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.fongdang.common.FileUpload;
import kh.spring.fongdang.funding.domain.Product;
import kh.spring.fongdang.funding.model.service.ProductServiceImpl;
import kh.spring.fongdang.member.domain.Member;



@Controller
@RequestMapping("/product")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	@Autowired
	private ProductServiceImpl productServiceImpl;
	
	//@Resource(name="ProductServiceImpl")
	//private ProductServiceImpl productServiceImpl1;
	
	@Resource(name="fileUpload")
	private FileUpload fileUpload;
	
	//펀딩상품 page 이동 	
	@GetMapping("/view")
	public ModelAndView insertPageProduct(ModelAndView mv,HttpSession session, HttpServletRequest req) {
		
		Member member = (Member) session.getAttribute("loginInfo");
		Product product= productServiceImpl.selectOneGetMakerName(member.getEmail()); //조회 
		mv.addObject("product", product);
		
		mv.setViewName("product/product");// jsp 화면 
		return mv;
	}
	//펀딩상품 insert 
	@PostMapping("/insert")
	public ResponseEntity<String> insertProduct(ModelAndView mv
			, Product product			
			, HttpServletRequest req
			, HttpSession session
			, RedirectAttributes rttr
			, MultipartHttpServletRequest multipart

			) {
	
		if (multipart.getFile("thumbnail_file").getSize() > 0) {
			MultipartFile pThumbnailFile = multipart.getFile("thumbnail_file");
			String thumbnailFile = fileUpload.saveFile(pThumbnailFile, req);
			product.setP_thumbnail(thumbnailFile);
		}
		if (multipart.getFile("certification_file").getSize() > 0) {
			MultipartFile pCcertificationFile = multipart.getFile("certification_file");
			String certificationFile = fileUpload.saveFile(pCcertificationFile, req);
			product.setP_certification(certificationFile);
		}
		
		try {	
			String result = "";
			int i = productServiceImpl.insertProduct(product);
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
	
	@PostMapping("/update")
	public ResponseEntity<String> updateProduct(ModelAndView mv
			, Product product			
			, HttpServletRequest req
			, HttpSession session
			, RedirectAttributes rttr
			, MultipartHttpServletRequest multipart

			) {
	
		if (multipart.getFile("thumbnail_file").getSize() > 0) {
			MultipartFile pThumbnailFile = multipart.getFile("thumbnail_file");
			String thumbnailFile = fileUpload.saveFile(pThumbnailFile, req);
			product.setP_thumbnail(thumbnailFile);
		}
		if (multipart.getFile("certification_file").getSize() > 0) {
			MultipartFile pCcertificationFile = multipart.getFile("certification_file");
			String certificationFile = fileUpload.saveFile(pCcertificationFile, req);
			product.setP_certification(certificationFile);
		}
		
		try {	
			String result = "";
			int i = productServiceImpl.updateProduct(product);
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
