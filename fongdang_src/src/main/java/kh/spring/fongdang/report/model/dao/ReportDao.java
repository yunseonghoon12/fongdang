package kh.spring.fongdang.report.model.dao;

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
}
