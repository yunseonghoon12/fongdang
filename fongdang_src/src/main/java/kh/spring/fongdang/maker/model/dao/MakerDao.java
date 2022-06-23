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
	
}
