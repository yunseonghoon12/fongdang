package kh.spring.fongdang.pay.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Pay {
	
	private String pay_no;
	private String order_no;
	private String p_no;
	private String email;
	private String order_name;
	private String order_phone;
	private String order_address;
	private String total_sum;
	private String payment_method;
	
	
	@Override
	public String toString() {
		return "Pay [pay_no=" + pay_no + ", order_no=" + order_no + ", p_no=" + p_no + ", email=" + email
				+ ", order_name=" + order_name + ", order_phone=" + order_phone + ", order_address=" + order_address
				+ ", total_sum=" + total_sum + ", payment_method=" + payment_method + "]";
	}
	public String getPay_no() {
		return pay_no;
	}
	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getTotal_sum() {
		return total_sum;
	}
	public void setTotal_sum(String total_sum) {
		this.total_sum = total_sum;
	}
	public String getPayment_method() {
		return payment_method;
	}
	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}
	
	
}
