package kh.spring.fongdang.message.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.message.domain.Message;
import kh.spring.fongdang.message.model.service.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private MessageService service;	
	
	@ResponseBody
	@PostMapping(value = "/insert")
	public int insertMessage(Message message, HttpSession session) {
		// 로그인 여부 확인
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { // 로그아웃 상태일 때
			return 0;
		} else {
			message.setSender(loginInfo.getEmail());
			
			if(service.insertMessage(message) < 1) {
				return -1;
			} else {
				return 1;
			}
		}
		
//		message.setSender("홍길동");
//		if(service.insertMessage(message) < 1) {
//			return -1;
//		} else {
//			return 1;
//		}
	}
	
	@ResponseBody
	@PostMapping(value = "/insert/reply")
	public int insertReplyMessage(Message message, HttpSession session) {
		// 로그인 여부 확인
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { // 로그아웃 상태일 때
			return 0;
		} else {
			message.setSender(loginInfo.getEmail());
			
			if(service.insertReplyMessage(message) < 1) {
				return -1;
			} else {
				return 1;
			}
		}
		
//		message.setSender("홍길동");
//		if(service.insertMessage(message) < 1) {
//			return -1;
//		} else {
//			return 1;
//		}
	}
}
