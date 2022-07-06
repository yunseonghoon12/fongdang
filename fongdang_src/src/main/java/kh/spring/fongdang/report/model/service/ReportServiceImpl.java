package kh.spring.fongdang.report.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.report.domain.Report;
import kh.spring.fongdang.report.model.dao.ReportDao;


@Service
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportDao dao;
	
	@Override
	public int insertReport(Report report) {
		return dao.insertReport(report);
	}

	@Override
	public int checkReport(Report report) {
		return dao.checkReport(report);
	}

}
