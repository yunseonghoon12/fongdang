package kh.spring.fongdang.funding.model.service;

import java.util.List;

import kh.spring.fongdang.funding.domain.Funding;
import kh.spring.fongdang.funding.domain.Product;

public interface FundingService {
	/* 펀딩 상세조회 */
	public Funding selectFunding(int p_no);
	
	/* 펀딩예정 상세조회 */
	public Funding selectBeforeFunding(int p_no, String email);
	
	/* 펀딩 예정 상품 N개 불러오기*/
	public List<Funding> selectPreProducts(int n);
	
	/* 펀딩 예정 상품 불러오기*/
	public List<Funding> selectPreProducts();
	
	/* 펀딩 상품 불러오기*/
	public List<Funding> selectAllProducts();
}
