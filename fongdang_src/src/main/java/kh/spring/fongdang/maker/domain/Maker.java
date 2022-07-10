package kh.spring.fongdang.maker.domain;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class Maker {
	
	private String maker_name;      //메이커명
	private String email;           //이메일    
	private String maker_category;  //메이커구분
	private String maker_phone;     //연락처
	private String maker_email;     //메이커문의이메일
	private String maker_logo;      //메이커로고
	private String maker_kakao_channel; //카카오채널
	private String maker_homepage;      //홈페이지 주소
	private String maker_address1;       //회사주소
	private String maker_address2;       //회사주소
	private String maker_register_num;  //사업자등록번호
	private String maker_license_copy;  //사업자등록증사본
	private int maker_report_cnt;       //신고횟수
	
	private MultipartFile license_copy_file;
	private MultipartFile logo_file;
	
	public String getMaker_name() {
		return maker_name;
	}
	public void setMaker_name(String maker_name) {
		this.maker_name = maker_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMaker_category() {
		return maker_category;
	}
	public void setMaker_category(String maker_category) {
		this.maker_category = maker_category;
	}
	public String getMaker_phone() {
		return maker_phone;
	}
	public void setMaker_phone(String maker_phone) {
		this.maker_phone = maker_phone;
	}
	public String getMaker_email() {
		return maker_email;
	}
	public void setMaker_email(String maker_email) {
		this.maker_email = maker_email;
	}
	public String getMaker_logo() {
		return maker_logo;
	}
	public void setMaker_logo(String maker_logo) {
		this.maker_logo = maker_logo;
	}
	public String getMaker_kakao_channel() {
		return maker_kakao_channel;
	}
	public void setMaker_kakao_channel(String maker_kakao_channel) {
		this.maker_kakao_channel = maker_kakao_channel;
	}
	public String getMaker_homepage() {
		return maker_homepage;
	}
	public void setMaker_homepage(String maker_homepage) {
		this.maker_homepage = maker_homepage;
	}
	
	public String getMaker_register_num() {
		return maker_register_num;
	}
	public void setMaker_register_num(String maker_register_num) {
		this.maker_register_num = maker_register_num;
	}
	public String getMaker_license_copy() {
		return maker_license_copy;
	}
	public void setMaker_license_copy(String maker_license_copy) {
		this.maker_license_copy = maker_license_copy;
	}
	public int getMaker_report_cnt() {
		return maker_report_cnt;
	}
	public void setMaker_report_cnt(int maker_report_cnt) {
		this.maker_report_cnt = maker_report_cnt;
	}
	
	public MultipartFile getLicense_copy_file() {
		return license_copy_file;
	}
	public void setLicense_copy_file(MultipartFile license_copy_file) {
		this.license_copy_file = license_copy_file;
	}
	public MultipartFile getLogo_file() {
		return logo_file;
	}
	public void setLogo_file(MultipartFile logo_file) {
		this.logo_file = logo_file;
	}
	public String getMaker_address1() {
		return maker_address1;
	}
	public void setMaker_address1(String maker_address1) {
		this.maker_address1 = maker_address1;
	}
	public String getMaker_address2() {
		return maker_address2;
	}
	public void setMaker_address2(String maker_address2) {
		this.maker_address2 = maker_address2;
	}
	@Override
	public String toString() {
		return "Maker [maker_name=" + maker_name + ", email=" + email + ", maker_category=" + maker_category
				+ ", maker_phone=" + maker_phone + ", maker_email=" + maker_email + ", maker_logo=" + maker_logo
				+ ", maker_kakao_channel=" + maker_kakao_channel + ", maker_homepage=" + maker_homepage
				+ ", maker_address1=" + maker_address1 + ", maker_address2=" + maker_address2 + ", maker_register_num="
				+ maker_register_num + ", maker_license_copy=" + maker_license_copy + ", maker_report_cnt="
				+ maker_report_cnt + ", license_copy_file=" + license_copy_file + ", logo_file=" + logo_file + "]";
	}
	
}
