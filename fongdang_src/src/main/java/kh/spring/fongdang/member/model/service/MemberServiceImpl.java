package kh.spring.fongdang.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.funding.domain.Funding;
import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.member.model.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao dao;

	public Member selectLogin(Member member) {		
		return dao.selectLogin(member);
	}

	public Member selectMember(String email) {
		return dao.selectMember(email);
	}
	
	public int insertMember(Member member) {		
		return dao.insertMember(member);
	}

	public int withdrawMember(String email) {
		return dao.withdrawMember(email);
	}

	public int updateMember(Member member) {
		return dao.updateMember(member);
	}

	public Member selectFindEmail(String email) {	
		return dao.selectFindEmail(email);
	}

	public List<Funding> selectLikelist(int currentPage, int fundingLimit, String email) {
		return dao.selectLikelist(currentPage, fundingLimit, email);
	}

	public int countLikeList(String email) {
		return dao.countLikeList(email);
	}

	public List<Funding> selectMyOrderList(String email) {
		return dao.selectMyOrderList(email);
	}

	public int countOrderList(String email) {
		return dao.countOrderList(email);
	}

	public List<Funding> selectMyTotalOrderList(int currentPage, int orderlistLimit, String email) {
		return dao.selectMyTotalOrderList(currentPage, orderlistLimit, email);
	}

	public List<Funding> selectMakerFunding(String email) {
		return dao.selectMakerFunding(email);
	}

	public int countMyProject(String email) {
		return dao.countMyProject(email);
	}

	public List<Funding> selectMyTotalProject(int currentPage, int projectLimit, String email) {		
		return dao.selectMyTotalProject(currentPage, projectLimit, email);
	}

	public Member selectFindPassword(String email) {
		return dao.selectFindPassword(email);
	}

	

		

}
