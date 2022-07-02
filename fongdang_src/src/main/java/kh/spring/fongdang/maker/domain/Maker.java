package kh.spring.fongdang.maker.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
public class Maker {
	
	private String maker_name;      //메이커명
	private String email;           //이메일    
	private String maker_category;  //메이커구분
	private String maker_phone;     //연락처
	private String maker_email;     //메이커문의이메일
	private String maker_logo;      //메이커로고
	private String maker_kakao_channel; //카카오채널
	private String maker_homepage;      //홈페이지 주소
	private String maker_address;       //회사주소
	private String maker_register_num;  //사업자등록번호
	private String maker_license_copy;  //사업자등록증사본
	private int maker_report_cnt;       //신고횟수
	
	private MultipartFile maker_logo_file;
	private MultipartFile maker_license_copy_file;

}
