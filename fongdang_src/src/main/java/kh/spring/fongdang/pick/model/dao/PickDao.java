package kh.spring.fongdang.pick.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.pick.domain.Pick;

@Repository
public class PickDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertPick(Pick pick) {
		return sqlSession.insert("Pick.insertPick", pick);
	}
	
	  public int deletePick(String p_no) {
		  return sqlSession.delete("Pick.deletePick",p_no);
	  }
}
