package kh.spring.fongdang.funding.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.funding.domain.Funding;
import kh.spring.fongdang.funding.model.dao.FundingDao;


@Service
public class FundingServiceImpl implements FundingService{
	@Autowired
	private FundingDao dao;
	
	@Override
	public Funding selectFunding(int p_no) {
		return dao.selectFunding(p_no);
	}

	@Override
	public Funding selectBeforeFunding(int p_no) {
		return dao.selectBeforeFunding(p_no);
	}
	
}
