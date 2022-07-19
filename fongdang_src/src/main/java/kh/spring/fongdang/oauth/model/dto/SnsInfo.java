package kh.spring.fongdang.oauth.model.dto;

import org.springframework.stereotype.Component;

@Component
public class SnsInfo {
	
	private String sns_email;
	private String sns_name;
	private String sns_nickname;
	private String sns_type;
	private String sns_connect_date;
	
	@Override
	public String toString() {
		return "SnsInfo [sns_email=" + sns_email + ", sns_name=" + sns_name + ", sns_nickname=" + sns_nickname
				+ ", sns_type=" + sns_type + ", sns_connect_date=" + sns_connect_date + "]";
	}

	public String getSns_email() {
		return sns_email;
	}

	public void setSns_email(String sns_email) {
		this.sns_email = sns_email;
	}

	public String getSns_name() {
		return sns_name;
	}

	public void setSns_name(String sns_name) {
		this.sns_name = sns_name;
	}

	public String getSns_nickname() {
		return sns_nickname;
	}

	public void setSns_nickname(String sns_nickname) {
		this.sns_nickname = sns_nickname;
	}

	public String getSns_type() {
		return sns_type;
	}

	public void setSns_type(String sns_type) {
		this.sns_type = sns_type;
	}

	public String getSns_connect_date() {
		return sns_connect_date;
	}

	public void setSns_connect_date(String sns_connect_date) {
		this.sns_connect_date = sns_connect_date;
	}
}
