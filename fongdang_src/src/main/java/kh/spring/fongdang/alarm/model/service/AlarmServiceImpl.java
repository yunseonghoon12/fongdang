package kh.spring.fongdang.alarm.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.alarm.domain.Alarm;
import kh.spring.fongdang.alarm.model.dao.AlarmDao;

@Service
public class AlarmServiceImpl implements AlarmService{
	@Autowired
	private AlarmDao dao;
	
	@Override
	public int insertAlarm(Alarm alarm) {
		return dao.insertAlarm(alarm);
	}

	@Override
	public int updateReadAlarm(Alarm alarm) {
		return dao.updateReadAlarm(alarm);
	}

	@Override
	public int deleteAlarm(Alarm alarm) {
		return dao.deleteAlarm(alarm);
	}

	@Override
	public List<Alarm> selectAlarmList(String email) {
		return dao.selectAlarmList(email);
	}
	@Override
	public List<Alarm> countAlarm(String email) {
		return dao.countAlarm(email);
	}

}
