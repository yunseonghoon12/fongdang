package kh.spring.fongdang.pick.domain;

import org.springframework.stereotype.Component;

@Component
public class Pick {

	private String eamil; //이메일
	private int p_no;     //상품번호
	
	@Override
	public String toString() {
		return "Pick [eamil=" + eamil + ", p_no=" + p_no + "]";
	}
	public String getEamil() {
		return eamil;
	}
	public void setEamil(String eamil) {
		this.eamil = eamil;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	

}
