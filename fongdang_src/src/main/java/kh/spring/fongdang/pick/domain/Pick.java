package kh.spring.fongdang.pick.domain;

import org.springframework.stereotype.Component;

@Component
public class Pick {

	private String email; // 이메일
	private int p_no; // 상품번호
	private String pick_yn; // 상품번호
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getPick_yn() {
		return pick_yn;
	}
	public void setPick_yn(String pick_yn) {
		this.pick_yn = pick_yn;
	}
	@Override
	public String toString() {
		return "Pick [email=" + email + ", p_no=" + p_no + ", pick_yn=" + pick_yn + "]";
	}


}
