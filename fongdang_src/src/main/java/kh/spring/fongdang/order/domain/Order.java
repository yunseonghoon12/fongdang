package kh.spring.fongdang.order.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Order {
	private int order_no;
	private int p_no;
	private int option_no;
	private String email;
	private String order_name;
	private String order_phone;
	private String order_address;
	private String total_price;
	private Date payment_plan;
	private String pay_method;
	@Override
	public String toString() {
		return "Order [order_no=" + order_no + ", p_no=" + p_no + ", option_no=" + option_no + ", email=" + email
				+ ", order_name=" + order_name + ", order_phone=" + order_phone + ", order_address=" + order_address
				+ ", total_price=" + total_price + ", payment_plan=" + payment_plan + ", pay_method=" + pay_method
				+ "]";
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getOption_no() {
		return option_no;
	}
	public void setOption_no(int option_no) {
		this.option_no = option_no;
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
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public Date getPayment_plan() {
		return payment_plan;
	}
	public void setPayment_plan(Date payment_plan) {
		this.payment_plan = payment_plan;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	
	
}
