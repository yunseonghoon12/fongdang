package kh.spring.fongdang.ask.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class Ask {
	
	private int ask_no;
	private String email;
	private String ask_title;
	private String ask_category;
	private String ask_content;
	private String ans_content;
	private String ask_date;
	private String reply_yn;
	
	
	
	
	@Override
	public String toString() {
		return "Ask [ask_no=" + ask_no + ", email=" + email + ", ask_title=" + ask_title + ", ask_category="
				+ ask_category + ", ask_content=" + ask_content + ", ans_content=" + ans_content + ", ask_date="
				+ ask_date + ", reply_yn=" + reply_yn + "]";
	}


	public int getAsk_no() {
		return ask_no;
	}


	public void setAsk_no(int ask_no) {
		this.ask_no = ask_no;
	}


	public String getAns_content() {
		return ans_content;
	}


	public void setAns_content(String ans_content) {
		this.ans_content = ans_content;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAsk_title() {
		return ask_title;
	}
	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}
	public String getAsk_category() {
		return ask_category;
	}
	public void setAsk_category(String ask_category) {
		this.ask_category = ask_category;
	}
	public String getAsk_content() {
		return ask_content;
	}
	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}
	public String getAsk_date() {
		return ask_date;
	}
	public void setAsk_date(String ask_date) {
		this.ask_date = ask_date;
	}
	public String getReply_yn() {
		return reply_yn;
	}
	public void setReply_yn(String reply_yn) {
		this.reply_yn = reply_yn;
	}

	

	
	
}
