package kh.spring.fongdang.report.model.service;

import java.util.List;

import kh.spring.fongdang.report.domain.Report;

public interface ReportService {
	public int insertReport(Report report);
	public int checkReport(Report report);
	public int countReportList();
	public List<Report> selectReportList(int startRnum, int endRnum);
}
