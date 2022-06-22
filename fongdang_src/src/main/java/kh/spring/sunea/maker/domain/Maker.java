package kh.spring.sunea.maker.domain;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class Maker {

	/*
	 * DB MAKER_NAME NOT NULL VARCHAR2(50) EMAIL NOT NULL VARCHAR2(100)
	 * MAKER_CATEGORY NOT NULL CHAR(1) MAKER_PHONE NOT NULL VARCHAR2(20)
	 * MAKER_ACCOUNT NOT NULL VARCHAR2(20) MAKER_EMAIL NOT NULL VARCHAR2(100)
	 * MAKER_LOGO VARCHAR2(200) MAKER_KAKAO_CHANNEL VARCHAR2(200) MAKER_HOMEPAGE
	 * VARCHAR2(200) MAKER_ADDRESS VARCHAR2(500) MAKER_REGISTER_NUM VARCHAR2(15)
	 * MAKER_BANKBOOK_COPY VARCHAR2(200) MAKER_LICENSE_COPY VARCHAR2(200)
	 * MAKER_REPORT_CNT NUMBER
	 */

	private String maker_name;
	private String email;
	private String maker_category;
	private String maker_phone;
	private String maker_account;
	private String maker_email;
	private String maker_logo;
	private String maker_kakao_channel;
	private String maker_homepage;
	private String maker_address;
	private String maker_register_num;
	private String maker_bankbook_copy;
	private String maker_license_copy;
	private int maker_report_cnt;
	
	
	private MultipartFile maker_logo_file;
	private MultipartFile maker_bankbook_copy_file;
	private MultipartFile maker_license_copy_file;
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
	public String getMaker_account() {
		return maker_account;
	}
	public void setMaker_account(String maker_account) {
		this.maker_account = maker_account;
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
	public String getMaker_address() {
		return maker_address;
	}
	public void setMaker_address(String maker_address) {
		this.maker_address = maker_address;
	}
	public String getMaker_register_num() {
		return maker_register_num;
	}
	public void setMaker_register_num(String maker_register_num) {
		this.maker_register_num = maker_register_num;
	}
	public String getMaker_bankbook_copy() {
		return maker_bankbook_copy;
	}
	public void setMaker_bankbook_copy(String maker_bankbook_copy) {
		this.maker_bankbook_copy = maker_bankbook_copy;
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
	public MultipartFile getMaker_logo_file() {
		return maker_logo_file;
	}
	public void setMaker_logo_file(MultipartFile maker_logo_file) {
		this.maker_logo_file = maker_logo_file;
	}
	public MultipartFile getMaker_bankbook_copy_file() {
		return maker_bankbook_copy_file;
	}
	public void setMaker_bankbook_copy_file(MultipartFile maker_bankbook_copy_file) {
		this.maker_bankbook_copy_file = maker_bankbook_copy_file;
	}
	public MultipartFile getMaker_license_copy_file() {
		return maker_license_copy_file;
	}
	public void setMaker_license_copy_file(MultipartFile maker_license_copy_file) {
		this.maker_license_copy_file = maker_license_copy_file;
	}
	@Override
	public String toString() {
		return "Maker [maker_name=" + maker_name + ", email=" + email + ", maker_category=" + maker_category
				+ ", maker_phone=" + maker_phone + ", maker_account=" + maker_account + ", maker_email=" + maker_email
				+ ", maker_logo=" + maker_logo + ", maker_kakao_channel=" + maker_kakao_channel + ", maker_homepage="
				+ maker_homepage + ", maker_address=" + maker_address + ", maker_register_num=" + maker_register_num
				+ ", maker_bankbook_copy=" + maker_bankbook_copy + ", maker_license_copy=" + maker_license_copy
				+ ", maker_report_cnt=" + maker_report_cnt + ", maker_logo_file=" + maker_logo_file
				+ ", maker_bankbook_copy_file=" + maker_bankbook_copy_file + ", maker_license_copy_file="
				+ maker_license_copy_file + "]";
	}
	
}
