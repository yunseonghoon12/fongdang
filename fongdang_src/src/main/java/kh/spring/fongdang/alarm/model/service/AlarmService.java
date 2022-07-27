package kh.spring.fongdang.alarm.model.service;

import java.util.List;

import kh.spring.fongdang.alarm.domain.Alarm;

public interface AlarmService {
	/* 알람 삽입 */
	public int insertAlarm(Alarm alarm);
	/* 알람 읽음여부수정 */
	public int updateReadAlarm(Alarm alarm);
	/* 알람 삭제 */
	public int deleteAlarm(Alarm alarm);
	/* 알람 리스트 조회 */
	public List<Alarm> selectAlarmList(String email);
	/* 알람 갯수 조회 */
	public List<Alarm> countAlarm(String email);
}
