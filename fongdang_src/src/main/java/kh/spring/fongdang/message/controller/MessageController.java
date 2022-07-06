package kh.spring.fongdang.message.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.fongdang.message.domain.Message;
import kh.spring.fongdang.message.model.service.MessageServiceImpl;

@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private MessageServiceImpl service;	
	
	@ResponseBody
	@PostMapping(value = "/insert")
	public int insertMessage(Message message, HttpSession session) {
		// 로그인 완성 되면 주석 풀고 기능 확인
		// 로그인 여부 확인
//		Member loginInfo = (Member)session.getAttribute("loginSsInfo");
//		if(loginInfo == null) { // 로그아웃 상태일 때
//			return 0;
//		} else {
//			message.setSender(loginInfo.getNickname());
//			
//			if(service.insertMessage(message) < 1) {
//				return -1;
//			} else {
//				return 1;
//			}
//		}
		
		message.setSender("홍길동");
//		if(service.insertMessage(message) < 1) {
//			return "fail";
//		} else {
//			return "success";
//		}
		return service.insertMessage(message);
	}
}