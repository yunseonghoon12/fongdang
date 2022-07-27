package kh.spring.fongdang.admin.model.service;

import java.util.List;

import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.admin.domain.Sales;
import kh.spring.fongdang.common.Criteria;


public interface AdminService {	
	/* 회원 목록 조회 */
	public List<Member> selectMemberList(int currentPage, int memberLimit);
	/* 키워드를 통한 회원 조회 */
	public List<Member> relatedSearch(int currentPage, int memberLimit, String keyword);
	/* 회원 수 조회 */
	public int countMember();
	/* 키워드에 검색된 회원 수 조회 */
	public int countSearchMember(String keyword);
	/* 회원 탈퇴 상태 변경 */
	public int updateWithDrawMember(String[] emails);
	/* 펀딩정산 List 조회  */
	public List<Sales> selectSalesList(Criteria criteria);
	public int selectSalesListCnt();
	/* 펀딩정산 상세 N개 조회  */
	public Sales selectOneSales(String pno);
	/* 문의 갯수 조회 */
	public int countAsk();
	
}
