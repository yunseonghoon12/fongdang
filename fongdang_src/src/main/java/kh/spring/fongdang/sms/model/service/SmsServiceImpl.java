package kh.spring.fongdang.sms.model.service;

import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.sms.domain.Sms;
import kh.spring.fongdang.sms.model.dao.SmsDao;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
@PropertySource("classpath:fongdang.properties")
public class SmsServiceImpl implements SmsService{
	@Value("${sms.api_key}")
	private String api_key;
	
	@Value("${sms.api_secret}")
	private String api_secret;
	
	@Value("${sms.from_num}")
	private String from_num;
	
	@Autowired
	private SmsDao dao;
	
	@Override
	public int insertSms(Sms sms) {
		return dao.insertSms(sms);
	}

	@Override
	public int deleteSms(int s_no) {
		return dao.deleteSms(s_no);
	}

	@Override
	@Scheduled(cron = "0 0 0/1 * * *") //1시간 마다 실행
	public void sendMessage() {
		Message coolsms = new Message(api_key, api_secret);
//		HashMap<String, String> params = null;
		
		List<Sms> smsList = dao.selectSmsList();
		for(Sms sendList : smsList) {
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("to", sendList.getS_receiver()); // 수신자 번호
			params.put("from", from_num); // 송신자 번호
			params.put("type", "SMS"); // 메시지 타입
			params.put("text", "알림 신청하신 <" + sendList.getP_name() + ">프로젝트 오픈 1시간 전입니다."); // 문자 메시지 내용
			
			try {
				coolsms.send(params); // 메시지 전송
			} catch (CoolsmsException e) {
				e.printStackTrace();
			}
		}
		
		LocalTime now = LocalTime.now();
		System.out.println(now.getHour() + "시 " + now.getMinute() + "분");
		System.out.println("1시간에 한 번씩 찍기~");
	}

}
