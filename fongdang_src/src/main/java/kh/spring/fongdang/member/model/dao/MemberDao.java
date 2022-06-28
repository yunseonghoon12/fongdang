package kh.spring.fongdang.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.member.domain.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSession sqlSession;

	public Member selectLogin(Member member) {
		return sqlSession.selectOne("Member.selectLogin", member);
	}

	public int insertMember(Member member) {
		return sqlSession.insert("Member.insertMember", member);
	}
}
