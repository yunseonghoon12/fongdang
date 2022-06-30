package kh.spring.fongdang.ask.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.ask.domain.Ask;

@Repository
public class AskDao {

	@Autowired
	private SqlSession sqlSession;

	public int insertAsk(Ask ask) {
		return sqlSession.insert("Ask.insertAsk", ask);
	}

	public List<Ask> selectAsk(Ask ask) {
		return sqlSession.selectList("Ask.selectAsk", ask);
	}
}
