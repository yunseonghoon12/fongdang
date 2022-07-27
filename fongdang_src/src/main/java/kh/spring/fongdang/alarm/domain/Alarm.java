package kh.spring.fongdang.alarm.domain;

import org.springframework.stereotype.Component;

@Component
public class Alarm {
	private int a_no;
	private String email;
	private String a_content;
	private String a_date;
	private String read_yn;
	private int count_readn;
	
	@Override
	public String toString() {
		return "Alarm [a_no=" + a_no + ", email=" + email + ", a_content=" + a_content + ", a_date=" + a_date
				+ ", read_yn=" + read_yn + ", count_readn=" + count_readn + "]";
	}

	public int getCount_readn() {
		return count_readn;
	}

	public void setCount_readn(int count_readn) {
		this.count_readn = count_readn;
	}

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public String getA_date() {
		return a_date;
	}

	public void setA_date(String a_date) {
		this.a_date = a_date;
	}

	public String getRead_yn() {
		return read_yn;
	}

	public void setRead_yn(String read_yn) {
		this.read_yn = read_yn;
	}
}
