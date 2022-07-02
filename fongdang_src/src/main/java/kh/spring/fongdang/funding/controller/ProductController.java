package kh.spring.fongdang.funding.controller;

import java.net.http.HttpRequest;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.HomeController;
import kh.spring.fongdang.funding.domain.Product;
import kh.spring.fongdang.funding.model.service.ProductService;
import kh.spring.fongdang.funding.model.service.ProductServiceImpl;
import kh.spring.fongdang.option.domain.Option;

@Controller
@RequestMapping("/product")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	public ProductService service;
	
	//펀딩상품 page 이동 	
	@GetMapping("/product.pag")
	public ModelAndView insertPageProduct(ModelAndView mv) {
		 mv.setViewName("product/product");// jsp 화면 
		return mv;
	}
	//펀딩상품 insert 
	@PostMapping("/product.do")
	public ModelAndView insertProduct(ModelAndView mv
			,HttpServletRequest request
			) {
		Product product	 = new Product();
		Option option=new Option();
		try {
			
			
			for (String key: request.getParameterMap().keySet()) {
				logger.debug(" key : "+key + ", pram : "+request.getParameter(key));
			}
	
			String  maker_name= request.getParameter("maker_name");
			String  category_id= request.getParameter("category_id");
			String  p_name= request.getParameter("p_name");
			String  p_thumbnail= request.getParameter("p_thumbnail");
			String  p_summary= request.getParameter("p_summary");
			String  p_story= request.getParameter("p_story");
			String  p_certification= request.getParameter("p_certification");
			String  start_day= request.getParameter("start_day");
			String  end_day= request.getParameter("end_day");
			String  payment_plan= request.getParameter("payment_plan");
			String  delivery_date= request.getParameter("delivery_date");
			
			String  option_name= request.getParameter("option_name");
			//String  option_name= request.getParameter("option_name");
	//		private int option_no;       //상품상세번호
	//		private int p_no;            //상품번호
	//		private String option_name;  //옵셥이름
	//		private String option_info;  //옵션정보 
	//		private int option_price;    //옵션가격
	//		private int option_limit;    //제한수량
			
			
			product.setMaker_name(maker_name);
			
			//product.
		
			service.insertProduct(product);
		}catch (Exception e) {
			// TODO: handle exception
		}
		mv.setViewName("redirect:/"); //
		return mv;
	}
	
	
	
	
}
