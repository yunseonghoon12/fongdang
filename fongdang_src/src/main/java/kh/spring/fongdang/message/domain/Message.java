package kh.spring.fongdang.message.domain;

import org.springframework.stereotype.Component;

@Component
public class Message {
	private int m_no;
	private String m_content;
	private String sender;
	private String receiver;
	private String m_date;
	private String response_chk;
	
	@Override
	public String toString() {
		return "Message [m_no=" + m_no + ", m_content=" + m_content + ", sender=" + sender + ", receiver=" + receiver
				+ ", m_date=" + m_date + ", response_chk=" + response_chk + "]";
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_content() {
		return m_content;
	}

	public void setM_content(String m_content) {
		this.m_content = m_content;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getM_date() {
		return m_date;
	}

	public void setM_date(String m_date) {
		this.m_date = m_date;
	}

	public String getResponse_chk() {
		return response_chk;
	}

	public void setResponse_chk(String response_chk) {
		this.response_chk = response_chk;
	}
	
	
}
