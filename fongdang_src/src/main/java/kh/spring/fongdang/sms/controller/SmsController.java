package kh.spring.fongdang.sms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.fongdang.sms.model.service.SmsService;
import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.sms.domain.Sms;

@Controller
@RequestMapping("/sms")
public class SmsController {
	@Autowired
	private SmsService service;
	
	@ResponseBody
	@PostMapping("/insert")
	public int insertSms(Sms sms, HttpSession session) {
		// 로그인 여부 확인
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { // 로그아웃 상태일 때
			return 0;
		} else {
			sms.setEmail(loginInfo.getEmail());
			if(service.insertSms(sms) < 1) {
				return -1;
			} else {
				return 1;
			}
		}
		
//		sms.setEmail("aaa@aaa.com");
//		if(service.insertSms(sms) < 1) {
//			return -1;
//		} else {
//			return 1;
//		}
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public int deleteSms(int s_no, HttpSession session) {
		// 로그인 여부 확인
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { // 로그아웃 상태일 때
			return 0;
		} else {
			if(service.deleteSms(s_no) < 1) {
				return -1;
			} else {
				return 1;
			}
		}
		
//		if(service.deleteSms(s_no) < 1) {
//			return -1;
//		} else {
//			return 1;
//		}
	}
}
