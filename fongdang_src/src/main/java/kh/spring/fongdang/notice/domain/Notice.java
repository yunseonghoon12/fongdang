package kh.spring.fongdang.notice.domain;

import org.springframework.stereotype.Component;

@Component
public class Notice {

	private int n_no;
	private	String n_title;
	private String n_content;
	private String n_date;
	private int n_cnt;
	private String n_writer;
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_date() {
		return n_date;
	}
	public void setN_date(String n_date) {
		this.n_date = n_date;
	}
	public int getN_cnt() {
		return n_cnt;
	}
	public void setN_cnt(int n_cnt) {
		this.n_cnt = n_cnt;
	}
	public String getN_writer() {
		return n_writer;
	}
	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	@Override
	public String toString() {
		return "Notice [n_no=" + n_no + ", n_title=" + n_title + ", n_content=" + n_content + ", n_date=" + n_date
				+ ", n_cnt=" + n_cnt + ", n_writer=" + n_writer + "]";
	}
		
	
	
}	
