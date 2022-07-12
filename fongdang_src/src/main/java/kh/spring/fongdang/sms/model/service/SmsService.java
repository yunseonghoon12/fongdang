package kh.spring.fongdang.sms.model.service;

import kh.spring.fongdang.sms.domain.Sms;

public interface SmsService {
	public int insertSms(Sms sms);
	public int deleteSms(int s_no);
	public void sendMessage();
}
