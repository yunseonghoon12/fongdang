package kh.spring.fongdang.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.funding.domain.Funding;
import kh.spring.fongdang.member.domain.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSession sqlSession;

	public Member selectLogin(Member member) {
		return sqlSession.selectOne("Member.selectLogin", member);
	}

	public Member selectMember(String email) {		
		return sqlSession.selectOne("Member.selectMember", email);
	}
	
	public int insertMember(Member member) {
		return sqlSession.insert("Member.insertMember", member);
	}

	public int withdrawMember(String email) {
		return sqlSession.update("Member.withdrawMember", email);
	}

	public int updateMember(Member member) {		
		return sqlSession.update("Member.updateMember", member);
	}

	public Member selectFindEmail(String email) {
		return sqlSession.selectOne("Member.selectFindEmail", email);
	}

	public List<Funding> selectLikelist(int currentPage, int fundingLimit, String email) {
		RowBounds rowBounds = new RowBounds((currentPage -1) * fundingLimit, fundingLimit);
		return sqlSession.selectList("Member.selectLikelist", email, rowBounds);
	}

	public int countLikeList(String email) {
		return sqlSession.selectOne("Member.countLikeList", email);
	}

	public List<Funding> selectMyOrderList(String email) {
		return sqlSession.selectList("Member.selectMyOrderList", email);
	}

	public List<Funding> selectMyTotalOrderList(int currentPage, int orderlistLimit, String email) {
		RowBounds rowBounds = new RowBounds((currentPage -1) * orderlistLimit, orderlistLimit);
		return sqlSession.selectList("Member.selectMyTotalOrderList", email, rowBounds);
	}
	
	public int countOrderList(String email) {
		return sqlSession.selectOne("Member.countOrderList", email);
	}

	public List<Funding> selectMakerFunding(String email) {
		return sqlSession.selectList("Member.selectMakerFunding", email);
	}

	public int countMyProject(String email) {
		return sqlSession.selectOne("Member.countMyProject", email);
	}

	public List<Funding> selectMyTotalProject(int currentPage, int projectLimit, String email) {
		RowBounds rowBounds = new RowBounds((currentPage -1) * projectLimit, projectLimit);
		return sqlSession.selectList("Member.selectMyTotalProject", email, rowBounds);
	}

	public Member selectFindPassword(String email) {
		return sqlSession.selectOne("selectFindPassword", email);
	}

	


	
}
