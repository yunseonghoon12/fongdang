package kh.spring.fongdang.sms.domain;

import org.springframework.stereotype.Component;

@Component
public class Sms {
	private int s_no;
	private String s_receiver;
	private int p_no;
	private String email;
	private String p_name;
	
	@Override
	public String toString() {
		return "Sms [s_no=" + s_no + ", s_receiver=" + s_receiver + ", p_no=" + p_no + ", email=" + email + ", p_name="
				+ p_name + "]";
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getS_receiver() {
		return s_receiver;
	}

	public void setS_receiver(String s_receiver) {
		this.s_receiver = s_receiver;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
}
