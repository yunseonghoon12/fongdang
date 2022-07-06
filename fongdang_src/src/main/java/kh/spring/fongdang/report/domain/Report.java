package kh.spring.fongdang.report.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Report {
	private int report_no;
	private String email;
	private int p_no;
	private String report_category;
	private String report_content;
	private String report_file;
	private Timestamp report_date;
	
	@Override
	public String toString() {
		return "Report [report_no=" + report_no + ", email=" + email + ", p_no=" + p_no + ", report_category="
				+ report_category + ", report_content=" + report_content + ", report_file=" + report_file
				+ ", report_date=" + report_date + "]";
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
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

	public Timestamp getReport_date() {
		return report_date;
	}

	public void setReport_date(Timestamp report_date) {
		this.report_date = report_date;
	}
}
