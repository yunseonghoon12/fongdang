package kh.spring.fongdang.alarm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.spring.fongdang.alarm.domain.Alarm;
import kh.spring.fongdang.alarm.model.service.AlarmService;
import kh.spring.fongdang.member.domain.Member;

@Controller
@RequestMapping("/alarm")
public class AlarmController {
	@Autowired
	private AlarmService service;
	
	@ResponseBody
	@PostMapping(value = "/list", produces = "application/json; charset=utf8")
	public String selectAlarmList(HttpSession session) {
		// 로그인 여부 확인
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { // 로그아웃 상태일 때
			return "-1";
		} else {
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
				
			return gson.toJson(service.selectAlarmList(loginInfo.getEmail()));
		}
		
//		Gson gson = new GsonBuilder().setPrettyPrinting().create();
//
//		return gson.toJson(service.selectAlarmList("jmh@jmh.com"));
	}
	
	@ResponseBody
	@PostMapping("/update")
	public int updateAlarm(Alarm alarm, HttpSession session) {
		// 로그인 여부 확인
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { // 로그아웃 상태일 때
			return 0;
		} else {
			if(service.updateReadAlarm(alarm) < 1) {
				return -1;
			} else {
				return 1;
			}
		}	
		
//		if(service.updateReadAlarm(alarm) < 1) {
//			return -1;
//		} else {
//			return 1;
//		}
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public int deleteAlarm(Alarm alarm, HttpSession session) {
		// 로그인 여부 확인
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { // 로그아웃 상태일 때
			return 0;
		} else {
			if(service.deleteAlarm(alarm) < 1) {
				return -1;
			} else {
				return 1;
			}
		}	
		
//		if(service.deleteAlarm(alarm) < 1) {
//			return -1;
//		} else {
//			return 1;
//		}
	}
	
//	@ResponseBody
//	@PostMapping("/count")
//	public int countAlarm(HttpSession session) {
//		// 로그인 여부 확인
//		Member loginInfo = (Member)session.getAttribute("loginInfo");
//		if(loginInfo == null) { // 로그아웃 상태일 때
//			return 0;
//		} else {
//			Member member = (Member) session.getAttribute("loginInfo");
//			String email = member.getEmail();
//			service.countAlarm(email);
//
//		}	
//	}
}
