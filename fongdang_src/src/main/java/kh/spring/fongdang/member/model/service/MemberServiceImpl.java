package kh.spring.fongdang.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.member.model.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao dao;

	public Member selectLogin(Member member) {		
		return dao.selectLogin(member);
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
}
