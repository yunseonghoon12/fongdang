package kh.spring.fongdang.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.notice.domain.Notice;
import kh.spring.fongdang.notice.model.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@GetMapping("/insertList/{page_no}")
	public ModelAndView NoticeList(ModelAndView mv,@PathVariable("page_no") int page_no, HttpSession session) {
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { 
			 System.out.println("비로그인");
			 mv.setViewName("member/login");
			 return mv;
		}
		int currentPage = 1;
		
		currentPage = page_no;
		System.out.println(currentPage);
		
		
		final int pageSize = 3;  		
		final int pageBlock = 3;  		
		int startPage=0;
		int endPage=0;
		int startRnum=0;
		int entRnum=0;
		
		int totalCnt = 0; 
		totalCnt = service.noticeCount();
		
		System.out.println("총"+totalCnt);
		
		int totalPageCnt = (totalCnt/pageSize) + (totalCnt%pageSize==0 ? 0 : 1);
		if(currentPage%pageBlock == 0) {
			startPage = ((currentPage/pageBlock)-1)*pageBlock + 1;
		} else {
			startPage = (currentPage/pageBlock)*pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if(endPage>totalPageCnt) {
			endPage = totalPageCnt;
		}
		System.out.println("page:"+ startPage +"~"+endPage);
		
		
		startRnum = (currentPage-1)*pageSize + 1;
		entRnum = startRnum + pageSize -1;
		if(entRnum>totalCnt) {
			entRnum = totalCnt;
		}
		System.out.println("rnum:"+ startRnum +"~"+entRnum);
		
		List<Notice> noticeList = service.noticeList(startRnum, entRnum);
		mv.addObject("noticeList",noticeList);
		mv.addObject("startPage",startPage);
		mv.addObject("endPage",endPage);
		mv.addObject("currentPage",currentPage);
		mv.addObject("totalPageCnt",totalPageCnt);
		mv.setViewName("customerCenter/notice");
		
		return mv;
		
	}
	@ResponseBody
	@GetMapping(value = "/delete/{n_no}")
	public int deleteNotice(@PathVariable("n_no")int n_no,HttpServletRequest req, HttpSession session) {
		
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { 
			return 0;
		}else {
			int result = service.deleteNotice(n_no);
			if(result < 1) {
				return -1;
			}else {
			return 1;
		}
		}
	}
}
