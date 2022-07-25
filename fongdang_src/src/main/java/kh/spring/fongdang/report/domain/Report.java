package kh.spring.fongdang.report.domain;

import org.springframework.stereotype.Component;

@Component
public class Report {
	private int report_no;
	private String reported_email; //신고당한 메이커
	private String email;
	private int p_no;
	private String p_name;
	private String report_category;
	private String report_content;
	private String report_file;
	private String report_date;
	
	@Override
	public String toString() {
		return "Report [report_no=" + report_no + ",reported_email=" + reported_email + ", email=" + email + ", p_no=" + p_no + ", p_name=" + p_name
				+ ", report_category=" + report_category + ", report_content=" + report_content + ", report_file="
				+ report_file + ", report_date=" + report_date + "]";
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getReported_email() {
		return reported_email;
	}

	public void setReported_email(String reported_email) {
		this.reported_email = reported_email;
	}

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

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getReport_category() {
		return report_category;
	}

	public void setReport_category(String report_category) {
		this.report_category = report_category;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public String getReport_file() {
		return report_file;
	}

	public void setReport_file(String report_file) {
		this.report_file = report_file;
	}

	public String getReport_date() {
		return report_date;
	}

	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}
}
