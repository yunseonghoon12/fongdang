package kh.spring.fongdang.alarm.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.alarm.domain.Alarm;

@Repository
public class AlarmDao {
	@Autowired
	private SqlSession session;
	
	public int insertAlarm(Alarm alarm) {
		return session.insert("Alarm.insertAlarm", alarm);
	}
	
	public int updateReadAlarm(Alarm alarm) {
		return session.update("Alarm.updateReadAlarm", alarm);
	}
	
	public int deleteAlarm(Alarm alarm) {
		return session.delete("Alarm.deleteAlarm", alarm);
	}
	public List<Alarm> selectAlarmList(String email) {
		return session.selectList("Alarm.selectAlarmList", email);
	}
	public List<Alarm> countAlarm(String email) {
		return session.selectList("Alarm.countAlarm", email);
	}
}
