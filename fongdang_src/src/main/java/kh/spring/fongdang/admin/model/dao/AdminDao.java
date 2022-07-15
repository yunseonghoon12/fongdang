package kh.spring.fongdang.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.admin.domain.Sales;

@Repository
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(AdminDao.class);
	
	public List<Member> selectMemberList(int currentPage, int memberLimit) {
		RowBounds rowBounds = new RowBounds((currentPage -1) * memberLimit, memberLimit);
		return sqlSession.selectList("Admin.selectMemberList", null, rowBounds);
	}

	public List<Member> relatedSearch(int currentPage, int memberLimit, String keyword) {
		RowBounds rowBounds = new RowBounds((currentPage -1) * memberLimit, memberLimit);
		return sqlSession.selectList("Admin.relatedSearch", keyword, rowBounds);
	}
	
	public int countMember() {
		return sqlSession.selectOne("Admin.countMember");
	}

	public int countSearchMember(String keyword) {
		return sqlSession.selectOne("Admin.countSearchMember", keyword);
	}
	
	public int updateWithDrawMember(String email) {
		return sqlSession.update("Admin.updateWithDrawMember", email);
	}	
	/*List */
	public List<Sales> selectSalesLiset() {
		return sqlSession.selectList("Sales.selectSalesLiset");
	}
	
	/* salesOne*/
	public Sales selectOneSales(String p_no) {
		
		logger.debug("###############################################################");
		logger.debug("p_no = "+p_no);
		return sqlSession.selectOne("Sales.selectOneSales",p_no);
	}
}
