package kh.spring.fongdang.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.admin.domain.Sales;
import kh.spring.fongdang.admin.model.dao.AdminDao;
import kh.spring.fongdang.common.Criteria;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao dao;

	public List<Member> selectMemberList(int currentPage, int memberLimit) {
		return dao.selectMemberList(currentPage, memberLimit);
	}

	public int countMember() {
		return dao.countMember();
	}

	public int countSearchMember(String keyword) {		
		return dao.countSearchMember(keyword);
	}	

	public int updateWithDrawMember(String[] emails) {
		int result =0;
		
		for(int i=0; i<emails.length; i++) {
			System.out.println("email:\t" + emails[i]);
			result = dao.updateWithDrawMember(emails[i]);
			if(result == 0) {
				System.out.println(emails[i]+"의 회원탈퇴 명령이 실패했습니다.");							
				break;
			} 
		} 		
		return result;
	}

	public List<Member> relatedSearch(int currentPage, int memberLimit, String keyword) {
		return dao.relatedSearch(currentPage, memberLimit, keyword);
	}
	
	@Override/* 펀딩정산 List 조회  */
	public List<Sales> selectSalesList(Criteria criteria) {
		return dao.selectSalesList(criteria);
	}
	
	@Override/* 펀딩정산 List 조회  */
	public int selectSalesListCnt() {
		return dao.selectSalesListCnt();
	}

	@Override
	public Sales selectOneSales(String pno) {
		return dao.selectOneSales(pno);
	}
	public int countAsk() {
		return dao.countAsk();
	}

}
