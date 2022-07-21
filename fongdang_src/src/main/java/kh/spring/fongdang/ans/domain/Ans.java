package kh.spring.fongdang.ans.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class Ans {
	
	private int ans_no;
	private int ask_no;
	private String ans_content;
	private String ans_date;
	
	
	@Override
	public String toString() {
		return "Answer [ask_no=" + ask_no + ", ans_no=" + ans_no + ", ans_content=" + ans_content + ", ans_date="
				+ ans_date + "]";
	}
	public int getAsk_no() {
		return ask_no;
	}
	public void setAsk_no(int ask_no) {
		this.ask_no = ask_no;
	}
	public int getAns_no() {
		return ans_no;
	}
	public void setAns_no(int ans_no) {
		this.ans_no = ans_no;
	}
	public String getAns_content() {
		return ans_content;
	}
	public void setAns_content(String ans_content) {
		this.ans_content = ans_content;
	}
	public String getAns_date() {
		return ans_date;
	}
	public void setAns_date(String ans_date) {
		this.ans_date = ans_date;
	}

	
	
	
}
