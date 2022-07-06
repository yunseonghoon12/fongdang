package kh.spring.fongdang.report.model.service;

import kh.spring.fongdang.report.domain.Report;

public interface ReportService {
	public int insertReport(Report report);
	public int checkReport(Report report);
}
