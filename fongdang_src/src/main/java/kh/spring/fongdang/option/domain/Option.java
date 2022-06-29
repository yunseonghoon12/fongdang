package kh.spring.fongdang.option.domain;

import org.springframework.stereotype.Component;

@Component
public class Option {
//	
//	OPTION_NO    NOT NULL NUMBER         
//	P_NO         NOT NULL NUMBER         
//	OPTION_NAME  NOT NULL VARCHAR2(600)  
//	OPTION_INFO  NOT NULL VARCHAR2(1000) 
//	OPTION_PRICE NOT NULL NUMBER         
//	OPTION_LIMIT NOT NULL NUMBER         

	private int option_no;       //상품상세번호
	private int p_no;            //상품번호
	private String option_name;  //옵셥이름
	private String option_info;  //옵션정보 
	private int option_price;    //옵션가격
	private int option_limit;    //제한수량
	
	@Override
	public String toString() {
		return "Option [option_no=" + option_no + ", p_no=" + p_no + ", option_name=" + option_name + ", option_info="
				+ option_info + ", option_price=" + option_price + ", option_limit=" + option_limit + "]";
	}
	public int getOption_no() {
		return option_no;
	}
	public void setOption_no(int option_no) {
		this.option_no = option_no;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getOption_name() {
		return option_name;
	}
	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}
	public String getOption_info() {
		return option_info;
	}
	public void setOption_info(String option_info) {
		this.option_info = option_info;
	}
	public int getOption_price() {
		return option_price;
	}
	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}
	public int getOption_limit() {
		return option_limit;
	}
	public void setOption_limit(int option_limit) {
		this.option_limit = option_limit;
	}
	
	

}
