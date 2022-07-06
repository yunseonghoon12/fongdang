package kh.spring.fongdang.review.domain;

import org.springframework.stereotype.Component;

@Component
public class Review {
	private int r_no;
	private int p_no;
	private String profile;
	private String r_writer;
	private String r_date;
	private String r_content;
	
	@Override
	public String toString() {
		return "Review [r_no=" + r_no + ", p_no=" + p_no + ", profile=" + profile + ", r_writer=" + r_writer
				+ ", r_date=" + r_date + ", r_content=" + r_content + "]";
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getR_writer() {
		return r_writer;
	}

	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
}
