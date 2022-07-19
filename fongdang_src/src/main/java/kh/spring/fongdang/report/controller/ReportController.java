package kh.spring.fongdang.report.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.fongdang.common.FileUpload;
import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.report.domain.Report;
import kh.spring.fongdang.report.model.service.ReportService;


@Controller
@RequestMapping("/report")
public class ReportController {
	@Autowired
	private FileUpload commonfile;
	@Autowired
	private ReportService service;
	
	@ResponseBody
	@PostMapping("/insert")
	public int insertReport(Report report, @RequestParam(name = "uploadfile", required = false) MultipartFile file, HttpServletRequest req, HttpSession session) {
		// 로그인 여부 확인
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		if(loginInfo == null) { // 로그아웃 상태일 때
			return 0;
		} else {
			report.setEmail(loginInfo.getEmail());
			
			if(service.checkReport(report) > 0) { // 신고 갯수 확인
				return 2;
			} else {
				if(!file.isEmpty()) { // 파일 존재 여부 확인
					String report_file = commonfile.saveFile(file, req);
					if(report_file != null) { //저장에 성공하면 실행
						report.setReport_file(report_file);
					}
				}
				
				if(service.insertReport(report) < 1) {
					return -1;
				} else {
					return 1;
				}
			}
		}
		
//		report.setEmail("aaa@aaa.com");
//		
//		if(service.checkReport(report) > 0) { // 신고 갯수 확인
//			return 2;
//		} else {
//			if(!file.isEmpty()) { // 파일 존재 여부 확인
//				String report_file = commonfile.saveFile(file, req);
//				if(report_file != null) { //저장에 성공하면 실행
//					System.out.println("파일 저장 완료!");
//					report.setReport_file(report_file);
//				}
//			}
//			
//			if(service.insertReport(report) < 1) {
//				return -1;
//			} else {
//				return 1;
//			}
//		}
	}
}
