package kh.spring.fongdang.admin.model.service;

import java.util.List;

import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.admin.domain.Sales;
public interface AdminService {
	
	/* 회원 목록 조회 */
	public List<Member> selectMemberList(int currentPage, int memberLimit);
	/* 키워드를 통한 회원 조회 */
	public List<Member> relatedSearch(int currentPage, int memberLimit, String keyword);
	/* 회원 수 조회 */
	public int countMember();
	/* 회원 탈퇴 상태 변경 */
	public int updateWithDrawMember(String[] emails);
	
	public List<Sales> selectSalesLiset();
	public Sales selectOneSales(String pno);
}
