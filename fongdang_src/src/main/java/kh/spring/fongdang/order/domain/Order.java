package kh.spring.fongdang.order.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Order {
	private long order_no;
	private int p_no;
	private int option_no;
	private int amount;
	private String payment_plan;
	private int total_price;
	private String email;
	public long getOrder_no() {
		return order_no;
	}
	public void setOrder_no(long order_no) {
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getPayment_plan() {
		return payment_plan;
	}
	public void setPayment_plan(String payment_plan) {
		this.payment_plan = payment_plan;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Order [order_no=" + order_no + ", p_no=" + p_no + ", option_no=" + option_no + ", amount=" + amount
				+ ", payment_plan=" + payment_plan + ", total_price=" + total_price + ", email=" + email + "]";
	}

	
	
	
	
	
}
