package kh.spring.fongdang.report.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.report.domain.Report;


@Repository
public class ReportDao {
	@Autowired
	private SqlSession session;
	
	public int insertReport(Report report) {
		return session.insert("Report.insertReport", report);
	}
	
	public int checkReport(Report report) {
		return session.selectOne("Report.checkReport", report);
	}
	
	public int countReportList() {
		return session.selectOne("Report.countReportList");
	}
	
	public List<Report> selectReportList(int startRnum, int endRnum) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRnum", startRnum);
		map.put("endRnum", endRnum);
		
		return session.selectList("Report.selectReportList", map);
	}
}
