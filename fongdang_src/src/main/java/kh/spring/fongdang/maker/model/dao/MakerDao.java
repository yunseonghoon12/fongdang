package kh.spring.fongdang.maker.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.maker.domain.Maker;


@Repository
public class MakerDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int insertMaker(Maker maker) {
		return sqlSession.insert("Maker.insertMaker",maker);
	}
	
	
	public Maker selectMaker(String email) {
		return sqlSession.selectOne("Maker.selectMaker",email);
	
	}
	public int updateMaker(Maker maker) {
		return sqlSession.update("Maker.updateMaker",maker);
	}
}
