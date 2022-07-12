package kh.spring.fongdang.sms.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.sms.domain.Sms;

@Repository
public class SmsDao {
	@Autowired
	private SqlSession session;

	public int insertSms(Sms sms) {
		return session.insert("Sms.insertSms", sms);
	}

	public int deleteSms(int s_no) {
		return session.delete("Sms.deleteSms", s_no);
	}

	public List<Sms> selectSmsList() {
		return session.selectList("Sms.selectSmsList");
	}
}
