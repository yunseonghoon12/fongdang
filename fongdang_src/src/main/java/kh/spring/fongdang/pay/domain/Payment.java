package kh.spring.fongdang.pay.domain;

import org.springframework.stereotype.Component;

@Component
public class Payment {
	
	private String pay_method;
	private String merchant_uid;
	private int amount;
	private String buyer_tel;
	private String buyer_addr;
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getBuyer_tel() {
		return buyer_tel;
	}
	public void setBuyer_tel(String buyer_tel) {
		this.buyer_tel = buyer_tel;
	}
	public String getBuyer_addr() {
		return buyer_addr;
	}
	public void setBuyer_addr(String buyer_addr) {
		this.buyer_addr = buyer_addr;
	}
	@Override
	public String toString() {
		return "Payment [pay_method=" + pay_method + ", merchant_uid=" + merchant_uid + ", amount=" + amount
				+ ", buyer_tel=" + buyer_tel + ", buyer_addr=" + buyer_addr + "]";
	}
	
	
}
