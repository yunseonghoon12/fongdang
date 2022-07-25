package kh.spring.fongdang.funding.model.service;

import java.util.List;
import java.util.Map;

import kh.spring.fongdang.alarm.domain.Alarm;
import kh.spring.fongdang.funding.domain.Funding;

public interface FundingService {
	/* 펀딩 상세조회 */
	public Funding selectFunding(int p_no);
	
	/* 펀딩예정 상세조회 */
	public Funding selectBeforeFunding(int p_no, String email);
	
	/* 펀딩 예정 상품 N개 불러오기*/
	public List<Funding> selectPreProducts(int n);
	/* 목표 % 상위 N개 불러오기*/
	public List<Funding> selectRankProducts(int n);
	/* 리펀딩상품 N개 불러오기*/
	public List<Funding> reFundingProducts(int n);
	/* 만료 상품 N개 불러오기*/
	public List<Funding> endProducts(int n);
	/* BEST 상품 N개 불러오기*/
	public List<Funding> bestProducts(int n);
	
	/* 펀딩 예정 상품 불러오기*/
	public List<Funding> selectPreProducts();
	
	/* 펀딩 상품 불러오기*/
	public List<Funding> selectAllProducts(Map<String, String> map);
	/*카테고리 상품 불러오기*/
	public List<Funding> selectCateProducts1(String c1);
	public List<Funding> selectCateProducts2(String c2);
	public List<Funding> selectCateProducts3(String c3);
	public List<Funding> selectCateProducts4(String c4);
	public List<Funding> selectCateProducts5(String c5);
	public List<Funding> selectCateProducts6(String c6);
	/*예정 상품 카테고리 불러오기*/
	public List<Funding> selectCatePreProducts1(String c1);
	public List<Funding> selectCatePreProducts2(String c2);
	public List<Funding> selectCatePreProducts3(String c3);
	public List<Funding> selectCatePreProducts4(String c4);
	public List<Funding> selectCatePreProducts5(String c5);
	public List<Funding> selectCatePreProducts6(String c6);
	
	/* 승인 변경 */
	public int updateFundingApproval(Funding funding, Alarm alarm);
	
	/* 승인 요청 목록 수 세기 */
	public int countApprovalList();
	
	/* 승인 요청 목록 조회 */
	public List<Funding> selectApprovalList(int startRnum, int endRnum);
	
	/* 카테고리 검색 */
	public List<Funding> selectSearchList(String category);
}
