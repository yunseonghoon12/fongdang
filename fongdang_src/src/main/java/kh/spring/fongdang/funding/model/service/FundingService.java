package kh.spring.fongdang.funding.model.service;

import kh.spring.fongdang.funding.domain.Funding;

public interface FundingService {
	/* 펀딩 상세조회 */
	public Funding selectFunding(int p_no);
	
	/* 펀딩예정 상세조회 */
	public Funding selectBeforeFunding(int p_no);
}
